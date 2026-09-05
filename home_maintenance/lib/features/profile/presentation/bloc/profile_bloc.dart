import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final LogoutUseCase _logoutUseCase;

  ProfileBloc(
    this._getProfileUseCase,
    this._logoutUseCase,
  ) : super(const ProfileState()) {
    on<ProfileEvent>((event, emit) async {
      await event.map(
        fetchProfile: (e) async => _onFetchProfile(emit),
        logout: (e) async => _onLogout(emit),
        togglePushNotifications: (e) async => _onTogglePushNotifications(e.enabled, emit),
      );
    });
  }

  Future<void> _onFetchProfile(Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getProfileUseCase(NoParams());

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ));
      },
      (profile) {
        emit(state.copyWith(
          isLoading: false,
          profile: profile,
        ));
      },
    );
  }

  Future<void> _onLogout(Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoggingOut: true, errorMessage: null));
    final result = await _logoutUseCase(NoParams());

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoggingOut: false,
          errorMessage: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          isLoggingOut: false,
          loggedOutSuccess: true,
          successMessage: 'تم تسجيل الخروج بنجاح',
        ));
      },
    );
  }

  void _onTogglePushNotifications(bool enabled, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      pushNotificationsEnabled: enabled,
      successMessage: enabled
          ? 'تم تفعيل التنبيهات الفورية'
          : 'تم إيقاف التنبيهات الفورية',
    ));
  }
}
