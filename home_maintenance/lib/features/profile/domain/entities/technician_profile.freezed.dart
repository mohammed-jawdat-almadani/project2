// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'technician_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TechnicianProfile {

 int get id; String get name; String get phone; String get status;// 'active', 'pending', 'probation'
 bool get isAvailable; String get ratingAvg; List<int> get serviceCategoryIds; List<String> get serviceCategoryNames; int get completedOrdersCount; DateTime? get memberSince;
/// Create a copy of TechnicianProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TechnicianProfileCopyWith<TechnicianProfile> get copyWith => _$TechnicianProfileCopyWithImpl<TechnicianProfile>(this as TechnicianProfile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TechnicianProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.ratingAvg, ratingAvg) || other.ratingAvg == ratingAvg)&&const DeepCollectionEquality().equals(other.serviceCategoryIds, serviceCategoryIds)&&const DeepCollectionEquality().equals(other.serviceCategoryNames, serviceCategoryNames)&&(identical(other.completedOrdersCount, completedOrdersCount) || other.completedOrdersCount == completedOrdersCount)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,phone,status,isAvailable,ratingAvg,const DeepCollectionEquality().hash(serviceCategoryIds),const DeepCollectionEquality().hash(serviceCategoryNames),completedOrdersCount,memberSince);

@override
String toString() {
  return 'TechnicianProfile(id: $id, name: $name, phone: $phone, status: $status, isAvailable: $isAvailable, ratingAvg: $ratingAvg, serviceCategoryIds: $serviceCategoryIds, serviceCategoryNames: $serviceCategoryNames, completedOrdersCount: $completedOrdersCount, memberSince: $memberSince)';
}


}

/// @nodoc
abstract mixin class $TechnicianProfileCopyWith<$Res>  {
  factory $TechnicianProfileCopyWith(TechnicianProfile value, $Res Function(TechnicianProfile) _then) = _$TechnicianProfileCopyWithImpl;
@useResult
$Res call({
 int id, String name, String phone, String status, bool isAvailable, String ratingAvg, List<int> serviceCategoryIds, List<String> serviceCategoryNames, int completedOrdersCount, DateTime? memberSince
});




}
/// @nodoc
class _$TechnicianProfileCopyWithImpl<$Res>
    implements $TechnicianProfileCopyWith<$Res> {
  _$TechnicianProfileCopyWithImpl(this._self, this._then);

  final TechnicianProfile _self;
  final $Res Function(TechnicianProfile) _then;

/// Create a copy of TechnicianProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? status = null,Object? isAvailable = null,Object? ratingAvg = null,Object? serviceCategoryIds = null,Object? serviceCategoryNames = null,Object? completedOrdersCount = null,Object? memberSince = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,ratingAvg: null == ratingAvg ? _self.ratingAvg : ratingAvg // ignore: cast_nullable_to_non_nullable
as String,serviceCategoryIds: null == serviceCategoryIds ? _self.serviceCategoryIds : serviceCategoryIds // ignore: cast_nullable_to_non_nullable
as List<int>,serviceCategoryNames: null == serviceCategoryNames ? _self.serviceCategoryNames : serviceCategoryNames // ignore: cast_nullable_to_non_nullable
as List<String>,completedOrdersCount: null == completedOrdersCount ? _self.completedOrdersCount : completedOrdersCount // ignore: cast_nullable_to_non_nullable
as int,memberSince: freezed == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TechnicianProfile].
extension TechnicianProfilePatterns on TechnicianProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TechnicianProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TechnicianProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TechnicianProfile value)  $default,){
final _that = this;
switch (_that) {
case _TechnicianProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TechnicianProfile value)?  $default,){
final _that = this;
switch (_that) {
case _TechnicianProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String phone,  String status,  bool isAvailable,  String ratingAvg,  List<int> serviceCategoryIds,  List<String> serviceCategoryNames,  int completedOrdersCount,  DateTime? memberSince)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TechnicianProfile() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.status,_that.isAvailable,_that.ratingAvg,_that.serviceCategoryIds,_that.serviceCategoryNames,_that.completedOrdersCount,_that.memberSince);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String phone,  String status,  bool isAvailable,  String ratingAvg,  List<int> serviceCategoryIds,  List<String> serviceCategoryNames,  int completedOrdersCount,  DateTime? memberSince)  $default,) {final _that = this;
switch (_that) {
case _TechnicianProfile():
return $default(_that.id,_that.name,_that.phone,_that.status,_that.isAvailable,_that.ratingAvg,_that.serviceCategoryIds,_that.serviceCategoryNames,_that.completedOrdersCount,_that.memberSince);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String phone,  String status,  bool isAvailable,  String ratingAvg,  List<int> serviceCategoryIds,  List<String> serviceCategoryNames,  int completedOrdersCount,  DateTime? memberSince)?  $default,) {final _that = this;
switch (_that) {
case _TechnicianProfile() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.status,_that.isAvailable,_that.ratingAvg,_that.serviceCategoryIds,_that.serviceCategoryNames,_that.completedOrdersCount,_that.memberSince);case _:
  return null;

}
}

}

/// @nodoc


class _TechnicianProfile implements TechnicianProfile {
  const _TechnicianProfile({required this.id, required this.name, required this.phone, required this.status, required this.isAvailable, this.ratingAvg = '0.00', final  List<int> serviceCategoryIds = const [], final  List<String> serviceCategoryNames = const [], this.completedOrdersCount = 0, this.memberSince}): _serviceCategoryIds = serviceCategoryIds,_serviceCategoryNames = serviceCategoryNames;
  

@override final  int id;
@override final  String name;
@override final  String phone;
@override final  String status;
// 'active', 'pending', 'probation'
@override final  bool isAvailable;
@override@JsonKey() final  String ratingAvg;
 final  List<int> _serviceCategoryIds;
@override@JsonKey() List<int> get serviceCategoryIds {
  if (_serviceCategoryIds is EqualUnmodifiableListView) return _serviceCategoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serviceCategoryIds);
}

 final  List<String> _serviceCategoryNames;
@override@JsonKey() List<String> get serviceCategoryNames {
  if (_serviceCategoryNames is EqualUnmodifiableListView) return _serviceCategoryNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serviceCategoryNames);
}

@override@JsonKey() final  int completedOrdersCount;
@override final  DateTime? memberSince;

/// Create a copy of TechnicianProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TechnicianProfileCopyWith<_TechnicianProfile> get copyWith => __$TechnicianProfileCopyWithImpl<_TechnicianProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TechnicianProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.ratingAvg, ratingAvg) || other.ratingAvg == ratingAvg)&&const DeepCollectionEquality().equals(other._serviceCategoryIds, _serviceCategoryIds)&&const DeepCollectionEquality().equals(other._serviceCategoryNames, _serviceCategoryNames)&&(identical(other.completedOrdersCount, completedOrdersCount) || other.completedOrdersCount == completedOrdersCount)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,phone,status,isAvailable,ratingAvg,const DeepCollectionEquality().hash(_serviceCategoryIds),const DeepCollectionEquality().hash(_serviceCategoryNames),completedOrdersCount,memberSince);

@override
String toString() {
  return 'TechnicianProfile(id: $id, name: $name, phone: $phone, status: $status, isAvailable: $isAvailable, ratingAvg: $ratingAvg, serviceCategoryIds: $serviceCategoryIds, serviceCategoryNames: $serviceCategoryNames, completedOrdersCount: $completedOrdersCount, memberSince: $memberSince)';
}


}

/// @nodoc
abstract mixin class _$TechnicianProfileCopyWith<$Res> implements $TechnicianProfileCopyWith<$Res> {
  factory _$TechnicianProfileCopyWith(_TechnicianProfile value, $Res Function(_TechnicianProfile) _then) = __$TechnicianProfileCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String phone, String status, bool isAvailable, String ratingAvg, List<int> serviceCategoryIds, List<String> serviceCategoryNames, int completedOrdersCount, DateTime? memberSince
});




}
/// @nodoc
class __$TechnicianProfileCopyWithImpl<$Res>
    implements _$TechnicianProfileCopyWith<$Res> {
  __$TechnicianProfileCopyWithImpl(this._self, this._then);

  final _TechnicianProfile _self;
  final $Res Function(_TechnicianProfile) _then;

/// Create a copy of TechnicianProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? status = null,Object? isAvailable = null,Object? ratingAvg = null,Object? serviceCategoryIds = null,Object? serviceCategoryNames = null,Object? completedOrdersCount = null,Object? memberSince = freezed,}) {
  return _then(_TechnicianProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,ratingAvg: null == ratingAvg ? _self.ratingAvg : ratingAvg // ignore: cast_nullable_to_non_nullable
as String,serviceCategoryIds: null == serviceCategoryIds ? _self._serviceCategoryIds : serviceCategoryIds // ignore: cast_nullable_to_non_nullable
as List<int>,serviceCategoryNames: null == serviceCategoryNames ? _self._serviceCategoryNames : serviceCategoryNames // ignore: cast_nullable_to_non_nullable
as List<String>,completedOrdersCount: null == completedOrdersCount ? _self.completedOrdersCount : completedOrdersCount // ignore: cast_nullable_to_non_nullable
as int,memberSince: freezed == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
