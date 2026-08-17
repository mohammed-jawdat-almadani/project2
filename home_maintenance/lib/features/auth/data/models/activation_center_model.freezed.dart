// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activation_center_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivationCenterModel {

 int get id; String get name; String get address; String get phone;
/// Create a copy of ActivationCenterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivationCenterModelCopyWith<ActivationCenterModel> get copyWith => _$ActivationCenterModelCopyWithImpl<ActivationCenterModel>(this as ActivationCenterModel, _$identity);

  /// Serializes this ActivationCenterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivationCenterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,phone);

@override
String toString() {
  return 'ActivationCenterModel(id: $id, name: $name, address: $address, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $ActivationCenterModelCopyWith<$Res>  {
  factory $ActivationCenterModelCopyWith(ActivationCenterModel value, $Res Function(ActivationCenterModel) _then) = _$ActivationCenterModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String address, String phone
});




}
/// @nodoc
class _$ActivationCenterModelCopyWithImpl<$Res>
    implements $ActivationCenterModelCopyWith<$Res> {
  _$ActivationCenterModelCopyWithImpl(this._self, this._then);

  final ActivationCenterModel _self;
  final $Res Function(ActivationCenterModel) _then;

/// Create a copy of ActivationCenterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? phone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivationCenterModel].
extension ActivationCenterModelPatterns on ActivationCenterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivationCenterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivationCenterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivationCenterModel value)  $default,){
final _that = this;
switch (_that) {
case _ActivationCenterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivationCenterModel value)?  $default,){
final _that = this;
switch (_that) {
case _ActivationCenterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String address,  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivationCenterModel() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String address,  String phone)  $default,) {final _that = this;
switch (_that) {
case _ActivationCenterModel():
return $default(_that.id,_that.name,_that.address,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String address,  String phone)?  $default,) {final _that = this;
switch (_that) {
case _ActivationCenterModel() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivationCenterModel implements ActivationCenterModel {
  const _ActivationCenterModel({required this.id, required this.name, required this.address, required this.phone});
  factory _ActivationCenterModel.fromJson(Map<String, dynamic> json) => _$ActivationCenterModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String address;
@override final  String phone;

/// Create a copy of ActivationCenterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivationCenterModelCopyWith<_ActivationCenterModel> get copyWith => __$ActivationCenterModelCopyWithImpl<_ActivationCenterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivationCenterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivationCenterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,phone);

@override
String toString() {
  return 'ActivationCenterModel(id: $id, name: $name, address: $address, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$ActivationCenterModelCopyWith<$Res> implements $ActivationCenterModelCopyWith<$Res> {
  factory _$ActivationCenterModelCopyWith(_ActivationCenterModel value, $Res Function(_ActivationCenterModel) _then) = __$ActivationCenterModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String address, String phone
});




}
/// @nodoc
class __$ActivationCenterModelCopyWithImpl<$Res>
    implements _$ActivationCenterModelCopyWith<$Res> {
  __$ActivationCenterModelCopyWithImpl(this._self, this._then);

  final _ActivationCenterModel _self;
  final $Res Function(_ActivationCenterModel) _then;

/// Create a copy of ActivationCenterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? phone = null,}) {
  return _then(_ActivationCenterModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
