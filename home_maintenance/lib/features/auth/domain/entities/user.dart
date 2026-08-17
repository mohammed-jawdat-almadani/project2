import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/user_role.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String phone,
    required UserRole role,
    String? profileImageUrl,
  }) = _User;
}
