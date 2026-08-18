import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_event.freezed.dart';

@freezed
abstract class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.fetchOrders({String? status}) = _FetchOrders;
  const factory OrdersEvent.filterChanged(String? status) = _FilterChanged;
  const factory OrdersEvent.refresh() = _Refresh;
  const factory OrdersEvent.selectOrder(int orderId) = _SelectOrder;
}
