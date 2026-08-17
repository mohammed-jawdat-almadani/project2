import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/activation_center.dart';

part 'activation_center_model.freezed.dart';
part 'activation_center_model.g.dart';

@freezed
abstract class ActivationCenterModel with _$ActivationCenterModel {
  const factory ActivationCenterModel({
    required int id,
    required String name,
    required String address,
    required String phone,
  }) = _ActivationCenterModel;

  factory ActivationCenterModel.fromJson(Map<String, dynamic> json) =>
      _$ActivationCenterModelFromJson(json);
}

extension ActivationCenterModelX on ActivationCenterModel {
  ActivationCenter toEntity() {
    return ActivationCenter(
      id: id,
      name: name,
      address: address,
      phone: phone,
    );
  }
}
