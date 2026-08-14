part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.passwordResetEmailSent() = _PasswordResetEmailSent;
  const factory AuthState.otpSent([String? debugCode]) = _OtpSent;
  const factory AuthState.otpVerified(String ticket) = _OtpVerified;
  const factory AuthState.error(String message) = _Error;
}
