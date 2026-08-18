import 'package:freezed_annotation/freezed_annotation.dart';

part 'technician_profile.freezed.dart';

@freezed
abstract class TechnicianProfile with _$TechnicianProfile {
  const factory TechnicianProfile({
    required int id,
    required String name,
    required String phone,
    required String status, // 'active', 'pending', 'probation'
    required bool isAvailable,
    @Default('0.00') String ratingAvg,
    @Default([]) List<int> serviceCategoryIds,
    @Default([]) List<String> serviceCategoryNames,
    @Default(0) int completedOrdersCount,
    DateTime? memberSince,
  }) = _TechnicianProfile;
}
