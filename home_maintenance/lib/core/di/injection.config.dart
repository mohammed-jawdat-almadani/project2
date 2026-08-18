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
import '../../features/auth/domain/usecases/get_offices_usecase.dart' as _i180;
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
import '../../features/auth/presentation/cubit/activation_offices_cubit.dart'
    as _i602;
import '../../features/chat/data/datasources/chat_remote_data_source.dart'
    as _i980;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i504;
import '../../features/chat/domain/repositories/chat_repository.dart' as _i420;
import '../../features/chat/domain/usecases/get_messages_usecase.dart' as _i325;
import '../../features/chat/domain/usecases/mark_messages_read_usecase.dart'
    as _i697;
import '../../features/chat/domain/usecases/send_message_usecase.dart' as _i795;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i65;
import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i362;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../features/home/domain/usecases/accept_offer_usecase.dart' as _i76;
import '../../features/home/domain/usecases/arrive_order_usecase.dart' as _i124;
import '../../features/home/domain/usecases/decline_offer_usecase.dart'
    as _i689;
import '../../features/home/domain/usecases/get_availability_usecase.dart'
    as _i427;
import '../../features/home/domain/usecases/get_offers_usecase.dart' as _i176;
import '../../features/home/domain/usecases/get_orders_usecase.dart' as _i333;
import '../../features/home/domain/usecases/set_availability_usecase.dart'
    as _i1033;
import '../../features/home/domain/usecases/update_location_usecase.dart'
    as _i15;
import '../../features/home/domain/usecases/withdraw_order_usecase.dart'
    as _i1065;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i202;
import '../../features/notifications/data/datasources/notifications_remote_data_source.dart'
    as _i951;
import '../../features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i201;
import '../../features/notifications/domain/repositories/notifications_repository.dart'
    as _i563;
import '../../features/notifications/domain/usecases/get_notifications_usecase.dart'
    as _i587;
import '../../features/notifications/domain/usecases/get_unread_count_usecase.dart'
    as _i85;
import '../../features/notifications/domain/usecases/mark_all_notifications_read_usecase.dart'
    as _i550;
import '../../features/notifications/domain/usecases/mark_notification_read_usecase.dart'
    as _i6;
import '../../features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i1041;
import '../../features/orders/data/datasources/orders_remote_data_source.dart'
    as _i858;
import '../../features/orders/data/repositories/orders_repository_impl.dart'
    as _i368;
import '../../features/orders/domain/repositories/orders_repository.dart'
    as _i992;
import '../../features/orders/domain/usecases/get_order_details_usecase.dart'
    as _i42;
import '../../features/orders/domain/usecases/get_orders_list_usecase.dart'
    as _i221;
import '../../features/orders/domain/usecases/get_quotes_usecase.dart' as _i275;
import '../../features/orders/domain/usecases/request_closure_usecase.dart'
    as _i577;
import '../../features/orders/domain/usecases/request_waiting_for_parts_usecase.dart'
    as _i772;
import '../../features/orders/domain/usecases/resume_order_usecase.dart'
    as _i467;
import '../../features/orders/domain/usecases/send_addon_quote_usecase.dart'
    as _i609;
import '../../features/orders/domain/usecases/send_quote_usecase.dart' as _i700;
import '../../features/orders/domain/usecases/verify_closure_usecase.dart'
    as _i613;
import '../../features/orders/presentation/bloc/orders_bloc.dart' as _i349;
import '../../features/profile/data/datasources/profile_remote_data_source.dart'
    as _i847;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i894;
import '../../features/profile/domain/usecases/get_profile_usecase.dart'
    as _i965;
import '../../features/profile/domain/usecases/logout_usecase.dart' as _i17;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i469;
import '../../features/wallet/data/datasources/wallet_remote_data_source.dart'
    as _i224;
import '../../features/wallet/data/repositories/wallet_repository_impl.dart'
    as _i690;
import '../../features/wallet/domain/repositories/wallet_repository.dart'
    as _i571;
import '../../features/wallet/domain/usecases/get_sham_cash_account_usecase.dart'
    as _i9;
import '../../features/wallet/domain/usecases/get_wallet_usecase.dart' as _i920;
import '../../features/wallet/domain/usecases/get_withdrawals_usecase.dart'
    as _i405;
import '../../features/wallet/domain/usecases/request_withdrawal_usecase.dart'
    as _i647;
import '../../features/wallet/domain/usecases/set_sham_cash_account_usecase.dart'
    as _i245;
import '../../features/wallet/presentation/bloc/wallet_bloc.dart' as _i87;
import '../notifications/notification_action_handler.dart' as _i197;
import '../services/fcm_service.dart' as _i928;
import '../services/location_service.dart' as _i669;
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
    gh.lazySingleton<_i197.NotificationActionHandler>(
      () => _i197.NotificationActionHandler(),
    );
    gh.lazySingleton<_i669.LocationService>(() => _i669.LocationService());
    gh.lazySingleton<_i224.WalletRemoteDataSource>(
      () => _i224.WalletRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i362.HomeRemoteDataSource>(
      () => _i362.HomeRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i980.ChatRemoteDataSource>(
      () => _i980.ChatRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i951.NotificationsRemoteDataSource>(
      () => _i951.NotificationsRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i858.OrdersRemoteDataSource>(
      () => _i858.OrdersRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i571.WalletRepository>(
      () => _i690.WalletRepositoryImpl(gh<_i224.WalletRemoteDataSource>()),
    );
    gh.lazySingleton<_i420.ChatRepository>(
      () => _i504.ChatRepositoryImpl(gh<_i980.ChatRemoteDataSource>()),
    );
    gh.factory<_i325.GetMessagesUseCase>(
      () => _i325.GetMessagesUseCase(gh<_i420.ChatRepository>()),
    );
    gh.factory<_i697.MarkMessagesReadUseCase>(
      () => _i697.MarkMessagesReadUseCase(gh<_i420.ChatRepository>()),
    );
    gh.factory<_i795.SendMessageUseCase>(
      () => _i795.SendMessageUseCase(gh<_i420.ChatRepository>()),
    );
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(
        gh<_i361.Dio>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i563.NotificationsRepository>(
      () => _i201.NotificationsRepositoryImpl(
        gh<_i951.NotificationsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i928.FcmService>(
      () => _i928.FcmService(
        gh<_i107.AuthRemoteDataSource>(),
        gh<_i197.NotificationActionHandler>(),
      ),
    );
    gh.lazySingleton<_i0.HomeRepository>(
      () => _i76.HomeRepositoryImpl(gh<_i362.HomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i847.ProfileRemoteDataSource>(
      () => _i847.ProfileRemoteDataSourceImpl(
        gh<_i361.Dio>(),
        gh<_i558.FlutterSecureStorage>(),
        gh<_i928.FcmService>(),
      ),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i107.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i992.OrdersRepository>(
      () => _i368.OrdersRepositoryImpl(gh<_i858.OrdersRemoteDataSource>()),
    );
    gh.factory<_i9.GetShamCashAccountUseCase>(
      () => _i9.GetShamCashAccountUseCase(gh<_i571.WalletRepository>()),
    );
    gh.factory<_i920.GetWalletUseCase>(
      () => _i920.GetWalletUseCase(gh<_i571.WalletRepository>()),
    );
    gh.factory<_i405.GetWithdrawalsUseCase>(
      () => _i405.GetWithdrawalsUseCase(gh<_i571.WalletRepository>()),
    );
    gh.factory<_i647.RequestWithdrawalUseCase>(
      () => _i647.RequestWithdrawalUseCase(gh<_i571.WalletRepository>()),
    );
    gh.factory<_i245.SetShamCashAccountUseCase>(
      () => _i245.SetShamCashAccountUseCase(gh<_i571.WalletRepository>()),
    );
    gh.factory<_i65.ChatBloc>(
      () => _i65.ChatBloc(
        gh<_i325.GetMessagesUseCase>(),
        gh<_i795.SendMessageUseCase>(),
        gh<_i697.MarkMessagesReadUseCase>(),
        gh<_i197.NotificationActionHandler>(),
      ),
    );
    gh.factory<_i587.GetNotificationsUseCase>(
      () => _i587.GetNotificationsUseCase(gh<_i563.NotificationsRepository>()),
    );
    gh.factory<_i85.GetUnreadCountUseCase>(
      () => _i85.GetUnreadCountUseCase(gh<_i563.NotificationsRepository>()),
    );
    gh.factory<_i550.MarkAllNotificationsReadUseCase>(
      () => _i550.MarkAllNotificationsReadUseCase(
        gh<_i563.NotificationsRepository>(),
      ),
    );
    gh.factory<_i6.MarkNotificationReadUseCase>(
      () =>
          _i6.MarkNotificationReadUseCase(gh<_i563.NotificationsRepository>()),
    );
    gh.factory<_i42.GetOrderDetailsUseCase>(
      () => _i42.GetOrderDetailsUseCase(gh<_i992.OrdersRepository>()),
    );
    gh.factory<_i221.GetOrdersListUseCase>(
      () => _i221.GetOrdersListUseCase(gh<_i992.OrdersRepository>()),
    );
    gh.factory<_i275.GetQuotesUseCase>(
      () => _i275.GetQuotesUseCase(gh<_i992.OrdersRepository>()),
    );
    gh.factory<_i577.RequestClosureUseCase>(
      () => _i577.RequestClosureUseCase(gh<_i992.OrdersRepository>()),
    );
    gh.factory<_i772.RequestWaitingForPartsUseCase>(
      () => _i772.RequestWaitingForPartsUseCase(gh<_i992.OrdersRepository>()),
    );
    gh.factory<_i467.ResumeOrderUseCase>(
      () => _i467.ResumeOrderUseCase(gh<_i992.OrdersRepository>()),
    );
    gh.factory<_i609.SendAddonQuoteUseCase>(
      () => _i609.SendAddonQuoteUseCase(gh<_i992.OrdersRepository>()),
    );
    gh.factory<_i700.SendQuoteUseCase>(
      () => _i700.SendQuoteUseCase(gh<_i992.OrdersRepository>()),
    );
    gh.factory<_i613.VerifyClosureUseCase>(
      () => _i613.VerifyClosureUseCase(gh<_i992.OrdersRepository>()),
    );
    gh.lazySingleton<_i894.ProfileRepository>(
      () => _i334.ProfileRepositoryImpl(gh<_i847.ProfileRemoteDataSource>()),
    );
    gh.factory<_i76.AcceptOfferUseCase>(
      () => _i76.AcceptOfferUseCase(gh<_i0.HomeRepository>()),
    );
    gh.factory<_i124.ArriveOrderUseCase>(
      () => _i124.ArriveOrderUseCase(gh<_i0.HomeRepository>()),
    );
    gh.factory<_i689.DeclineOfferUseCase>(
      () => _i689.DeclineOfferUseCase(gh<_i0.HomeRepository>()),
    );
    gh.factory<_i427.GetAvailabilityUseCase>(
      () => _i427.GetAvailabilityUseCase(gh<_i0.HomeRepository>()),
    );
    gh.factory<_i176.GetOffersUseCase>(
      () => _i176.GetOffersUseCase(gh<_i0.HomeRepository>()),
    );
    gh.factory<_i333.GetOrdersUseCase>(
      () => _i333.GetOrdersUseCase(gh<_i0.HomeRepository>()),
    );
    gh.factory<_i1033.SetAvailabilityUseCase>(
      () => _i1033.SetAvailabilityUseCase(gh<_i0.HomeRepository>()),
    );
    gh.factory<_i15.UpdateLocationUseCase>(
      () => _i15.UpdateLocationUseCase(gh<_i0.HomeRepository>()),
    );
    gh.factory<_i1065.WithdrawOrderUseCase>(
      () => _i1065.WithdrawOrderUseCase(gh<_i0.HomeRepository>()),
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
    gh.factory<_i180.GetOfficesUseCase>(
      () => _i180.GetOfficesUseCase(gh<_i787.AuthRepository>()),
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
        gh<_i928.FcmService>(),
      ),
    );
    gh.factory<_i279.ProviderRegisterWizardBloc>(
      () => _i279.ProviderRegisterWizardBloc(gh<_i332.GetCategoriesUseCase>()),
    );
    gh.lazySingleton<_i1041.NotificationsBloc>(
      () => _i1041.NotificationsBloc(
        gh<_i587.GetNotificationsUseCase>(),
        gh<_i85.GetUnreadCountUseCase>(),
        gh<_i6.MarkNotificationReadUseCase>(),
        gh<_i550.MarkAllNotificationsReadUseCase>(),
        gh<_i197.NotificationActionHandler>(),
      ),
    );
    gh.factory<_i87.WalletBloc>(
      () => _i87.WalletBloc(
        gh<_i920.GetWalletUseCase>(),
        gh<_i405.GetWithdrawalsUseCase>(),
        gh<_i647.RequestWithdrawalUseCase>(),
        gh<_i9.GetShamCashAccountUseCase>(),
        gh<_i245.SetShamCashAccountUseCase>(),
        gh<_i197.NotificationActionHandler>(),
      ),
    );
    gh.factory<_i965.GetProfileUseCase>(
      () => _i965.GetProfileUseCase(gh<_i894.ProfileRepository>()),
    );
    gh.factory<_i17.LogoutUseCase>(
      () => _i17.LogoutUseCase(gh<_i894.ProfileRepository>()),
    );
    gh.factory<_i349.OrdersBloc>(
      () => _i349.OrdersBloc(
        gh<_i221.GetOrdersListUseCase>(),
        gh<_i42.GetOrderDetailsUseCase>(),
      ),
    );
    gh.factory<_i602.ActivationOfficesCubit>(
      () => _i602.ActivationOfficesCubit(gh<_i180.GetOfficesUseCase>()),
    );
    gh.lazySingleton<_i202.HomeBloc>(
      () => _i202.HomeBloc(
        gh<_i1033.SetAvailabilityUseCase>(),
        gh<_i427.GetAvailabilityUseCase>(),
        gh<_i176.GetOffersUseCase>(),
        gh<_i333.GetOrdersUseCase>(),
        gh<_i76.AcceptOfferUseCase>(),
        gh<_i689.DeclineOfferUseCase>(),
        gh<_i15.UpdateLocationUseCase>(),
        gh<_i124.ArriveOrderUseCase>(),
        gh<_i1065.WithdrawOrderUseCase>(),
        gh<_i700.SendQuoteUseCase>(),
        gh<_i609.SendAddonQuoteUseCase>(),
        gh<_i275.GetQuotesUseCase>(),
        gh<_i772.RequestWaitingForPartsUseCase>(),
        gh<_i467.ResumeOrderUseCase>(),
        gh<_i577.RequestClosureUseCase>(),
        gh<_i613.VerifyClosureUseCase>(),
        gh<_i669.LocationService>(),
        gh<_i197.NotificationActionHandler>(),
      ),
    );
    gh.factory<_i469.ProfileBloc>(
      () => _i469.ProfileBloc(
        gh<_i965.GetProfileUseCase>(),
        gh<_i17.LogoutUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
