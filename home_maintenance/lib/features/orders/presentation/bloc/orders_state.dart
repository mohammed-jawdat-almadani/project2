import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/order_item.dart';

part 'orders_state.freezed.dart';

@freezed
abstract class OrdersState with _$OrdersState {
  const factory OrdersState({
    @Default(false) bool isLoading,
    @Default([]) List<OrderItem> orders,
    String? currentFilter, // null or 'all', 'accepted', 'pending', 'completed', 'expired'
    OrderItem? selectedOrder,
    @Default(false) bool isLoadingDetails,
    String? errorMessage,
  }) = _OrdersState;
}
