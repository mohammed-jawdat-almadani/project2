import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/send_register_otp_usecase.dart';
import '../../domain/usecases/verify_register_otp_usecase.dart';
import '../../domain/usecases/forgot_password_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SendRegisterOtpUseCase sendRegisterOtpUseCase;
  final VerifyRegisterOtpUseCase verifyRegisterOtpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  AuthBloc(
    this.loginUseCase,
    this.sendRegisterOtpUseCase,
    this.verifyRegisterOtpUseCase,
    this.forgotPasswordUseCase,
  ) : super(const AuthState.initial()) {
    on<_Login>(_onLogin);
    on<_RegisterStart>(_onRegisterStart);
    on<_VerifyOtp>(_onVerifyOtp);
    on<_ForgotPassword>(_onForgotPassword);
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await loginUseCase(LoginParams(phone: event.phone, password: event.password));
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onRegisterStart(_RegisterStart event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await sendRegisterOtpUseCase(SendRegisterOtpParams(phone: event.phone));
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (debugCode) => emit(AuthState.otpSent(debugCode)),
    );
  }

  Future<void> _onForgotPassword(_ForgotPassword event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await forgotPasswordUseCase(ForgotPasswordParams(phone: event.phone));
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.passwordResetEmailSent()),
    );
  }

  Future<void> _onVerifyOtp(_VerifyOtp event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await verifyRegisterOtpUseCase(VerifyRegisterOtpParams(phone: event.phone, code: event.code));
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (ticket) => emit(AuthState.otpVerified(ticket)),
    );
  }
}
