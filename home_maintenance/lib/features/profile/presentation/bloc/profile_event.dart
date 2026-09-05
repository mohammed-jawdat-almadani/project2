import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.fetchProfile() = _FetchProfile;
  const factory ProfileEvent.logout() = _Logout;
  const factory ProfileEvent.togglePushNotifications(bool enabled) = _TogglePushNotifications;
}
