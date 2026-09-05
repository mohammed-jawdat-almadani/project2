// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'technician_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TechnicianProfileModel {

 int get id; String get status;@JsonKey(name: 'is_available') bool get isAvailable;@JsonKey(name: 'rating_avg') String get ratingAvg;@JsonKey(name: 'service_category_ids') List<int> get serviceCategoryIds;@JsonKey(name: 'current_lat') dynamic get currentLat;@JsonKey(name: 'current_lng') dynamic get currentLng; Map<String, dynamic>? get user; String? get name; String? get phone;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'profile_photo_url') String? get profilePhotoUrl;@JsonKey(name: 'profile_image_url') String? get profileImageUrl;@JsonKey(name: 'completed_orders_count') int get completedOrdersCount;
/// Create a copy of TechnicianProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TechnicianProfileModelCopyWith<TechnicianProfileModel> get copyWith => _$TechnicianProfileModelCopyWithImpl<TechnicianProfileModel>(this as TechnicianProfileModel, _$identity);

  /// Serializes this TechnicianProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TechnicianProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.ratingAvg, ratingAvg) || other.ratingAvg == ratingAvg)&&const DeepCollectionEquality().equals(other.serviceCategoryIds, serviceCategoryIds)&&const DeepCollectionEquality().equals(other.currentLat, currentLat)&&const DeepCollectionEquality().equals(other.currentLng, currentLng)&&const DeepCollectionEquality().equals(other.user, user)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.profilePhotoUrl, profilePhotoUrl) || other.profilePhotoUrl == profilePhotoUrl)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.completedOrdersCount, completedOrdersCount) || other.completedOrdersCount == completedOrdersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,isAvailable,ratingAvg,const DeepCollectionEquality().hash(serviceCategoryIds),const DeepCollectionEquality().hash(currentLat),const DeepCollectionEquality().hash(currentLng),const DeepCollectionEquality().hash(user),name,phone,createdAt,profilePhotoUrl,profileImageUrl,completedOrdersCount);

@override
String toString() {
  return 'TechnicianProfileModel(id: $id, status: $status, isAvailable: $isAvailable, ratingAvg: $ratingAvg, serviceCategoryIds: $serviceCategoryIds, currentLat: $currentLat, currentLng: $currentLng, user: $user, name: $name, phone: $phone, createdAt: $createdAt, profilePhotoUrl: $profilePhotoUrl, profileImageUrl: $profileImageUrl, completedOrdersCount: $completedOrdersCount)';
}


}

/// @nodoc
abstract mixin class $TechnicianProfileModelCopyWith<$Res>  {
  factory $TechnicianProfileModelCopyWith(TechnicianProfileModel value, $Res Function(TechnicianProfileModel) _then) = _$TechnicianProfileModelCopyWithImpl;
@useResult
$Res call({
 int id, String status,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'rating_avg') String ratingAvg,@JsonKey(name: 'service_category_ids') List<int> serviceCategoryIds,@JsonKey(name: 'current_lat') dynamic currentLat,@JsonKey(name: 'current_lng') dynamic currentLng, Map<String, dynamic>? user, String? name, String? phone,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,@JsonKey(name: 'profile_image_url') String? profileImageUrl,@JsonKey(name: 'completed_orders_count') int completedOrdersCount
});




}
/// @nodoc
class _$TechnicianProfileModelCopyWithImpl<$Res>
    implements $TechnicianProfileModelCopyWith<$Res> {
  _$TechnicianProfileModelCopyWithImpl(this._self, this._then);

  final TechnicianProfileModel _self;
  final $Res Function(TechnicianProfileModel) _then;

/// Create a copy of TechnicianProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? isAvailable = null,Object? ratingAvg = null,Object? serviceCategoryIds = null,Object? currentLat = freezed,Object? currentLng = freezed,Object? user = freezed,Object? name = freezed,Object? phone = freezed,Object? createdAt = freezed,Object? profilePhotoUrl = freezed,Object? profileImageUrl = freezed,Object? completedOrdersCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,ratingAvg: null == ratingAvg ? _self.ratingAvg : ratingAvg // ignore: cast_nullable_to_non_nullable
as String,serviceCategoryIds: null == serviceCategoryIds ? _self.serviceCategoryIds : serviceCategoryIds // ignore: cast_nullable_to_non_nullable
as List<int>,currentLat: freezed == currentLat ? _self.currentLat : currentLat // ignore: cast_nullable_to_non_nullable
as dynamic,currentLng: freezed == currentLng ? _self.currentLng : currentLng // ignore: cast_nullable_to_non_nullable
as dynamic,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,profilePhotoUrl: freezed == profilePhotoUrl ? _self.profilePhotoUrl : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,completedOrdersCount: null == completedOrdersCount ? _self.completedOrdersCount : completedOrdersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TechnicianProfileModel].
extension TechnicianProfileModelPatterns on TechnicianProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TechnicianProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TechnicianProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TechnicianProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _TechnicianProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TechnicianProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _TechnicianProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'rating_avg')  String ratingAvg, @JsonKey(name: 'service_category_ids')  List<int> serviceCategoryIds, @JsonKey(name: 'current_lat')  dynamic currentLat, @JsonKey(name: 'current_lng')  dynamic currentLng,  Map<String, dynamic>? user,  String? name,  String? phone, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl, @JsonKey(name: 'profile_image_url')  String? profileImageUrl, @JsonKey(name: 'completed_orders_count')  int completedOrdersCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TechnicianProfileModel() when $default != null:
return $default(_that.id,_that.status,_that.isAvailable,_that.ratingAvg,_that.serviceCategoryIds,_that.currentLat,_that.currentLng,_that.user,_that.name,_that.phone,_that.createdAt,_that.profilePhotoUrl,_that.profileImageUrl,_that.completedOrdersCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'rating_avg')  String ratingAvg, @JsonKey(name: 'service_category_ids')  List<int> serviceCategoryIds, @JsonKey(name: 'current_lat')  dynamic currentLat, @JsonKey(name: 'current_lng')  dynamic currentLng,  Map<String, dynamic>? user,  String? name,  String? phone, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl, @JsonKey(name: 'profile_image_url')  String? profileImageUrl, @JsonKey(name: 'completed_orders_count')  int completedOrdersCount)  $default,) {final _that = this;
switch (_that) {
case _TechnicianProfileModel():
return $default(_that.id,_that.status,_that.isAvailable,_that.ratingAvg,_that.serviceCategoryIds,_that.currentLat,_that.currentLng,_that.user,_that.name,_that.phone,_that.createdAt,_that.profilePhotoUrl,_that.profileImageUrl,_that.completedOrdersCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'rating_avg')  String ratingAvg, @JsonKey(name: 'service_category_ids')  List<int> serviceCategoryIds, @JsonKey(name: 'current_lat')  dynamic currentLat, @JsonKey(name: 'current_lng')  dynamic currentLng,  Map<String, dynamic>? user,  String? name,  String? phone, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl, @JsonKey(name: 'profile_image_url')  String? profileImageUrl, @JsonKey(name: 'completed_orders_count')  int completedOrdersCount)?  $default,) {final _that = this;
switch (_that) {
case _TechnicianProfileModel() when $default != null:
return $default(_that.id,_that.status,_that.isAvailable,_that.ratingAvg,_that.serviceCategoryIds,_that.currentLat,_that.currentLng,_that.user,_that.name,_that.phone,_that.createdAt,_that.profilePhotoUrl,_that.profileImageUrl,_that.completedOrdersCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TechnicianProfileModel extends TechnicianProfileModel {
  const _TechnicianProfileModel({required this.id, this.status = 'pending', @JsonKey(name: 'is_available') this.isAvailable = false, @JsonKey(name: 'rating_avg') this.ratingAvg = '0.00', @JsonKey(name: 'service_category_ids') final  List<int> serviceCategoryIds = const [], @JsonKey(name: 'current_lat') this.currentLat, @JsonKey(name: 'current_lng') this.currentLng, final  Map<String, dynamic>? user, this.name, this.phone, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'profile_photo_url') this.profilePhotoUrl, @JsonKey(name: 'profile_image_url') this.profileImageUrl, @JsonKey(name: 'completed_orders_count') this.completedOrdersCount = 0}): _serviceCategoryIds = serviceCategoryIds,_user = user,super._();
  factory _TechnicianProfileModel.fromJson(Map<String, dynamic> json) => _$TechnicianProfileModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override@JsonKey(name: 'rating_avg') final  String ratingAvg;
 final  List<int> _serviceCategoryIds;
@override@JsonKey(name: 'service_category_ids') List<int> get serviceCategoryIds {
  if (_serviceCategoryIds is EqualUnmodifiableListView) return _serviceCategoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serviceCategoryIds);
}

@override@JsonKey(name: 'current_lat') final  dynamic currentLat;
@override@JsonKey(name: 'current_lng') final  dynamic currentLng;
 final  Map<String, dynamic>? _user;
@override Map<String, dynamic>? get user {
  final value = _user;
  if (value == null) return null;
  if (_user is EqualUnmodifiableMapView) return _user;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? name;
@override final  String? phone;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'profile_photo_url') final  String? profilePhotoUrl;
@override@JsonKey(name: 'profile_image_url') final  String? profileImageUrl;
@override@JsonKey(name: 'completed_orders_count') final  int completedOrdersCount;

/// Create a copy of TechnicianProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TechnicianProfileModelCopyWith<_TechnicianProfileModel> get copyWith => __$TechnicianProfileModelCopyWithImpl<_TechnicianProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TechnicianProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TechnicianProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.ratingAvg, ratingAvg) || other.ratingAvg == ratingAvg)&&const DeepCollectionEquality().equals(other._serviceCategoryIds, _serviceCategoryIds)&&const DeepCollectionEquality().equals(other.currentLat, currentLat)&&const DeepCollectionEquality().equals(other.currentLng, currentLng)&&const DeepCollectionEquality().equals(other._user, _user)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.profilePhotoUrl, profilePhotoUrl) || other.profilePhotoUrl == profilePhotoUrl)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.completedOrdersCount, completedOrdersCount) || other.completedOrdersCount == completedOrdersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,isAvailable,ratingAvg,const DeepCollectionEquality().hash(_serviceCategoryIds),const DeepCollectionEquality().hash(currentLat),const DeepCollectionEquality().hash(currentLng),const DeepCollectionEquality().hash(_user),name,phone,createdAt,profilePhotoUrl,profileImageUrl,completedOrdersCount);

@override
String toString() {
  return 'TechnicianProfileModel(id: $id, status: $status, isAvailable: $isAvailable, ratingAvg: $ratingAvg, serviceCategoryIds: $serviceCategoryIds, currentLat: $currentLat, currentLng: $currentLng, user: $user, name: $name, phone: $phone, createdAt: $createdAt, profilePhotoUrl: $profilePhotoUrl, profileImageUrl: $profileImageUrl, completedOrdersCount: $completedOrdersCount)';
}


}

/// @nodoc
abstract mixin class _$TechnicianProfileModelCopyWith<$Res> implements $TechnicianProfileModelCopyWith<$Res> {
  factory _$TechnicianProfileModelCopyWith(_TechnicianProfileModel value, $Res Function(_TechnicianProfileModel) _then) = __$TechnicianProfileModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'rating_avg') String ratingAvg,@JsonKey(name: 'service_category_ids') List<int> serviceCategoryIds,@JsonKey(name: 'current_lat') dynamic currentLat,@JsonKey(name: 'current_lng') dynamic currentLng, Map<String, dynamic>? user, String? name, String? phone,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,@JsonKey(name: 'profile_image_url') String? profileImageUrl,@JsonKey(name: 'completed_orders_count') int completedOrdersCount
});




}
/// @nodoc
class __$TechnicianProfileModelCopyWithImpl<$Res>
    implements _$TechnicianProfileModelCopyWith<$Res> {
  __$TechnicianProfileModelCopyWithImpl(this._self, this._then);

  final _TechnicianProfileModel _self;
  final $Res Function(_TechnicianProfileModel) _then;

/// Create a copy of TechnicianProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? isAvailable = null,Object? ratingAvg = null,Object? serviceCategoryIds = null,Object? currentLat = freezed,Object? currentLng = freezed,Object? user = freezed,Object? name = freezed,Object? phone = freezed,Object? createdAt = freezed,Object? profilePhotoUrl = freezed,Object? profileImageUrl = freezed,Object? completedOrdersCount = null,}) {
  return _then(_TechnicianProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,ratingAvg: null == ratingAvg ? _self.ratingAvg : ratingAvg // ignore: cast_nullable_to_non_nullable
as String,serviceCategoryIds: null == serviceCategoryIds ? _self._serviceCategoryIds : serviceCategoryIds // ignore: cast_nullable_to_non_nullable
as List<int>,currentLat: freezed == currentLat ? _self.currentLat : currentLat // ignore: cast_nullable_to_non_nullable
as dynamic,currentLng: freezed == currentLng ? _self.currentLng : currentLng // ignore: cast_nullable_to_non_nullable
as dynamic,user: freezed == user ? _self._user : user // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,profilePhotoUrl: freezed == profilePhotoUrl ? _self.profilePhotoUrl : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,completedOrdersCount: null == completedOrdersCount ? _self.completedOrdersCount : completedOrdersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
