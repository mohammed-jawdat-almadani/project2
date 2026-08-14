part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({required String phone, required String password}) = _Login;
  const factory AuthEvent.registerStart({required String phone}) = _RegisterStart;
  const factory AuthEvent.forgotPassword({required String phone}) = _ForgotPassword;
}
