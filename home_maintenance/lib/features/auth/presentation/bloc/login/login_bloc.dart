import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import '../../models/phone_input.dart';
import '../../models/password_input.dart';

part 'login_bloc.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.phoneChanged(String phone) = _PhoneChanged;
  const factory LoginEvent.passwordChanged(String password) = _PasswordChanged;
  const factory LoginEvent.submit() = _Submit;
}

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(PhoneInput.pure()) PhoneInput phone,
    @Default(PasswordInput.pure()) PasswordInput password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool showErrors,
  }) = _LoginState;
}

extension LoginStateX on LoginState {
  bool get isValid => Formz.validate([phone, password]);
}

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<_PhoneChanged>(_onPhoneChanged);
    on<_PasswordChanged>(_onPasswordChanged);
    on<_Submit>(_onSubmit);
  }

  void _onPhoneChanged(_PhoneChanged event, Emitter<LoginState> emit) {
    final phone = PhoneInput.dirty(event.phone);
    emit(state.copyWith(
      phone: phone,
      status: FormzSubmissionStatus.initial,
    ));
  }

  void _onPasswordChanged(_PasswordChanged event, Emitter<LoginState> emit) {
    final password = PasswordInput.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: FormzSubmissionStatus.initial,
    ));
  }

  void _onSubmit(_Submit event, Emitter<LoginState> emit) {
    emit(state.copyWith(showErrors: true));
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
