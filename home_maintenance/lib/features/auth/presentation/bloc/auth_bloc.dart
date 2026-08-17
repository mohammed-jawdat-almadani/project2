import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/enums/splash_auth_state.dart';
import '../../../../core/enums/user_role.dart';
import '../../domain/entities/user.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/category_model.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/send_register_otp_usecase.dart';
import '../../domain/usecases/verify_register_otp_usecase.dart';
import '../../domain/usecases/register_provider_usecase.dart';
import '../../../../core/enums/technician_status.dart';
import '../../domain/usecases/forgot_password_usecase.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/check_auth_status_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SendRegisterOtpUseCase sendRegisterOtpUseCase;
  final VerifyRegisterOtpUseCase verifyRegisterOtpUseCase;
  final RegisterProviderUseCase registerProviderUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final CheckAuthStatusUseCase checkAuthStatusUseCase;

  AuthBloc(
    this.loginUseCase,
    this.sendRegisterOtpUseCase,
    this.verifyRegisterOtpUseCase,
    this.registerProviderUseCase,
    this.forgotPasswordUseCase,
    this.getCategoriesUseCase,
    this.checkAuthStatusUseCase,
  ) : super(const AuthState.initial()) {
    on<_Login>(_onLogin);
    on<_RegisterStart>(_onRegisterStart);
    on<_VerifyOtp>(_onVerifyOtp);
    on<_LoadCategories>(_onLoadCategories);
    on<_RegisterProviderSubmit>(_onRegisterProviderSubmit);
    on<_ForgotPassword>(_onForgotPassword);
    on<_CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onCheckAuthStatus(_CheckAuthStatus event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await checkAuthStatusUseCase(NoParams());
    result.fold(
      (failure) => emit(const AuthState.unauthenticated()),
      (splashState) {
        switch (splashState) {
          case SplashAuthState.unauthenticated:
            emit(const AuthState.unauthenticated());
            break;
          case SplashAuthState.client:
            emit(AuthState.authenticated(const User(id: 0, phone: '', name: '', role: UserRole.client)));
            break;
          case SplashAuthState.providerActive:
            emit(AuthState.authenticated(const User(id: 0, phone: '', name: '', role: UserRole.technician, technicianStatus: TechnicianStatus.active)));
            break;
          case SplashAuthState.providerPending:
            emit(AuthState.authenticated(const User(id: 0, phone: '', name: '', role: UserRole.technician, technicianStatus: TechnicianStatus.pending)));
            break;
        }
      },
    );
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

  Future<void> _onLoadCategories(_LoadCategories event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await getCategoriesUseCase(NoParams());
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (categories) => emit(AuthState.categoriesLoaded(categories)),
    );
  }

  Future<void> _onRegisterProviderSubmit(_RegisterProviderSubmit event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await registerProviderUseCase(RegisterProviderParams(
      phone: event.phone,
      ticket: event.ticket,
      firstName: event.firstName,
      lastName: event.lastName,
      serviceCategoryIds: event.serviceCategoryIds,
      password: event.password,
      passwordConfirmation: event.passwordConfirmation,
      selfiePath: event.selfiePath,
      idFrontPath: event.idFrontPath,
      idBackPath: event.idBackPath,
    ));
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }
}
