import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/office.dart';

part 'office_model.freezed.dart';
part 'office_model.g.dart';

@freezed
abstract class OfficeModel with _$OfficeModel {
  const OfficeModel._();

  const factory OfficeModel({
    required int id,
    required String name,
    required String address,
    required String phone,
  }) = _OfficeModel;

  factory OfficeModel.fromJson(Map<String, dynamic> json) => _$OfficeModelFromJson(json);

  Office toEntity() => Office(
    id: id,
    name: name,
    address: address,
    phone: phone,
  );
}
