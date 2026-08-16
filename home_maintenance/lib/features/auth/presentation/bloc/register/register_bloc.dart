import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import '../../models/phone_input.dart';

part 'register_bloc.freezed.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.phoneChanged(String phone) = _PhoneChanged;
  const factory RegisterEvent.submit() = _Submit;
}

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(PhoneInput.pure()) PhoneInput phone,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool showErrors,
  }) = _RegisterState;
}

extension RegisterStateX on RegisterState {
  bool get isValid => Formz.validate([phone]);
}

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<_PhoneChanged>(_onPhoneChanged);
    on<_Submit>(_onSubmit);
  }

  void _onPhoneChanged(_PhoneChanged event, Emitter<RegisterState> emit) {
    final phone = PhoneInput.dirty(event.phone);
    emit(state.copyWith(
      phone: phone,
      status: FormzSubmissionStatus.initial,
    ));
  }

  void _onSubmit(_Submit event, Emitter<RegisterState> emit) {
    emit(state.copyWith(showErrors: true));
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
