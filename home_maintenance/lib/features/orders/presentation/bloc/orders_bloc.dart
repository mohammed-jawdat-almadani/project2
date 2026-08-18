import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_orders_list_usecase.dart';
import '../../domain/usecases/get_order_details_usecase.dart';
import 'orders_event.dart';
import 'orders_state.dart';

@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersListUseCase _getOrdersListUseCase;
  final GetOrderDetailsUseCase _getOrderDetailsUseCase;

  OrdersBloc(
    this._getOrdersListUseCase,
    this._getOrderDetailsUseCase,
  ) : super(const OrdersState()) {
    on<OrdersEvent>((event, emit) async {
      await event.map(
        fetchOrders: (e) async => _onFetchOrders(e.status, emit),
        filterChanged: (e) async => _onFilterChanged(e.status, emit),
        refresh: (e) async => _onRefresh(emit),
        selectOrder: (e) async => _onSelectOrder(e.orderId, emit),
      );
    });
  }

  Future<void> _onFetchOrders(String? status, Emitter<OrdersState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, currentFilter: status));

    final result = await _getOrdersListUseCase(GetOrdersListParams(status: status));

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ));
      },
      (orders) {
        emit(state.copyWith(
          isLoading: false,
          orders: orders,
        ));
      },
    );
  }

  Future<void> _onFilterChanged(String? status, Emitter<OrdersState> emit) async {
    add(OrdersEvent.fetchOrders(status: status));
  }

  Future<void> _onRefresh(Emitter<OrdersState> emit) async {
    final result = await _getOrdersListUseCase(GetOrdersListParams(status: state.currentFilter));

    result.fold(
      (failure) {
        emit(state.copyWith(errorMessage: failure.message));
      },
      (orders) {
        emit(state.copyWith(orders: orders));
      },
    );
  }

  Future<void> _onSelectOrder(int orderId, Emitter<OrdersState> emit) async {
    emit(state.copyWith(isLoadingDetails: true, errorMessage: null));

    final result = await _getOrderDetailsUseCase(orderId);

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoadingDetails: false,
          errorMessage: failure.message,
        ));
      },
      (order) {
        emit(state.copyWith(
          isLoadingDetails: false,
          selectedOrder: order,
        ));
      },
    );
  }
}
