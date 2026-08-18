// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderItem {

 int get id; String get status;// 'pending', 'accepted', 'assigned', 'arrived', 'in_progress', 'quoted', 'approved', 'parts_waiting', 'closure_requested', 'completed', 'cancelled', 'expired'
 String get type;// 'urgent', 'scheduled'
 String get kind;// 'normal', 'warranty'
 int? get serviceCategoryId; String get serviceCategoryName; OrderAddress? get address; double? get lat; double? get lng; String? get description; DateTime? get scheduledAt; DateTime? get arrivedAt; DateTime? get partsWaitingUntil; String? get inspectionFee; String? get commissionRate; List<OrderPhotoItem> get photos; DateTime? get createdAt; String? get clientName; String? get clientPhone;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.serviceCategoryId, serviceCategoryId) || other.serviceCategoryId == serviceCategoryId)&&(identical(other.serviceCategoryName, serviceCategoryName) || other.serviceCategoryName == serviceCategoryName)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.description, description) || other.description == description)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.arrivedAt, arrivedAt) || other.arrivedAt == arrivedAt)&&(identical(other.partsWaitingUntil, partsWaitingUntil) || other.partsWaitingUntil == partsWaitingUntil)&&(identical(other.inspectionFee, inspectionFee) || other.inspectionFee == inspectionFee)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientPhone, clientPhone) || other.clientPhone == clientPhone));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,status,type,kind,serviceCategoryId,serviceCategoryName,address,lat,lng,description,scheduledAt,arrivedAt,partsWaitingUntil,inspectionFee,commissionRate,const DeepCollectionEquality().hash(photos),createdAt,clientName,clientPhone]);

@override
String toString() {
  return 'OrderItem(id: $id, status: $status, type: $type, kind: $kind, serviceCategoryId: $serviceCategoryId, serviceCategoryName: $serviceCategoryName, address: $address, lat: $lat, lng: $lng, description: $description, scheduledAt: $scheduledAt, arrivedAt: $arrivedAt, partsWaitingUntil: $partsWaitingUntil, inspectionFee: $inspectionFee, commissionRate: $commissionRate, photos: $photos, createdAt: $createdAt, clientName: $clientName, clientPhone: $clientPhone)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 int id, String status, String type, String kind, int? serviceCategoryId, String serviceCategoryName, OrderAddress? address, double? lat, double? lng, String? description, DateTime? scheduledAt, DateTime? arrivedAt, DateTime? partsWaitingUntil, String? inspectionFee, String? commissionRate, List<OrderPhotoItem> photos, DateTime? createdAt, String? clientName, String? clientPhone
});


$OrderAddressCopyWith<$Res>? get address;

}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? type = null,Object? kind = null,Object? serviceCategoryId = freezed,Object? serviceCategoryName = null,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,Object? description = freezed,Object? scheduledAt = freezed,Object? arrivedAt = freezed,Object? partsWaitingUntil = freezed,Object? inspectionFee = freezed,Object? commissionRate = freezed,Object? photos = null,Object? createdAt = freezed,Object? clientName = freezed,Object? clientPhone = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,serviceCategoryId: freezed == serviceCategoryId ? _self.serviceCategoryId : serviceCategoryId // ignore: cast_nullable_to_non_nullable
as int?,serviceCategoryName: null == serviceCategoryName ? _self.serviceCategoryName : serviceCategoryName // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as OrderAddress?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivedAt: freezed == arrivedAt ? _self.arrivedAt : arrivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,partsWaitingUntil: freezed == partsWaitingUntil ? _self.partsWaitingUntil : partsWaitingUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectionFee: freezed == inspectionFee ? _self.inspectionFee : inspectionFee // ignore: cast_nullable_to_non_nullable
as String?,commissionRate: freezed == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<OrderPhotoItem>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,clientPhone: freezed == clientPhone ? _self.clientPhone : clientPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderAddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $OrderAddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status,  String type,  String kind,  int? serviceCategoryId,  String serviceCategoryName,  OrderAddress? address,  double? lat,  double? lng,  String? description,  DateTime? scheduledAt,  DateTime? arrivedAt,  DateTime? partsWaitingUntil,  String? inspectionFee,  String? commissionRate,  List<OrderPhotoItem> photos,  DateTime? createdAt,  String? clientName,  String? clientPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.status,_that.type,_that.kind,_that.serviceCategoryId,_that.serviceCategoryName,_that.address,_that.lat,_that.lng,_that.description,_that.scheduledAt,_that.arrivedAt,_that.partsWaitingUntil,_that.inspectionFee,_that.commissionRate,_that.photos,_that.createdAt,_that.clientName,_that.clientPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status,  String type,  String kind,  int? serviceCategoryId,  String serviceCategoryName,  OrderAddress? address,  double? lat,  double? lng,  String? description,  DateTime? scheduledAt,  DateTime? arrivedAt,  DateTime? partsWaitingUntil,  String? inspectionFee,  String? commissionRate,  List<OrderPhotoItem> photos,  DateTime? createdAt,  String? clientName,  String? clientPhone)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.id,_that.status,_that.type,_that.kind,_that.serviceCategoryId,_that.serviceCategoryName,_that.address,_that.lat,_that.lng,_that.description,_that.scheduledAt,_that.arrivedAt,_that.partsWaitingUntil,_that.inspectionFee,_that.commissionRate,_that.photos,_that.createdAt,_that.clientName,_that.clientPhone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status,  String type,  String kind,  int? serviceCategoryId,  String serviceCategoryName,  OrderAddress? address,  double? lat,  double? lng,  String? description,  DateTime? scheduledAt,  DateTime? arrivedAt,  DateTime? partsWaitingUntil,  String? inspectionFee,  String? commissionRate,  List<OrderPhotoItem> photos,  DateTime? createdAt,  String? clientName,  String? clientPhone)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.status,_that.type,_that.kind,_that.serviceCategoryId,_that.serviceCategoryName,_that.address,_that.lat,_that.lng,_that.description,_that.scheduledAt,_that.arrivedAt,_that.partsWaitingUntil,_that.inspectionFee,_that.commissionRate,_that.photos,_that.createdAt,_that.clientName,_that.clientPhone);case _:
  return null;

}
}

}

/// @nodoc


class _OrderItem implements OrderItem {
  const _OrderItem({required this.id, required this.status, this.type = 'urgent', this.kind = 'normal', this.serviceCategoryId, this.serviceCategoryName = 'طلب صيانة', this.address, this.lat, this.lng, this.description, this.scheduledAt, this.arrivedAt, this.partsWaitingUntil, this.inspectionFee, this.commissionRate, final  List<OrderPhotoItem> photos = const [], this.createdAt, this.clientName, this.clientPhone}): _photos = photos;
  

@override final  int id;
@override final  String status;
// 'pending', 'accepted', 'assigned', 'arrived', 'in_progress', 'quoted', 'approved', 'parts_waiting', 'closure_requested', 'completed', 'cancelled', 'expired'
@override@JsonKey() final  String type;
// 'urgent', 'scheduled'
@override@JsonKey() final  String kind;
// 'normal', 'warranty'
@override final  int? serviceCategoryId;
@override@JsonKey() final  String serviceCategoryName;
@override final  OrderAddress? address;
@override final  double? lat;
@override final  double? lng;
@override final  String? description;
@override final  DateTime? scheduledAt;
@override final  DateTime? arrivedAt;
@override final  DateTime? partsWaitingUntil;
@override final  String? inspectionFee;
@override final  String? commissionRate;
 final  List<OrderPhotoItem> _photos;
@override@JsonKey() List<OrderPhotoItem> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  DateTime? createdAt;
@override final  String? clientName;
@override final  String? clientPhone;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.serviceCategoryId, serviceCategoryId) || other.serviceCategoryId == serviceCategoryId)&&(identical(other.serviceCategoryName, serviceCategoryName) || other.serviceCategoryName == serviceCategoryName)&&(identical(other.address, address) || other.address == address)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.description, description) || other.description == description)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.arrivedAt, arrivedAt) || other.arrivedAt == arrivedAt)&&(identical(other.partsWaitingUntil, partsWaitingUntil) || other.partsWaitingUntil == partsWaitingUntil)&&(identical(other.inspectionFee, inspectionFee) || other.inspectionFee == inspectionFee)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientPhone, clientPhone) || other.clientPhone == clientPhone));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,status,type,kind,serviceCategoryId,serviceCategoryName,address,lat,lng,description,scheduledAt,arrivedAt,partsWaitingUntil,inspectionFee,commissionRate,const DeepCollectionEquality().hash(_photos),createdAt,clientName,clientPhone]);

@override
String toString() {
  return 'OrderItem(id: $id, status: $status, type: $type, kind: $kind, serviceCategoryId: $serviceCategoryId, serviceCategoryName: $serviceCategoryName, address: $address, lat: $lat, lng: $lng, description: $description, scheduledAt: $scheduledAt, arrivedAt: $arrivedAt, partsWaitingUntil: $partsWaitingUntil, inspectionFee: $inspectionFee, commissionRate: $commissionRate, photos: $photos, createdAt: $createdAt, clientName: $clientName, clientPhone: $clientPhone)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String status, String type, String kind, int? serviceCategoryId, String serviceCategoryName, OrderAddress? address, double? lat, double? lng, String? description, DateTime? scheduledAt, DateTime? arrivedAt, DateTime? partsWaitingUntil, String? inspectionFee, String? commissionRate, List<OrderPhotoItem> photos, DateTime? createdAt, String? clientName, String? clientPhone
});


@override $OrderAddressCopyWith<$Res>? get address;

}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? type = null,Object? kind = null,Object? serviceCategoryId = freezed,Object? serviceCategoryName = null,Object? address = freezed,Object? lat = freezed,Object? lng = freezed,Object? description = freezed,Object? scheduledAt = freezed,Object? arrivedAt = freezed,Object? partsWaitingUntil = freezed,Object? inspectionFee = freezed,Object? commissionRate = freezed,Object? photos = null,Object? createdAt = freezed,Object? clientName = freezed,Object? clientPhone = freezed,}) {
  return _then(_OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,serviceCategoryId: freezed == serviceCategoryId ? _self.serviceCategoryId : serviceCategoryId // ignore: cast_nullable_to_non_nullable
as int?,serviceCategoryName: null == serviceCategoryName ? _self.serviceCategoryName : serviceCategoryName // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as OrderAddress?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivedAt: freezed == arrivedAt ? _self.arrivedAt : arrivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,partsWaitingUntil: freezed == partsWaitingUntil ? _self.partsWaitingUntil : partsWaitingUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectionFee: freezed == inspectionFee ? _self.inspectionFee : inspectionFee // ignore: cast_nullable_to_non_nullable
as String?,commissionRate: freezed == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<OrderPhotoItem>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,clientPhone: freezed == clientPhone ? _self.clientPhone : clientPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderAddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $OrderAddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
