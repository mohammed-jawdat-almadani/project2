import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../orders/domain/entities/quote_part.dart';

part 'home_event.freezed.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.init() = _Init;
  const factory HomeEvent.toggleAvailability(bool isAvailable) = _ToggleAvailability;
  const factory HomeEvent.locationChanged({required double lat, required double lng}) = _LocationChanged;
  const factory HomeEvent.heartbeatTick() = _HeartbeatTick;
  const factory HomeEvent.fetchOffers() = _FetchOffers;
  const factory HomeEvent.acceptOffer(int offerId) = _AcceptOffer;
  const factory HomeEvent.declineOffer(int offerId, [String? reason]) = _DeclineOffer;
  const factory HomeEvent.changeTab(int index) = _ChangeTab;
  const factory HomeEvent.dismissOffer() = _DismissOffer;
  const factory HomeEvent.simulateOffer() = _SimulateOffer;
  const factory HomeEvent.arriveOrder(int orderId) = _ArriveOrder;
  const factory HomeEvent.withdrawOrder(int orderId, [String? reason]) = _WithdrawOrder;
  const factory HomeEvent.sendQuote({
    required int orderId,
    required String laborCost,
    required int warrantyDays,
    required List<QuotePart> parts,
  }) = _SendQuote;
  const factory HomeEvent.sendAddonQuote({
    required int orderId,
    required String laborCost,
    required List<QuotePart> parts,
  }) = _SendAddonQuote;
  const factory HomeEvent.requestWaitingForParts({
    required int orderId,
    required String note,
  }) = _RequestWaitingForParts;
  const factory HomeEvent.resumeOrder(int orderId) = _ResumeOrder;
  const factory HomeEvent.requestClosure({
    required int orderId,
    required List<File> photos,
  }) = _RequestClosure;
  const factory HomeEvent.verifyClosure({
    required int orderId,
    required String code,
  }) = _VerifyClosure;
  const factory HomeEvent.reportClientNoShow(int orderId) = _ReportClientNoShow;
}
