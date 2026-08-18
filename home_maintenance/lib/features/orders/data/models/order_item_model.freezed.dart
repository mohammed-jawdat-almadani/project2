// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemModel {

 int get id; String get status; String get type; String get kind;@JsonKey(name: 'service_category_id') dynamic get serviceCategoryId;@JsonKey(name: 'service_category') Map<String, dynamic>? get serviceCategory; Map<String, dynamic>? get address; Map<String, dynamic>? get client; dynamic get lat; dynamic get lng; String? get description;@JsonKey(name: 'scheduled_at') String? get scheduledAt;@JsonKey(name: 'arrived_at') String? get arrivedAt;@JsonKey(name: 'parts_waiting_until') String? get partsWaitingUntil;@JsonKey(name: 'inspection_fee') dynamic get inspectionFee;@JsonKey(name: 'commission_rate') dynamic get commissionRate; List<Map<String, dynamic>> get photos;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemModelCopyWith<OrderItemModel> get copyWith => _$OrderItemModelCopyWithImpl<OrderItemModel>(this as OrderItemModel, _$identity);

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.serviceCategoryId, serviceCategoryId)&&const DeepCollectionEquality().equals(other.serviceCategory, serviceCategory)&&const DeepCollectionEquality().equals(other.address, address)&&const DeepCollectionEquality().equals(other.client, client)&&const DeepCollectionEquality().equals(other.lat, lat)&&const DeepCollectionEquality().equals(other.lng, lng)&&(identical(other.description, description) || other.description == description)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.arrivedAt, arrivedAt) || other.arrivedAt == arrivedAt)&&(identical(other.partsWaitingUntil, partsWaitingUntil) || other.partsWaitingUntil == partsWaitingUntil)&&const DeepCollectionEquality().equals(other.inspectionFee, inspectionFee)&&const DeepCollectionEquality().equals(other.commissionRate, commissionRate)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,type,kind,const DeepCollectionEquality().hash(serviceCategoryId),const DeepCollectionEquality().hash(serviceCategory),const DeepCollectionEquality().hash(address),const DeepCollectionEquality().hash(client),const DeepCollectionEquality().hash(lat),const DeepCollectionEquality().hash(lng),description,scheduledAt,arrivedAt,partsWaitingUntil,const DeepCollectionEquality().hash(inspectionFee),const DeepCollectionEquality().hash(commissionRate),const DeepCollectionEquality().hash(photos),createdAt);

@override
String toString() {
  return 'OrderItemModel(id: $id, status: $status, type: $type, kind: $kind, serviceCategoryId: $serviceCategoryId, serviceCategory: $serviceCategory, address: $address, client: $client, lat: $lat, lng: $lng, description: $description, scheduledAt: $scheduledAt, arrivedAt: $arrivedAt, partsWaitingUntil: $partsWaitingUntil, inspectionFee: $inspectionFee, commissionRate: $commissionRate, photos: $photos, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res>  {
  factory $OrderItemModelCopyWith(OrderItemModel value, $Res Function(OrderItemModel) _then) = _$OrderItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String status, String type, String kind,@JsonKey(name: 'service_category_id') dynamic serviceCategoryId,@JsonKey(name: 'service_category') Map<String, dynamic>? serviceCategory, Map<String, dynamic>? address, Map<String, dynamic>? client, dynamic lat, dynamic lng, String? description,@JsonKey(name: 'scheduled_at') String? scheduledAt,@JsonKey(name: 'arrived_at') String? arrivedAt,@JsonKey(name: 'parts_waiting_until') String? partsWaitingUntil,@JsonKey(name: 'inspection_fee') dynamic inspectionFee,@JsonKey(name: 'commission_rate') dynamic commissionRate, List<Map<String, dynamic>> photos,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? type = null,Object? kind = null,Object? serviceCategoryId = freezed,Object? serviceCategory = freezed,Object? address = freezed,Object? client = freezed,Object? lat = freezed,Object? lng = freezed,Object? description = freezed,Object? scheduledAt = freezed,Object? arrivedAt = freezed,Object? partsWaitingUntil = freezed,Object? inspectionFee = freezed,Object? commissionRate = freezed,Object? photos = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,serviceCategoryId: freezed == serviceCategoryId ? _self.serviceCategoryId : serviceCategoryId // ignore: cast_nullable_to_non_nullable
as dynamic,serviceCategory: freezed == serviceCategory ? _self.serviceCategory : serviceCategory // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,client: freezed == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as dynamic,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as dynamic,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as String?,arrivedAt: freezed == arrivedAt ? _self.arrivedAt : arrivedAt // ignore: cast_nullable_to_non_nullable
as String?,partsWaitingUntil: freezed == partsWaitingUntil ? _self.partsWaitingUntil : partsWaitingUntil // ignore: cast_nullable_to_non_nullable
as String?,inspectionFee: freezed == inspectionFee ? _self.inspectionFee : inspectionFee // ignore: cast_nullable_to_non_nullable
as dynamic,commissionRate: freezed == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as dynamic,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status,  String type,  String kind, @JsonKey(name: 'service_category_id')  dynamic serviceCategoryId, @JsonKey(name: 'service_category')  Map<String, dynamic>? serviceCategory,  Map<String, dynamic>? address,  Map<String, dynamic>? client,  dynamic lat,  dynamic lng,  String? description, @JsonKey(name: 'scheduled_at')  String? scheduledAt, @JsonKey(name: 'arrived_at')  String? arrivedAt, @JsonKey(name: 'parts_waiting_until')  String? partsWaitingUntil, @JsonKey(name: 'inspection_fee')  dynamic inspectionFee, @JsonKey(name: 'commission_rate')  dynamic commissionRate,  List<Map<String, dynamic>> photos, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.status,_that.type,_that.kind,_that.serviceCategoryId,_that.serviceCategory,_that.address,_that.client,_that.lat,_that.lng,_that.description,_that.scheduledAt,_that.arrivedAt,_that.partsWaitingUntil,_that.inspectionFee,_that.commissionRate,_that.photos,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status,  String type,  String kind, @JsonKey(name: 'service_category_id')  dynamic serviceCategoryId, @JsonKey(name: 'service_category')  Map<String, dynamic>? serviceCategory,  Map<String, dynamic>? address,  Map<String, dynamic>? client,  dynamic lat,  dynamic lng,  String? description, @JsonKey(name: 'scheduled_at')  String? scheduledAt, @JsonKey(name: 'arrived_at')  String? arrivedAt, @JsonKey(name: 'parts_waiting_until')  String? partsWaitingUntil, @JsonKey(name: 'inspection_fee')  dynamic inspectionFee, @JsonKey(name: 'commission_rate')  dynamic commissionRate,  List<Map<String, dynamic>> photos, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel():
return $default(_that.id,_that.status,_that.type,_that.kind,_that.serviceCategoryId,_that.serviceCategory,_that.address,_that.client,_that.lat,_that.lng,_that.description,_that.scheduledAt,_that.arrivedAt,_that.partsWaitingUntil,_that.inspectionFee,_that.commissionRate,_that.photos,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status,  String type,  String kind, @JsonKey(name: 'service_category_id')  dynamic serviceCategoryId, @JsonKey(name: 'service_category')  Map<String, dynamic>? serviceCategory,  Map<String, dynamic>? address,  Map<String, dynamic>? client,  dynamic lat,  dynamic lng,  String? description, @JsonKey(name: 'scheduled_at')  String? scheduledAt, @JsonKey(name: 'arrived_at')  String? arrivedAt, @JsonKey(name: 'parts_waiting_until')  String? partsWaitingUntil, @JsonKey(name: 'inspection_fee')  dynamic inspectionFee, @JsonKey(name: 'commission_rate')  dynamic commissionRate,  List<Map<String, dynamic>> photos, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.status,_that.type,_that.kind,_that.serviceCategoryId,_that.serviceCategory,_that.address,_that.client,_that.lat,_that.lng,_that.description,_that.scheduledAt,_that.arrivedAt,_that.partsWaitingUntil,_that.inspectionFee,_that.commissionRate,_that.photos,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemModel extends OrderItemModel {
  const _OrderItemModel({required this.id, required this.status, this.type = 'urgent', this.kind = 'normal', @JsonKey(name: 'service_category_id') this.serviceCategoryId, @JsonKey(name: 'service_category') final  Map<String, dynamic>? serviceCategory, final  Map<String, dynamic>? address, final  Map<String, dynamic>? client, this.lat, this.lng, this.description, @JsonKey(name: 'scheduled_at') this.scheduledAt, @JsonKey(name: 'arrived_at') this.arrivedAt, @JsonKey(name: 'parts_waiting_until') this.partsWaitingUntil, @JsonKey(name: 'inspection_fee') this.inspectionFee, @JsonKey(name: 'commission_rate') this.commissionRate, final  List<Map<String, dynamic>> photos = const [], @JsonKey(name: 'created_at') this.createdAt}): _serviceCategory = serviceCategory,_address = address,_client = client,_photos = photos,super._();
  factory _OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

@override final  int id;
@override final  String status;
@override@JsonKey() final  String type;
@override@JsonKey() final  String kind;
@override@JsonKey(name: 'service_category_id') final  dynamic serviceCategoryId;
 final  Map<String, dynamic>? _serviceCategory;
@override@JsonKey(name: 'service_category') Map<String, dynamic>? get serviceCategory {
  final value = _serviceCategory;
  if (value == null) return null;
  if (_serviceCategory is EqualUnmodifiableMapView) return _serviceCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _address;
@override Map<String, dynamic>? get address {
  final value = _address;
  if (value == null) return null;
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _client;
@override Map<String, dynamic>? get client {
  final value = _client;
  if (value == null) return null;
  if (_client is EqualUnmodifiableMapView) return _client;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  dynamic lat;
@override final  dynamic lng;
@override final  String? description;
@override@JsonKey(name: 'scheduled_at') final  String? scheduledAt;
@override@JsonKey(name: 'arrived_at') final  String? arrivedAt;
@override@JsonKey(name: 'parts_waiting_until') final  String? partsWaitingUntil;
@override@JsonKey(name: 'inspection_fee') final  dynamic inspectionFee;
@override@JsonKey(name: 'commission_rate') final  dynamic commissionRate;
 final  List<Map<String, dynamic>> _photos;
@override@JsonKey() List<Map<String, dynamic>> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemModelCopyWith<_OrderItemModel> get copyWith => __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.serviceCategoryId, serviceCategoryId)&&const DeepCollectionEquality().equals(other._serviceCategory, _serviceCategory)&&const DeepCollectionEquality().equals(other._address, _address)&&const DeepCollectionEquality().equals(other._client, _client)&&const DeepCollectionEquality().equals(other.lat, lat)&&const DeepCollectionEquality().equals(other.lng, lng)&&(identical(other.description, description) || other.description == description)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.arrivedAt, arrivedAt) || other.arrivedAt == arrivedAt)&&(identical(other.partsWaitingUntil, partsWaitingUntil) || other.partsWaitingUntil == partsWaitingUntil)&&const DeepCollectionEquality().equals(other.inspectionFee, inspectionFee)&&const DeepCollectionEquality().equals(other.commissionRate, commissionRate)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,type,kind,const DeepCollectionEquality().hash(serviceCategoryId),const DeepCollectionEquality().hash(_serviceCategory),const DeepCollectionEquality().hash(_address),const DeepCollectionEquality().hash(_client),const DeepCollectionEquality().hash(lat),const DeepCollectionEquality().hash(lng),description,scheduledAt,arrivedAt,partsWaitingUntil,const DeepCollectionEquality().hash(inspectionFee),const DeepCollectionEquality().hash(commissionRate),const DeepCollectionEquality().hash(_photos),createdAt);

@override
String toString() {
  return 'OrderItemModel(id: $id, status: $status, type: $type, kind: $kind, serviceCategoryId: $serviceCategoryId, serviceCategory: $serviceCategory, address: $address, client: $client, lat: $lat, lng: $lng, description: $description, scheduledAt: $scheduledAt, arrivedAt: $arrivedAt, partsWaitingUntil: $partsWaitingUntil, inspectionFee: $inspectionFee, commissionRate: $commissionRate, photos: $photos, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res> implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(_OrderItemModel value, $Res Function(_OrderItemModel) _then) = __$OrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status, String type, String kind,@JsonKey(name: 'service_category_id') dynamic serviceCategoryId,@JsonKey(name: 'service_category') Map<String, dynamic>? serviceCategory, Map<String, dynamic>? address, Map<String, dynamic>? client, dynamic lat, dynamic lng, String? description,@JsonKey(name: 'scheduled_at') String? scheduledAt,@JsonKey(name: 'arrived_at') String? arrivedAt,@JsonKey(name: 'parts_waiting_until') String? partsWaitingUntil,@JsonKey(name: 'inspection_fee') dynamic inspectionFee,@JsonKey(name: 'commission_rate') dynamic commissionRate, List<Map<String, dynamic>> photos,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? type = null,Object? kind = null,Object? serviceCategoryId = freezed,Object? serviceCategory = freezed,Object? address = freezed,Object? client = freezed,Object? lat = freezed,Object? lng = freezed,Object? description = freezed,Object? scheduledAt = freezed,Object? arrivedAt = freezed,Object? partsWaitingUntil = freezed,Object? inspectionFee = freezed,Object? commissionRate = freezed,Object? photos = null,Object? createdAt = freezed,}) {
  return _then(_OrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,serviceCategoryId: freezed == serviceCategoryId ? _self.serviceCategoryId : serviceCategoryId // ignore: cast_nullable_to_non_nullable
as dynamic,serviceCategory: freezed == serviceCategory ? _self._serviceCategory : serviceCategory // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,address: freezed == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,client: freezed == client ? _self._client : client // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as dynamic,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as dynamic,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as String?,arrivedAt: freezed == arrivedAt ? _self.arrivedAt : arrivedAt // ignore: cast_nullable_to_non_nullable
as String?,partsWaitingUntil: freezed == partsWaitingUntil ? _self.partsWaitingUntil : partsWaitingUntil // ignore: cast_nullable_to_non_nullable
as String?,inspectionFee: freezed == inspectionFee ? _self.inspectionFee : inspectionFee // ignore: cast_nullable_to_non_nullable
as dynamic,commissionRate: freezed == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as dynamic,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
