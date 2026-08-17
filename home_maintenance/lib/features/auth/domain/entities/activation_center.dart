import 'package:freezed_annotation/freezed_annotation.dart';

part 'activation_center.freezed.dart';

@freezed
abstract class ActivationCenter with _$ActivationCenter {
  const factory ActivationCenter({
    required int id,
    required String name,
    required String address,
    required String phone,
  }) = _ActivationCenter;
}
