import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/technician_profile.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoggingOut,
    @Default(false) bool loggedOutSuccess,
    TechnicianProfile? profile,
    @Default(true) bool pushNotificationsEnabled,
    String? errorMessage,
    String? successMessage,
  }) = _ProfileState;
}
