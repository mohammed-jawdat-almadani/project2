part of 'activation_bloc.dart';

@freezed
class ActivationState with _$ActivationState {
  const factory ActivationState.initial() = _Initial;
  const factory ActivationState.loading() = _Loading;
  const factory ActivationState.loaded(List<ActivationCenter> centers) = _Loaded;
  const factory ActivationState.error(String message) = _Error;
}
