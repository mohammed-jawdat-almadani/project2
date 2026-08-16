// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/check_auth_status_usecase.dart'
    as _i52;
import '../../features/auth/domain/usecases/forgot_password_usecase.dart'
    as _i560;
import '../../features/auth/domain/usecases/get_categories_usecase.dart'
    as _i332;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_provider_usecase.dart'
    as _i226;
import '../../features/auth/domain/usecases/send_register_otp_usecase.dart'
    as _i1013;
import '../../features/auth/domain/usecases/verify_register_otp_usecase.dart'
    as _i709;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/auth/presentation/bloc/login/login_bloc.dart' as _i208;
import '../../features/auth/presentation/bloc/register/register_bloc.dart'
    as _i210;
import '../../features/auth/presentation/bloc/wizard/provider_register_wizard_bloc.dart'
    as _i279;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i208.LoginBloc>(() => _i208.LoginBloc());
    gh.factory<_i210.RegisterBloc>(() => _i210.RegisterBloc());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(
        gh<_i361.Dio>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i107.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i52.CheckAuthStatusUseCase>(
      () => _i52.CheckAuthStatusUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i560.ForgotPasswordUseCase>(
      () => _i560.ForgotPasswordUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i332.GetCategoriesUseCase>(
      () => _i332.GetCategoriesUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i226.RegisterProviderUseCase>(
      () => _i226.RegisterProviderUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i1013.SendRegisterOtpUseCase>(
      () => _i1013.SendRegisterOtpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i709.VerifyRegisterOtpUseCase>(
      () => _i709.VerifyRegisterOtpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i188.LoginUseCase>(),
        gh<_i1013.SendRegisterOtpUseCase>(),
        gh<_i709.VerifyRegisterOtpUseCase>(),
        gh<_i226.RegisterProviderUseCase>(),
        gh<_i560.ForgotPasswordUseCase>(),
        gh<_i332.GetCategoriesUseCase>(),
        gh<_i52.CheckAuthStatusUseCase>(),
      ),
    );
    gh.factory<_i279.ProviderRegisterWizardBloc>(
      () => _i279.ProviderRegisterWizardBloc(gh<_i332.GetCategoriesUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
