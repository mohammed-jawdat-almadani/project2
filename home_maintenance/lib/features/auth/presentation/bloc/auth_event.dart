part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({required String phone, required String password}) = _Login;
  const factory AuthEvent.registerStart({required String phone}) = _RegisterStart;
  const factory AuthEvent.forgotPassword({required String phone}) = _ForgotPassword;
  const factory AuthEvent.verifyOtp({required String phone, required String code}) = _VerifyOtp;
  const factory AuthEvent.loadCategories() = _LoadCategories;
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
  const factory AuthEvent.registerProviderSubmit({
    required String phone,
    required String ticket,
    required String firstName,
    required String lastName,
    required List<int> serviceCategoryIds,
    required String password,
    required String passwordConfirmation,
    String? selfiePath,
    String? idFrontPath,
    String? idBackPath,
  }) = _RegisterProviderSubmit;
}
