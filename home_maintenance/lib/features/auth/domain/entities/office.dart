import 'package:freezed_annotation/freezed_annotation.dart';

part 'office.freezed.dart';

@freezed
abstract class Office with _$Office {
  const factory Office({
    required int id,
    required String name,
    required String address,
    required String phone,
  }) = _Office;
}
