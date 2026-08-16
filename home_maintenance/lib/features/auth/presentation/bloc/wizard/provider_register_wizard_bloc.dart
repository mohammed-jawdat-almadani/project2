import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/category_model.dart';
import '../../../domain/usecases/get_categories_usecase.dart';
import '../../models/name_input.dart';
import '../../models/specialization_input.dart';
import '../../models/services_input.dart';
import '../../models/file_input.dart';
import '../../models/password_input.dart';
import '../../models/confirm_password_input.dart';
import '../../models/terms_input.dart';

part 'provider_register_wizard_bloc.freezed.dart';

@freezed
class ProviderRegisterWizardEvent with _$ProviderRegisterWizardEvent {
  const factory ProviderRegisterWizardEvent.loadCategories() = _LoadCategories;
  const factory ProviderRegisterWizardEvent.firstNameChanged(String firstName) = _FirstNameChanged;
  const factory ProviderRegisterWizardEvent.lastNameChanged(String lastName) = _LastNameChanged;
  const factory ProviderRegisterWizardEvent.specializationChanged(CategoryModel specialization) = _SpecializationChanged;
  const factory ProviderRegisterWizardEvent.serviceAdded(CategoryModel service) = _ServiceAdded;
  const factory ProviderRegisterWizardEvent.serviceRemoved(CategoryModel service) = _ServiceRemoved;
  const factory ProviderRegisterWizardEvent.personalPhotoChanged(XFile? file) = _PersonalPhotoChanged;
  const factory ProviderRegisterWizardEvent.idFrontChanged(XFile? file) = _IdFrontChanged;
  const factory ProviderRegisterWizardEvent.idBackChanged(XFile? file) = _IdBackChanged;
  const factory ProviderRegisterWizardEvent.passwordChanged(String password) = _PasswordChanged;
  const factory ProviderRegisterWizardEvent.confirmPasswordChanged(String confirmPassword) = _ConfirmPasswordChanged;
  const factory ProviderRegisterWizardEvent.termsAcceptedChanged(bool isAccepted) = _TermsAcceptedChanged;
  const factory ProviderRegisterWizardEvent.nextStep() = _NextStep;
  const factory ProviderRegisterWizardEvent.previousStep() = _PreviousStep;
  const factory ProviderRegisterWizardEvent.submit() = _Submit;
}

@freezed
abstract class ProviderRegisterWizardState with _$ProviderRegisterWizardState {
  const factory ProviderRegisterWizardState({
    @Default(1) int currentStep,
    @Default([]) List<CategoryModel> categories,
    @Default(false) bool isCategoriesLoading,
    @Default(NameInput.pure()) NameInput firstName,
    @Default(NameInput.pure()) NameInput lastName,
    @Default(SpecializationInput.pure()) SpecializationInput specialization,
    @Default(ServicesInput.pure()) ServicesInput services,
    @Default(FileInput.pure()) FileInput personalPhoto,
    @Default(FileInput.pure()) FileInput idFront,
    @Default(FileInput.pure()) FileInput idBack,
    @Default(PasswordInput.pure()) PasswordInput password,
    @Default(ConfirmPasswordInput.pure()) ConfirmPasswordInput confirmPassword,
    @Default(TermsInput.pure()) TermsInput termsAccepted,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool showStep1Errors,
    @Default(false) bool showStep2Errors,
    @Default(false) bool showStep3Errors,
  }) = _ProviderRegisterWizardState;
}

extension ProviderRegisterWizardStateX on ProviderRegisterWizardState {
  bool get isStep1Valid => 
      Formz.validate([firstName, lastName, specialization, services]);
  
  bool get isStep2Valid => 
      Formz.validate([personalPhoto, idFront, idBack]);
      
  bool get isStep3Valid => 
      Formz.validate([password, confirmPassword, termsAccepted]);
}

@injectable
class ProviderRegisterWizardBloc extends Bloc<ProviderRegisterWizardEvent, ProviderRegisterWizardState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  ProviderRegisterWizardBloc(this._getCategoriesUseCase) : super(const ProviderRegisterWizardState()) {
    on<_LoadCategories>(_onLoadCategories);
    on<_FirstNameChanged>(_onFirstNameChanged);
    on<_LastNameChanged>(_onLastNameChanged);
    on<_SpecializationChanged>(_onSpecializationChanged);
    on<_ServiceAdded>(_onServiceAdded);
    on<_ServiceRemoved>(_onServiceRemoved);
    on<_PersonalPhotoChanged>(_onPersonalPhotoChanged);
    on<_IdFrontChanged>(_onIdFrontChanged);
    on<_IdBackChanged>(_onIdBackChanged);
    on<_PasswordChanged>(_onPasswordChanged);
    on<_ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<_TermsAcceptedChanged>(_onTermsAcceptedChanged);
    on<_NextStep>(_onNextStep);
    on<_PreviousStep>(_onPreviousStep);
    on<_Submit>(_onSubmit);
  }

  Future<void> _onLoadCategories(_LoadCategories event, Emitter<ProviderRegisterWizardState> emit) async {
    emit(state.copyWith(isCategoriesLoading: true));
    final result = await _getCategoriesUseCase(const NoParams());
    result.fold(
      (failure) => emit(state.copyWith(isCategoriesLoading: false)),
      (categories) => emit(state.copyWith(isCategoriesLoading: false, categories: categories)),
    );
  }

  void _onFirstNameChanged(_FirstNameChanged event, Emitter<ProviderRegisterWizardState> emit) {
    final firstName = NameInput.dirty(event.firstName);
    emit(state.copyWith(firstName: firstName));
  }

  void _onLastNameChanged(_LastNameChanged event, Emitter<ProviderRegisterWizardState> emit) {
    final lastName = NameInput.dirty(event.lastName);
    emit(state.copyWith(lastName: lastName));
  }

  void _onSpecializationChanged(_SpecializationChanged event, Emitter<ProviderRegisterWizardState> emit) {
    final specialization = SpecializationInput.dirty(event.specialization);
    // Reset services when specialization changes
    final services = const ServicesInput.dirty([]);
    emit(state.copyWith(specialization: specialization, services: services));
  }

  void _onServiceAdded(_ServiceAdded event, Emitter<ProviderRegisterWizardState> emit) {
    final currentServices = List<CategoryModel>.from(state.services.value);
    if (!currentServices.any((s) => s.id == event.service.id)) {
      currentServices.add(event.service);
    }
    final services = ServicesInput.dirty(currentServices);
    emit(state.copyWith(services: services));
  }

  void _onServiceRemoved(_ServiceRemoved event, Emitter<ProviderRegisterWizardState> emit) {
    final currentServices = List<CategoryModel>.from(state.services.value);
    currentServices.removeWhere((s) => s.id == event.service.id);
    final services = ServicesInput.dirty(currentServices);
    emit(state.copyWith(services: services));
  }

  void _onPersonalPhotoChanged(_PersonalPhotoChanged event, Emitter<ProviderRegisterWizardState> emit) {
    final personalPhoto = FileInput.dirty(event.file);
    emit(state.copyWith(personalPhoto: personalPhoto));
  }

  void _onIdFrontChanged(_IdFrontChanged event, Emitter<ProviderRegisterWizardState> emit) {
    final idFront = FileInput.dirty(event.file);
    emit(state.copyWith(idFront: idFront));
  }

  void _onIdBackChanged(_IdBackChanged event, Emitter<ProviderRegisterWizardState> emit) {
    final idBack = FileInput.dirty(event.file);
    emit(state.copyWith(idBack: idBack));
  }

  void _onPasswordChanged(_PasswordChanged event, Emitter<ProviderRegisterWizardState> emit) {
    final password = PasswordInput.dirty(event.password);
    final confirmPassword = ConfirmPasswordInput.dirty(
      originalPassword: password.value,
      value: state.confirmPassword.value,
    );
    emit(state.copyWith(password: password, confirmPassword: confirmPassword));
  }

  void _onConfirmPasswordChanged(_ConfirmPasswordChanged event, Emitter<ProviderRegisterWizardState> emit) {
    final confirmPassword = ConfirmPasswordInput.dirty(
      originalPassword: state.password.value,
      value: event.confirmPassword,
    );
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void _onTermsAcceptedChanged(_TermsAcceptedChanged event, Emitter<ProviderRegisterWizardState> emit) {
    final termsAccepted = TermsInput.dirty(event.isAccepted);
    emit(state.copyWith(termsAccepted: termsAccepted));
  }

  void _onNextStep(_NextStep event, Emitter<ProviderRegisterWizardState> emit) {
    if (state.currentStep == 1) {
      if (state.isStep1Valid) {
        emit(state.copyWith(currentStep: 2, showStep1Errors: false));
      } else {
        emit(state.copyWith(showStep1Errors: true));
      }
    } else if (state.currentStep == 2) {
      if (state.isStep2Valid) {
        emit(state.copyWith(currentStep: 3, showStep2Errors: false));
      } else {
        emit(state.copyWith(showStep2Errors: true));
      }
    }
  }

  void _onPreviousStep(_PreviousStep event, Emitter<ProviderRegisterWizardState> emit) {
    if (state.currentStep > 1) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void _onSubmit(_Submit event, Emitter<ProviderRegisterWizardState> emit) {
    if (state.currentStep == 3) {
      if (state.isStep3Valid) {
        emit(state.copyWith(showStep3Errors: false, status: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(showStep3Errors: true));
      }
    }
  }
}
