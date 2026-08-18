import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/technician_profile.dart';

part 'technician_profile_model.freezed.dart';
part 'technician_profile_model.g.dart';

@freezed
abstract class TechnicianProfileModel with _$TechnicianProfileModel {
  const TechnicianProfileModel._();

  const factory TechnicianProfileModel({
    required int id,
    @Default('pending') String status,
    @JsonKey(name: 'is_available') @Default(false) bool isAvailable,
    @JsonKey(name: 'rating_avg') @Default('0.00') String ratingAvg,
    @JsonKey(name: 'service_category_ids') @Default([]) List<int> serviceCategoryIds,
    @JsonKey(name: 'current_lat') dynamic currentLat,
    @JsonKey(name: 'current_lng') dynamic currentLng,
    Map<String, dynamic>? user,
    String? name,
    String? phone,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'completed_orders_count') @Default(0) int completedOrdersCount,
  }) = _TechnicianProfileModel;

  factory TechnicianProfileModel.fromJson(Map<String, dynamic> json) =>
      _$TechnicianProfileModelFromJson(json);

  TechnicianProfile toEntity({Map<int, String>? categoryMap}) {
    final userData = user ?? {};
    final resolvedName = (name != null && name!.isNotEmpty)
        ? name!
        : (userData['name'] as String? ?? 'فني الصيانة');
    final resolvedPhone = (phone != null && phone!.isNotEmpty)
        ? phone!
        : (userData['phone'] as String? ?? '');
    final dateStr = createdAt ?? userData['created_at'] as String?;

    final categoryNames = <String>[];
    if (categoryMap != null) {
      for (final id in serviceCategoryIds) {
        if (categoryMap.containsKey(id)) {
          categoryNames.add(categoryMap[id]!);
        }
      }
    }

    return TechnicianProfile(
      id: id,
      name: resolvedName,
      phone: resolvedPhone,
      status: status,
      isAvailable: isAvailable,
      ratingAvg: ratingAvg,
      serviceCategoryIds: serviceCategoryIds,
      serviceCategoryNames: categoryNames,
      completedOrdersCount: completedOrdersCount,
      memberSince: dateStr != null ? DateTime.tryParse(dateStr) : null,
    );
  }
}
