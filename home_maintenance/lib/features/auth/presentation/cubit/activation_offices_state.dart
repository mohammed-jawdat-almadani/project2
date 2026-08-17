import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/office.dart';

part 'activation_offices_state.freezed.dart';

@freezed
abstract class ActivationOfficesState with _$ActivationOfficesState {
  const factory ActivationOfficesState.initial() = _Initial;
  const factory ActivationOfficesState.loading() = _Loading;
  const factory ActivationOfficesState.loaded(List<Office> offices) = _Loaded;
  const factory ActivationOfficesState.error(String message) = _Error;
}
