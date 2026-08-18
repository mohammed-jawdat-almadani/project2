// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dispatch_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DispatchOffer {

 int get id; int get orderId; String get serviceName; String get clientName; String get clientPhone; String get clientAddress; double get clientLat; double get clientLng; String? get price; String? get distanceKm; DateTime? get offeredAt; DateTime? get expiresAt; String? get status; DateTime? get arrivedAt; String? get orderType;// 'urgent', 'scheduled'
 String? get orderKind;// 'normal', 'warranty'
 int? get serviceCategoryId; String? get description; String? get inspectionFee; String? get commissionRate; String? get addressLabel; String? get buildingNo; String? get floor; String? get addressNotes; List<String> get photos; DateTime? get scheduledAt;
/// Create a copy of DispatchOffer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DispatchOfferCopyWith<DispatchOffer> get copyWith => _$DispatchOfferCopyWithImpl<DispatchOffer>(this as DispatchOffer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DispatchOffer&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientPhone, clientPhone) || other.clientPhone == clientPhone)&&(identical(other.clientAddress, clientAddress) || other.clientAddress == clientAddress)&&(identical(other.clientLat, clientLat) || other.clientLat == clientLat)&&(identical(other.clientLng, clientLng) || other.clientLng == clientLng)&&(identical(other.price, price) || other.price == price)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.offeredAt, offeredAt) || other.offeredAt == offeredAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.arrivedAt, arrivedAt) || other.arrivedAt == arrivedAt)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.orderKind, orderKind) || other.orderKind == orderKind)&&(identical(other.serviceCategoryId, serviceCategoryId) || other.serviceCategoryId == serviceCategoryId)&&(identical(other.description, description) || other.description == description)&&(identical(other.inspectionFee, inspectionFee) || other.inspectionFee == inspectionFee)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.buildingNo, buildingNo) || other.buildingNo == buildingNo)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.addressNotes, addressNotes) || other.addressNotes == addressNotes)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,orderId,serviceName,clientName,clientPhone,clientAddress,clientLat,clientLng,price,distanceKm,offeredAt,expiresAt,status,arrivedAt,orderType,orderKind,serviceCategoryId,description,inspectionFee,commissionRate,addressLabel,buildingNo,floor,addressNotes,const DeepCollectionEquality().hash(photos),scheduledAt]);

@override
String toString() {
  return 'DispatchOffer(id: $id, orderId: $orderId, serviceName: $serviceName, clientName: $clientName, clientPhone: $clientPhone, clientAddress: $clientAddress, clientLat: $clientLat, clientLng: $clientLng, price: $price, distanceKm: $distanceKm, offeredAt: $offeredAt, expiresAt: $expiresAt, status: $status, arrivedAt: $arrivedAt, orderType: $orderType, orderKind: $orderKind, serviceCategoryId: $serviceCategoryId, description: $description, inspectionFee: $inspectionFee, commissionRate: $commissionRate, addressLabel: $addressLabel, buildingNo: $buildingNo, floor: $floor, addressNotes: $addressNotes, photos: $photos, scheduledAt: $scheduledAt)';
}


}

/// @nodoc
abstract mixin class $DispatchOfferCopyWith<$Res>  {
  factory $DispatchOfferCopyWith(DispatchOffer value, $Res Function(DispatchOffer) _then) = _$DispatchOfferCopyWithImpl;
@useResult
$Res call({
 int id, int orderId, String serviceName, String clientName, String clientPhone, String clientAddress, double clientLat, double clientLng, String? price, String? distanceKm, DateTime? offeredAt, DateTime? expiresAt, String? status, DateTime? arrivedAt, String? orderType, String? orderKind, int? serviceCategoryId, String? description, String? inspectionFee, String? commissionRate, String? addressLabel, String? buildingNo, String? floor, String? addressNotes, List<String> photos, DateTime? scheduledAt
});




}
/// @nodoc
class _$DispatchOfferCopyWithImpl<$Res>
    implements $DispatchOfferCopyWith<$Res> {
  _$DispatchOfferCopyWithImpl(this._self, this._then);

  final DispatchOffer _self;
  final $Res Function(DispatchOffer) _then;

/// Create a copy of DispatchOffer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? serviceName = null,Object? clientName = null,Object? clientPhone = null,Object? clientAddress = null,Object? clientLat = null,Object? clientLng = null,Object? price = freezed,Object? distanceKm = freezed,Object? offeredAt = freezed,Object? expiresAt = freezed,Object? status = freezed,Object? arrivedAt = freezed,Object? orderType = freezed,Object? orderKind = freezed,Object? serviceCategoryId = freezed,Object? description = freezed,Object? inspectionFee = freezed,Object? commissionRate = freezed,Object? addressLabel = freezed,Object? buildingNo = freezed,Object? floor = freezed,Object? addressNotes = freezed,Object? photos = null,Object? scheduledAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientPhone: null == clientPhone ? _self.clientPhone : clientPhone // ignore: cast_nullable_to_non_nullable
as String,clientAddress: null == clientAddress ? _self.clientAddress : clientAddress // ignore: cast_nullable_to_non_nullable
as String,clientLat: null == clientLat ? _self.clientLat : clientLat // ignore: cast_nullable_to_non_nullable
as double,clientLng: null == clientLng ? _self.clientLng : clientLng // ignore: cast_nullable_to_non_nullable
as double,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as String?,offeredAt: freezed == offeredAt ? _self.offeredAt : offeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,arrivedAt: freezed == arrivedAt ? _self.arrivedAt : arrivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,orderType: freezed == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as String?,orderKind: freezed == orderKind ? _self.orderKind : orderKind // ignore: cast_nullable_to_non_nullable
as String?,serviceCategoryId: freezed == serviceCategoryId ? _self.serviceCategoryId : serviceCategoryId // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,inspectionFee: freezed == inspectionFee ? _self.inspectionFee : inspectionFee // ignore: cast_nullable_to_non_nullable
as String?,commissionRate: freezed == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as String?,addressLabel: freezed == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String?,buildingNo: freezed == buildingNo ? _self.buildingNo : buildingNo // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,addressNotes: freezed == addressNotes ? _self.addressNotes : addressNotes // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DispatchOffer].
extension DispatchOfferPatterns on DispatchOffer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DispatchOffer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DispatchOffer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DispatchOffer value)  $default,){
final _that = this;
switch (_that) {
case _DispatchOffer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DispatchOffer value)?  $default,){
final _that = this;
switch (_that) {
case _DispatchOffer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int orderId,  String serviceName,  String clientName,  String clientPhone,  String clientAddress,  double clientLat,  double clientLng,  String? price,  String? distanceKm,  DateTime? offeredAt,  DateTime? expiresAt,  String? status,  DateTime? arrivedAt,  String? orderType,  String? orderKind,  int? serviceCategoryId,  String? description,  String? inspectionFee,  String? commissionRate,  String? addressLabel,  String? buildingNo,  String? floor,  String? addressNotes,  List<String> photos,  DateTime? scheduledAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DispatchOffer() when $default != null:
return $default(_that.id,_that.orderId,_that.serviceName,_that.clientName,_that.clientPhone,_that.clientAddress,_that.clientLat,_that.clientLng,_that.price,_that.distanceKm,_that.offeredAt,_that.expiresAt,_that.status,_that.arrivedAt,_that.orderType,_that.orderKind,_that.serviceCategoryId,_that.description,_that.inspectionFee,_that.commissionRate,_that.addressLabel,_that.buildingNo,_that.floor,_that.addressNotes,_that.photos,_that.scheduledAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int orderId,  String serviceName,  String clientName,  String clientPhone,  String clientAddress,  double clientLat,  double clientLng,  String? price,  String? distanceKm,  DateTime? offeredAt,  DateTime? expiresAt,  String? status,  DateTime? arrivedAt,  String? orderType,  String? orderKind,  int? serviceCategoryId,  String? description,  String? inspectionFee,  String? commissionRate,  String? addressLabel,  String? buildingNo,  String? floor,  String? addressNotes,  List<String> photos,  DateTime? scheduledAt)  $default,) {final _that = this;
switch (_that) {
case _DispatchOffer():
return $default(_that.id,_that.orderId,_that.serviceName,_that.clientName,_that.clientPhone,_that.clientAddress,_that.clientLat,_that.clientLng,_that.price,_that.distanceKm,_that.offeredAt,_that.expiresAt,_that.status,_that.arrivedAt,_that.orderType,_that.orderKind,_that.serviceCategoryId,_that.description,_that.inspectionFee,_that.commissionRate,_that.addressLabel,_that.buildingNo,_that.floor,_that.addressNotes,_that.photos,_that.scheduledAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int orderId,  String serviceName,  String clientName,  String clientPhone,  String clientAddress,  double clientLat,  double clientLng,  String? price,  String? distanceKm,  DateTime? offeredAt,  DateTime? expiresAt,  String? status,  DateTime? arrivedAt,  String? orderType,  String? orderKind,  int? serviceCategoryId,  String? description,  String? inspectionFee,  String? commissionRate,  String? addressLabel,  String? buildingNo,  String? floor,  String? addressNotes,  List<String> photos,  DateTime? scheduledAt)?  $default,) {final _that = this;
switch (_that) {
case _DispatchOffer() when $default != null:
return $default(_that.id,_that.orderId,_that.serviceName,_that.clientName,_that.clientPhone,_that.clientAddress,_that.clientLat,_that.clientLng,_that.price,_that.distanceKm,_that.offeredAt,_that.expiresAt,_that.status,_that.arrivedAt,_that.orderType,_that.orderKind,_that.serviceCategoryId,_that.description,_that.inspectionFee,_that.commissionRate,_that.addressLabel,_that.buildingNo,_that.floor,_that.addressNotes,_that.photos,_that.scheduledAt);case _:
  return null;

}
}

}

/// @nodoc


class _DispatchOffer implements DispatchOffer {
  const _DispatchOffer({required this.id, required this.orderId, required this.serviceName, required this.clientName, required this.clientPhone, required this.clientAddress, required this.clientLat, required this.clientLng, this.price, this.distanceKm, this.offeredAt, this.expiresAt, this.status, this.arrivedAt, this.orderType, this.orderKind, this.serviceCategoryId, this.description, this.inspectionFee, this.commissionRate, this.addressLabel, this.buildingNo, this.floor, this.addressNotes, final  List<String> photos = const [], this.scheduledAt}): _photos = photos;
  

@override final  int id;
@override final  int orderId;
@override final  String serviceName;
@override final  String clientName;
@override final  String clientPhone;
@override final  String clientAddress;
@override final  double clientLat;
@override final  double clientLng;
@override final  String? price;
@override final  String? distanceKm;
@override final  DateTime? offeredAt;
@override final  DateTime? expiresAt;
@override final  String? status;
@override final  DateTime? arrivedAt;
@override final  String? orderType;
// 'urgent', 'scheduled'
@override final  String? orderKind;
// 'normal', 'warranty'
@override final  int? serviceCategoryId;
@override final  String? description;
@override final  String? inspectionFee;
@override final  String? commissionRate;
@override final  String? addressLabel;
@override final  String? buildingNo;
@override final  String? floor;
@override final  String? addressNotes;
 final  List<String> _photos;
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  DateTime? scheduledAt;

/// Create a copy of DispatchOffer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DispatchOfferCopyWith<_DispatchOffer> get copyWith => __$DispatchOfferCopyWithImpl<_DispatchOffer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DispatchOffer&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientPhone, clientPhone) || other.clientPhone == clientPhone)&&(identical(other.clientAddress, clientAddress) || other.clientAddress == clientAddress)&&(identical(other.clientLat, clientLat) || other.clientLat == clientLat)&&(identical(other.clientLng, clientLng) || other.clientLng == clientLng)&&(identical(other.price, price) || other.price == price)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.offeredAt, offeredAt) || other.offeredAt == offeredAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.arrivedAt, arrivedAt) || other.arrivedAt == arrivedAt)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.orderKind, orderKind) || other.orderKind == orderKind)&&(identical(other.serviceCategoryId, serviceCategoryId) || other.serviceCategoryId == serviceCategoryId)&&(identical(other.description, description) || other.description == description)&&(identical(other.inspectionFee, inspectionFee) || other.inspectionFee == inspectionFee)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.buildingNo, buildingNo) || other.buildingNo == buildingNo)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.addressNotes, addressNotes) || other.addressNotes == addressNotes)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,orderId,serviceName,clientName,clientPhone,clientAddress,clientLat,clientLng,price,distanceKm,offeredAt,expiresAt,status,arrivedAt,orderType,orderKind,serviceCategoryId,description,inspectionFee,commissionRate,addressLabel,buildingNo,floor,addressNotes,const DeepCollectionEquality().hash(_photos),scheduledAt]);

@override
String toString() {
  return 'DispatchOffer(id: $id, orderId: $orderId, serviceName: $serviceName, clientName: $clientName, clientPhone: $clientPhone, clientAddress: $clientAddress, clientLat: $clientLat, clientLng: $clientLng, price: $price, distanceKm: $distanceKm, offeredAt: $offeredAt, expiresAt: $expiresAt, status: $status, arrivedAt: $arrivedAt, orderType: $orderType, orderKind: $orderKind, serviceCategoryId: $serviceCategoryId, description: $description, inspectionFee: $inspectionFee, commissionRate: $commissionRate, addressLabel: $addressLabel, buildingNo: $buildingNo, floor: $floor, addressNotes: $addressNotes, photos: $photos, scheduledAt: $scheduledAt)';
}


}

/// @nodoc
abstract mixin class _$DispatchOfferCopyWith<$Res> implements $DispatchOfferCopyWith<$Res> {
  factory _$DispatchOfferCopyWith(_DispatchOffer value, $Res Function(_DispatchOffer) _then) = __$DispatchOfferCopyWithImpl;
@override @useResult
$Res call({
 int id, int orderId, String serviceName, String clientName, String clientPhone, String clientAddress, double clientLat, double clientLng, String? price, String? distanceKm, DateTime? offeredAt, DateTime? expiresAt, String? status, DateTime? arrivedAt, String? orderType, String? orderKind, int? serviceCategoryId, String? description, String? inspectionFee, String? commissionRate, String? addressLabel, String? buildingNo, String? floor, String? addressNotes, List<String> photos, DateTime? scheduledAt
});




}
/// @nodoc
class __$DispatchOfferCopyWithImpl<$Res>
    implements _$DispatchOfferCopyWith<$Res> {
  __$DispatchOfferCopyWithImpl(this._self, this._then);

  final _DispatchOffer _self;
  final $Res Function(_DispatchOffer) _then;

/// Create a copy of DispatchOffer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? serviceName = null,Object? clientName = null,Object? clientPhone = null,Object? clientAddress = null,Object? clientLat = null,Object? clientLng = null,Object? price = freezed,Object? distanceKm = freezed,Object? offeredAt = freezed,Object? expiresAt = freezed,Object? status = freezed,Object? arrivedAt = freezed,Object? orderType = freezed,Object? orderKind = freezed,Object? serviceCategoryId = freezed,Object? description = freezed,Object? inspectionFee = freezed,Object? commissionRate = freezed,Object? addressLabel = freezed,Object? buildingNo = freezed,Object? floor = freezed,Object? addressNotes = freezed,Object? photos = null,Object? scheduledAt = freezed,}) {
  return _then(_DispatchOffer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientPhone: null == clientPhone ? _self.clientPhone : clientPhone // ignore: cast_nullable_to_non_nullable
as String,clientAddress: null == clientAddress ? _self.clientAddress : clientAddress // ignore: cast_nullable_to_non_nullable
as String,clientLat: null == clientLat ? _self.clientLat : clientLat // ignore: cast_nullable_to_non_nullable
as double,clientLng: null == clientLng ? _self.clientLng : clientLng // ignore: cast_nullable_to_non_nullable
as double,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as String?,offeredAt: freezed == offeredAt ? _self.offeredAt : offeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,arrivedAt: freezed == arrivedAt ? _self.arrivedAt : arrivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,orderType: freezed == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as String?,orderKind: freezed == orderKind ? _self.orderKind : orderKind // ignore: cast_nullable_to_non_nullable
as String?,serviceCategoryId: freezed == serviceCategoryId ? _self.serviceCategoryId : serviceCategoryId // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,inspectionFee: freezed == inspectionFee ? _self.inspectionFee : inspectionFee // ignore: cast_nullable_to_non_nullable
as String?,commissionRate: freezed == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as String?,addressLabel: freezed == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String?,buildingNo: freezed == buildingNo ? _self.buildingNo : buildingNo // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,addressNotes: freezed == addressNotes ? _self.addressNotes : addressNotes // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
