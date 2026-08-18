// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dispatch_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DispatchOfferModel {

 int get id; String? get status;@JsonKey(name: 'offered_at') String? get offeredAt;@JsonKey(name: 'expires_at') String? get expiresAt;@JsonKey(name: 'order_id') int? get orderId;@JsonKey(name: 'service_name') String? get serviceName;@JsonKey(name: 'client_name') String? get clientName;@JsonKey(name: 'client_phone') String? get clientPhone;@JsonKey(name: 'client_address') String? get clientAddress;@JsonKey(name: 'client_lat') double? get clientLat;@JsonKey(name: 'client_lng') double? get clientLng; String? get price;@JsonKey(name: 'distance_km') String? get distanceKm; Map<String, dynamic>? get order;
/// Create a copy of DispatchOfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DispatchOfferModelCopyWith<DispatchOfferModel> get copyWith => _$DispatchOfferModelCopyWithImpl<DispatchOfferModel>(this as DispatchOfferModel, _$identity);

  /// Serializes this DispatchOfferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DispatchOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.offeredAt, offeredAt) || other.offeredAt == offeredAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientPhone, clientPhone) || other.clientPhone == clientPhone)&&(identical(other.clientAddress, clientAddress) || other.clientAddress == clientAddress)&&(identical(other.clientLat, clientLat) || other.clientLat == clientLat)&&(identical(other.clientLng, clientLng) || other.clientLng == clientLng)&&(identical(other.price, price) || other.price == price)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&const DeepCollectionEquality().equals(other.order, order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,offeredAt,expiresAt,orderId,serviceName,clientName,clientPhone,clientAddress,clientLat,clientLng,price,distanceKm,const DeepCollectionEquality().hash(order));

@override
String toString() {
  return 'DispatchOfferModel(id: $id, status: $status, offeredAt: $offeredAt, expiresAt: $expiresAt, orderId: $orderId, serviceName: $serviceName, clientName: $clientName, clientPhone: $clientPhone, clientAddress: $clientAddress, clientLat: $clientLat, clientLng: $clientLng, price: $price, distanceKm: $distanceKm, order: $order)';
}


}

/// @nodoc
abstract mixin class $DispatchOfferModelCopyWith<$Res>  {
  factory $DispatchOfferModelCopyWith(DispatchOfferModel value, $Res Function(DispatchOfferModel) _then) = _$DispatchOfferModelCopyWithImpl;
@useResult
$Res call({
 int id, String? status,@JsonKey(name: 'offered_at') String? offeredAt,@JsonKey(name: 'expires_at') String? expiresAt,@JsonKey(name: 'order_id') int? orderId,@JsonKey(name: 'service_name') String? serviceName,@JsonKey(name: 'client_name') String? clientName,@JsonKey(name: 'client_phone') String? clientPhone,@JsonKey(name: 'client_address') String? clientAddress,@JsonKey(name: 'client_lat') double? clientLat,@JsonKey(name: 'client_lng') double? clientLng, String? price,@JsonKey(name: 'distance_km') String? distanceKm, Map<String, dynamic>? order
});




}
/// @nodoc
class _$DispatchOfferModelCopyWithImpl<$Res>
    implements $DispatchOfferModelCopyWith<$Res> {
  _$DispatchOfferModelCopyWithImpl(this._self, this._then);

  final DispatchOfferModel _self;
  final $Res Function(DispatchOfferModel) _then;

/// Create a copy of DispatchOfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = freezed,Object? offeredAt = freezed,Object? expiresAt = freezed,Object? orderId = freezed,Object? serviceName = freezed,Object? clientName = freezed,Object? clientPhone = freezed,Object? clientAddress = freezed,Object? clientLat = freezed,Object? clientLng = freezed,Object? price = freezed,Object? distanceKm = freezed,Object? order = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,offeredAt: freezed == offeredAt ? _self.offeredAt : offeredAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,clientPhone: freezed == clientPhone ? _self.clientPhone : clientPhone // ignore: cast_nullable_to_non_nullable
as String?,clientAddress: freezed == clientAddress ? _self.clientAddress : clientAddress // ignore: cast_nullable_to_non_nullable
as String?,clientLat: freezed == clientLat ? _self.clientLat : clientLat // ignore: cast_nullable_to_non_nullable
as double?,clientLng: freezed == clientLng ? _self.clientLng : clientLng // ignore: cast_nullable_to_non_nullable
as double?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DispatchOfferModel].
extension DispatchOfferModelPatterns on DispatchOfferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DispatchOfferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DispatchOfferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DispatchOfferModel value)  $default,){
final _that = this;
switch (_that) {
case _DispatchOfferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DispatchOfferModel value)?  $default,){
final _that = this;
switch (_that) {
case _DispatchOfferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? status, @JsonKey(name: 'offered_at')  String? offeredAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'order_id')  int? orderId, @JsonKey(name: 'service_name')  String? serviceName, @JsonKey(name: 'client_name')  String? clientName, @JsonKey(name: 'client_phone')  String? clientPhone, @JsonKey(name: 'client_address')  String? clientAddress, @JsonKey(name: 'client_lat')  double? clientLat, @JsonKey(name: 'client_lng')  double? clientLng,  String? price, @JsonKey(name: 'distance_km')  String? distanceKm,  Map<String, dynamic>? order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DispatchOfferModel() when $default != null:
return $default(_that.id,_that.status,_that.offeredAt,_that.expiresAt,_that.orderId,_that.serviceName,_that.clientName,_that.clientPhone,_that.clientAddress,_that.clientLat,_that.clientLng,_that.price,_that.distanceKm,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? status, @JsonKey(name: 'offered_at')  String? offeredAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'order_id')  int? orderId, @JsonKey(name: 'service_name')  String? serviceName, @JsonKey(name: 'client_name')  String? clientName, @JsonKey(name: 'client_phone')  String? clientPhone, @JsonKey(name: 'client_address')  String? clientAddress, @JsonKey(name: 'client_lat')  double? clientLat, @JsonKey(name: 'client_lng')  double? clientLng,  String? price, @JsonKey(name: 'distance_km')  String? distanceKm,  Map<String, dynamic>? order)  $default,) {final _that = this;
switch (_that) {
case _DispatchOfferModel():
return $default(_that.id,_that.status,_that.offeredAt,_that.expiresAt,_that.orderId,_that.serviceName,_that.clientName,_that.clientPhone,_that.clientAddress,_that.clientLat,_that.clientLng,_that.price,_that.distanceKm,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? status, @JsonKey(name: 'offered_at')  String? offeredAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'order_id')  int? orderId, @JsonKey(name: 'service_name')  String? serviceName, @JsonKey(name: 'client_name')  String? clientName, @JsonKey(name: 'client_phone')  String? clientPhone, @JsonKey(name: 'client_address')  String? clientAddress, @JsonKey(name: 'client_lat')  double? clientLat, @JsonKey(name: 'client_lng')  double? clientLng,  String? price, @JsonKey(name: 'distance_km')  String? distanceKm,  Map<String, dynamic>? order)?  $default,) {final _that = this;
switch (_that) {
case _DispatchOfferModel() when $default != null:
return $default(_that.id,_that.status,_that.offeredAt,_that.expiresAt,_that.orderId,_that.serviceName,_that.clientName,_that.clientPhone,_that.clientAddress,_that.clientLat,_that.clientLng,_that.price,_that.distanceKm,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DispatchOfferModel extends DispatchOfferModel {
  const _DispatchOfferModel({required this.id, this.status, @JsonKey(name: 'offered_at') this.offeredAt, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'order_id') this.orderId, @JsonKey(name: 'service_name') this.serviceName, @JsonKey(name: 'client_name') this.clientName, @JsonKey(name: 'client_phone') this.clientPhone, @JsonKey(name: 'client_address') this.clientAddress, @JsonKey(name: 'client_lat') this.clientLat, @JsonKey(name: 'client_lng') this.clientLng, this.price, @JsonKey(name: 'distance_km') this.distanceKm, final  Map<String, dynamic>? order}): _order = order,super._();
  factory _DispatchOfferModel.fromJson(Map<String, dynamic> json) => _$DispatchOfferModelFromJson(json);

@override final  int id;
@override final  String? status;
@override@JsonKey(name: 'offered_at') final  String? offeredAt;
@override@JsonKey(name: 'expires_at') final  String? expiresAt;
@override@JsonKey(name: 'order_id') final  int? orderId;
@override@JsonKey(name: 'service_name') final  String? serviceName;
@override@JsonKey(name: 'client_name') final  String? clientName;
@override@JsonKey(name: 'client_phone') final  String? clientPhone;
@override@JsonKey(name: 'client_address') final  String? clientAddress;
@override@JsonKey(name: 'client_lat') final  double? clientLat;
@override@JsonKey(name: 'client_lng') final  double? clientLng;
@override final  String? price;
@override@JsonKey(name: 'distance_km') final  String? distanceKm;
 final  Map<String, dynamic>? _order;
@override Map<String, dynamic>? get order {
  final value = _order;
  if (value == null) return null;
  if (_order is EqualUnmodifiableMapView) return _order;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DispatchOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DispatchOfferModelCopyWith<_DispatchOfferModel> get copyWith => __$DispatchOfferModelCopyWithImpl<_DispatchOfferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DispatchOfferModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DispatchOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.offeredAt, offeredAt) || other.offeredAt == offeredAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientPhone, clientPhone) || other.clientPhone == clientPhone)&&(identical(other.clientAddress, clientAddress) || other.clientAddress == clientAddress)&&(identical(other.clientLat, clientLat) || other.clientLat == clientLat)&&(identical(other.clientLng, clientLng) || other.clientLng == clientLng)&&(identical(other.price, price) || other.price == price)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&const DeepCollectionEquality().equals(other._order, _order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,offeredAt,expiresAt,orderId,serviceName,clientName,clientPhone,clientAddress,clientLat,clientLng,price,distanceKm,const DeepCollectionEquality().hash(_order));

@override
String toString() {
  return 'DispatchOfferModel(id: $id, status: $status, offeredAt: $offeredAt, expiresAt: $expiresAt, orderId: $orderId, serviceName: $serviceName, clientName: $clientName, clientPhone: $clientPhone, clientAddress: $clientAddress, clientLat: $clientLat, clientLng: $clientLng, price: $price, distanceKm: $distanceKm, order: $order)';
}


}

/// @nodoc
abstract mixin class _$DispatchOfferModelCopyWith<$Res> implements $DispatchOfferModelCopyWith<$Res> {
  factory _$DispatchOfferModelCopyWith(_DispatchOfferModel value, $Res Function(_DispatchOfferModel) _then) = __$DispatchOfferModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? status,@JsonKey(name: 'offered_at') String? offeredAt,@JsonKey(name: 'expires_at') String? expiresAt,@JsonKey(name: 'order_id') int? orderId,@JsonKey(name: 'service_name') String? serviceName,@JsonKey(name: 'client_name') String? clientName,@JsonKey(name: 'client_phone') String? clientPhone,@JsonKey(name: 'client_address') String? clientAddress,@JsonKey(name: 'client_lat') double? clientLat,@JsonKey(name: 'client_lng') double? clientLng, String? price,@JsonKey(name: 'distance_km') String? distanceKm, Map<String, dynamic>? order
});




}
/// @nodoc
class __$DispatchOfferModelCopyWithImpl<$Res>
    implements _$DispatchOfferModelCopyWith<$Res> {
  __$DispatchOfferModelCopyWithImpl(this._self, this._then);

  final _DispatchOfferModel _self;
  final $Res Function(_DispatchOfferModel) _then;

/// Create a copy of DispatchOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = freezed,Object? offeredAt = freezed,Object? expiresAt = freezed,Object? orderId = freezed,Object? serviceName = freezed,Object? clientName = freezed,Object? clientPhone = freezed,Object? clientAddress = freezed,Object? clientLat = freezed,Object? clientLng = freezed,Object? price = freezed,Object? distanceKm = freezed,Object? order = freezed,}) {
  return _then(_DispatchOfferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,offeredAt: freezed == offeredAt ? _self.offeredAt : offeredAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,clientPhone: freezed == clientPhone ? _self.clientPhone : clientPhone // ignore: cast_nullable_to_non_nullable
as String?,clientAddress: freezed == clientAddress ? _self.clientAddress : clientAddress // ignore: cast_nullable_to_non_nullable
as String?,clientLat: freezed == clientLat ? _self.clientLat : clientLat // ignore: cast_nullable_to_non_nullable
as double?,clientLng: freezed == clientLng ? _self.clientLng : clientLng // ignore: cast_nullable_to_non_nullable
as double?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self._order : order // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
