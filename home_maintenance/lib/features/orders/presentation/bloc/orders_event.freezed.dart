// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersEvent()';
}


}

/// @nodoc
class $OrdersEventCopyWith<$Res>  {
$OrdersEventCopyWith(OrdersEvent _, $Res Function(OrdersEvent) __);
}


/// Adds pattern-matching-related methods to [OrdersEvent].
extension OrdersEventPatterns on OrdersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchOrders value)?  fetchOrders,TResult Function( _FilterChanged value)?  filterChanged,TResult Function( _Refresh value)?  refresh,TResult Function( _SelectOrder value)?  selectOrder,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchOrders() when fetchOrders != null:
return fetchOrders(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _Refresh() when refresh != null:
return refresh(_that);case _SelectOrder() when selectOrder != null:
return selectOrder(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchOrders value)  fetchOrders,required TResult Function( _FilterChanged value)  filterChanged,required TResult Function( _Refresh value)  refresh,required TResult Function( _SelectOrder value)  selectOrder,}){
final _that = this;
switch (_that) {
case _FetchOrders():
return fetchOrders(_that);case _FilterChanged():
return filterChanged(_that);case _Refresh():
return refresh(_that);case _SelectOrder():
return selectOrder(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchOrders value)?  fetchOrders,TResult? Function( _FilterChanged value)?  filterChanged,TResult? Function( _Refresh value)?  refresh,TResult? Function( _SelectOrder value)?  selectOrder,}){
final _that = this;
switch (_that) {
case _FetchOrders() when fetchOrders != null:
return fetchOrders(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _Refresh() when refresh != null:
return refresh(_that);case _SelectOrder() when selectOrder != null:
return selectOrder(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? status)?  fetchOrders,TResult Function( String? status)?  filterChanged,TResult Function()?  refresh,TResult Function( int orderId)?  selectOrder,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchOrders() when fetchOrders != null:
return fetchOrders(_that.status);case _FilterChanged() when filterChanged != null:
return filterChanged(_that.status);case _Refresh() when refresh != null:
return refresh();case _SelectOrder() when selectOrder != null:
return selectOrder(_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? status)  fetchOrders,required TResult Function( String? status)  filterChanged,required TResult Function()  refresh,required TResult Function( int orderId)  selectOrder,}) {final _that = this;
switch (_that) {
case _FetchOrders():
return fetchOrders(_that.status);case _FilterChanged():
return filterChanged(_that.status);case _Refresh():
return refresh();case _SelectOrder():
return selectOrder(_that.orderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? status)?  fetchOrders,TResult? Function( String? status)?  filterChanged,TResult? Function()?  refresh,TResult? Function( int orderId)?  selectOrder,}) {final _that = this;
switch (_that) {
case _FetchOrders() when fetchOrders != null:
return fetchOrders(_that.status);case _FilterChanged() when filterChanged != null:
return filterChanged(_that.status);case _Refresh() when refresh != null:
return refresh();case _SelectOrder() when selectOrder != null:
return selectOrder(_that.orderId);case _:
  return null;

}
}

}

/// @nodoc


class _FetchOrders implements OrdersEvent {
  const _FetchOrders({this.status});
  

 final  String? status;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchOrdersCopyWith<_FetchOrders> get copyWith => __$FetchOrdersCopyWithImpl<_FetchOrders>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchOrders&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'OrdersEvent.fetchOrders(status: $status)';
}


}

/// @nodoc
abstract mixin class _$FetchOrdersCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$FetchOrdersCopyWith(_FetchOrders value, $Res Function(_FetchOrders) _then) = __$FetchOrdersCopyWithImpl;
@useResult
$Res call({
 String? status
});




}
/// @nodoc
class __$FetchOrdersCopyWithImpl<$Res>
    implements _$FetchOrdersCopyWith<$Res> {
  __$FetchOrdersCopyWithImpl(this._self, this._then);

  final _FetchOrders _self;
  final $Res Function(_FetchOrders) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(_FetchOrders(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _FilterChanged implements OrdersEvent {
  const _FilterChanged(this.status);
  

 final  String? status;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterChangedCopyWith<_FilterChanged> get copyWith => __$FilterChangedCopyWithImpl<_FilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterChanged&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'OrdersEvent.filterChanged(status: $status)';
}


}

/// @nodoc
abstract mixin class _$FilterChangedCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$FilterChangedCopyWith(_FilterChanged value, $Res Function(_FilterChanged) _then) = __$FilterChangedCopyWithImpl;
@useResult
$Res call({
 String? status
});




}
/// @nodoc
class __$FilterChangedCopyWithImpl<$Res>
    implements _$FilterChangedCopyWith<$Res> {
  __$FilterChangedCopyWithImpl(this._self, this._then);

  final _FilterChanged _self;
  final $Res Function(_FilterChanged) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(_FilterChanged(
freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Refresh implements OrdersEvent {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersEvent.refresh()';
}


}




/// @nodoc


class _SelectOrder implements OrdersEvent {
  const _SelectOrder(this.orderId);
  

 final  int orderId;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectOrderCopyWith<_SelectOrder> get copyWith => __$SelectOrderCopyWithImpl<_SelectOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectOrder&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'OrdersEvent.selectOrder(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$SelectOrderCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$SelectOrderCopyWith(_SelectOrder value, $Res Function(_SelectOrder) _then) = __$SelectOrderCopyWithImpl;
@useResult
$Res call({
 int orderId
});




}
/// @nodoc
class __$SelectOrderCopyWithImpl<$Res>
    implements _$SelectOrderCopyWith<$Res> {
  __$SelectOrderCopyWithImpl(this._self, this._then);

  final _SelectOrder _self;
  final $Res Function(_SelectOrder) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(_SelectOrder(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
