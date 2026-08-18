import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/dispatch_offer.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool isAvailable,
    @Default(false) bool isLoadingAvailability,
    @Default(0) int currentTab,
    DispatchOffer? currentOffer,
    DispatchOffer? activeOrder,
    @Default([]) List<DispatchOffer> offers,
    @Default(33.5138) double technicianLat,
    @Default(36.2765) double technicianLng,
    @Default(false) bool isProcessingOffer,
    String? errorMessage,
    String? successMessage,
  }) = _HomeState;
}
