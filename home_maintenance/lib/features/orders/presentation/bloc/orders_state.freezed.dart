// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersState {

 bool get isLoading; List<OrderItem> get orders; String? get currentFilter;// null or 'all', 'accepted', 'pending', 'completed', 'expired'
 OrderItem? get selectedOrder; bool get isLoadingDetails; String? get errorMessage;
/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersStateCopyWith<OrdersState> get copyWith => _$OrdersStateCopyWithImpl<OrdersState>(this as OrdersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.orders, orders)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.selectedOrder, selectedOrder) || other.selectedOrder == selectedOrder)&&(identical(other.isLoadingDetails, isLoadingDetails) || other.isLoadingDetails == isLoadingDetails)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(orders),currentFilter,selectedOrder,isLoadingDetails,errorMessage);

@override
String toString() {
  return 'OrdersState(isLoading: $isLoading, orders: $orders, currentFilter: $currentFilter, selectedOrder: $selectedOrder, isLoadingDetails: $isLoadingDetails, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OrdersStateCopyWith<$Res>  {
  factory $OrdersStateCopyWith(OrdersState value, $Res Function(OrdersState) _then) = _$OrdersStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<OrderItem> orders, String? currentFilter, OrderItem? selectedOrder, bool isLoadingDetails, String? errorMessage
});


$OrderItemCopyWith<$Res>? get selectedOrder;

}
/// @nodoc
class _$OrdersStateCopyWithImpl<$Res>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._self, this._then);

  final OrdersState _self;
  final $Res Function(OrdersState) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? orders = null,Object? currentFilter = freezed,Object? selectedOrder = freezed,Object? isLoadingDetails = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as String?,selectedOrder: freezed == selectedOrder ? _self.selectedOrder : selectedOrder // ignore: cast_nullable_to_non_nullable
as OrderItem?,isLoadingDetails: null == isLoadingDetails ? _self.isLoadingDetails : isLoadingDetails // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderItemCopyWith<$Res>? get selectedOrder {
    if (_self.selectedOrder == null) {
    return null;
  }

  return $OrderItemCopyWith<$Res>(_self.selectedOrder!, (value) {
    return _then(_self.copyWith(selectedOrder: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrdersState].
extension OrdersStatePatterns on OrdersState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersState value)  $default,){
final _that = this;
switch (_that) {
case _OrdersState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersState value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<OrderItem> orders,  String? currentFilter,  OrderItem? selectedOrder,  bool isLoadingDetails,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersState() when $default != null:
return $default(_that.isLoading,_that.orders,_that.currentFilter,_that.selectedOrder,_that.isLoadingDetails,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<OrderItem> orders,  String? currentFilter,  OrderItem? selectedOrder,  bool isLoadingDetails,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _OrdersState():
return $default(_that.isLoading,_that.orders,_that.currentFilter,_that.selectedOrder,_that.isLoadingDetails,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<OrderItem> orders,  String? currentFilter,  OrderItem? selectedOrder,  bool isLoadingDetails,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _OrdersState() when $default != null:
return $default(_that.isLoading,_that.orders,_that.currentFilter,_that.selectedOrder,_that.isLoadingDetails,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OrdersState implements OrdersState {
  const _OrdersState({this.isLoading = false, final  List<OrderItem> orders = const [], this.currentFilter, this.selectedOrder, this.isLoadingDetails = false, this.errorMessage}): _orders = orders;
  

@override@JsonKey() final  bool isLoading;
 final  List<OrderItem> _orders;
@override@JsonKey() List<OrderItem> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

@override final  String? currentFilter;
// null or 'all', 'accepted', 'pending', 'completed', 'expired'
@override final  OrderItem? selectedOrder;
@override@JsonKey() final  bool isLoadingDetails;
@override final  String? errorMessage;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersStateCopyWith<_OrdersState> get copyWith => __$OrdersStateCopyWithImpl<_OrdersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._orders, _orders)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.selectedOrder, selectedOrder) || other.selectedOrder == selectedOrder)&&(identical(other.isLoadingDetails, isLoadingDetails) || other.isLoadingDetails == isLoadingDetails)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_orders),currentFilter,selectedOrder,isLoadingDetails,errorMessage);

@override
String toString() {
  return 'OrdersState(isLoading: $isLoading, orders: $orders, currentFilter: $currentFilter, selectedOrder: $selectedOrder, isLoadingDetails: $isLoadingDetails, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$OrdersStateCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$OrdersStateCopyWith(_OrdersState value, $Res Function(_OrdersState) _then) = __$OrdersStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<OrderItem> orders, String? currentFilter, OrderItem? selectedOrder, bool isLoadingDetails, String? errorMessage
});


@override $OrderItemCopyWith<$Res>? get selectedOrder;

}
/// @nodoc
class __$OrdersStateCopyWithImpl<$Res>
    implements _$OrdersStateCopyWith<$Res> {
  __$OrdersStateCopyWithImpl(this._self, this._then);

  final _OrdersState _self;
  final $Res Function(_OrdersState) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? orders = null,Object? currentFilter = freezed,Object? selectedOrder = freezed,Object? isLoadingDetails = null,Object? errorMessage = freezed,}) {
  return _then(_OrdersState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as String?,selectedOrder: freezed == selectedOrder ? _self.selectedOrder : selectedOrder // ignore: cast_nullable_to_non_nullable
as OrderItem?,isLoadingDetails: null == isLoadingDetails ? _self.isLoadingDetails : isLoadingDetails // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderItemCopyWith<$Res>? get selectedOrder {
    if (_self.selectedOrder == null) {
    return null;
  }

  return $OrderItemCopyWith<$Res>(_self.selectedOrder!, (value) {
    return _then(_self.copyWith(selectedOrder: value));
  });
}
}

// dart format on
