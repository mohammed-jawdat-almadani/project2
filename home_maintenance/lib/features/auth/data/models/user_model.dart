import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String phone,
    required String role,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'phone_verified_at') String? phoneVerifiedAt,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  User toEntity() {
    return User(
      id: id,
      name: name,
      phone: phone,
      role: role,
      profileImageUrl: profileImageUrl,
    );
  }
}
