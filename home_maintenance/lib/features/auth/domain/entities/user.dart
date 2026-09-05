import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/user_role.dart';
import '../../../../core/enums/technician_status.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String phone,
    @Default(UserRole.client) UserRole role,
    String? profileImageUrl,
    TechnicianStatus? technicianStatus,
  }) = _User;
}
