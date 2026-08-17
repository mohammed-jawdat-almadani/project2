// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activation_center.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivationCenter {

 int get id; String get name; String get address; String get phone;
/// Create a copy of ActivationCenter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivationCenterCopyWith<ActivationCenter> get copyWith => _$ActivationCenterCopyWithImpl<ActivationCenter>(this as ActivationCenter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivationCenter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address,phone);

@override
String toString() {
  return 'ActivationCenter(id: $id, name: $name, address: $address, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $ActivationCenterCopyWith<$Res>  {
  factory $ActivationCenterCopyWith(ActivationCenter value, $Res Function(ActivationCenter) _then) = _$ActivationCenterCopyWithImpl;
@useResult
$Res call({
 int id, String name, String address, String phone
});




}
/// @nodoc
class _$ActivationCenterCopyWithImpl<$Res>
    implements $ActivationCenterCopyWith<$Res> {
  _$ActivationCenterCopyWithImpl(this._self, this._then);

  final ActivationCenter _self;
  final $Res Function(ActivationCenter) _then;

/// Create a copy of ActivationCenter
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


/// Adds pattern-matching-related methods to [ActivationCenter].
extension ActivationCenterPatterns on ActivationCenter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivationCenter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivationCenter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivationCenter value)  $default,){
final _that = this;
switch (_that) {
case _ActivationCenter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivationCenter value)?  $default,){
final _that = this;
switch (_that) {
case _ActivationCenter() when $default != null:
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
case _ActivationCenter() when $default != null:
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
case _ActivationCenter():
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
case _ActivationCenter() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.phone);case _:
  return null;

}
}

}

/// @nodoc


class _ActivationCenter implements ActivationCenter {
  const _ActivationCenter({required this.id, required this.name, required this.address, required this.phone});
  

@override final  int id;
@override final  String name;
@override final  String address;
@override final  String phone;

/// Create a copy of ActivationCenter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivationCenterCopyWith<_ActivationCenter> get copyWith => __$ActivationCenterCopyWithImpl<_ActivationCenter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivationCenter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address,phone);

@override
String toString() {
  return 'ActivationCenter(id: $id, name: $name, address: $address, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$ActivationCenterCopyWith<$Res> implements $ActivationCenterCopyWith<$Res> {
  factory _$ActivationCenterCopyWith(_ActivationCenter value, $Res Function(_ActivationCenter) _then) = __$ActivationCenterCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String address, String phone
});




}
/// @nodoc
class __$ActivationCenterCopyWithImpl<$Res>
    implements _$ActivationCenterCopyWith<$Res> {
  __$ActivationCenterCopyWithImpl(this._self, this._then);

  final _ActivationCenter _self;
  final $Res Function(_ActivationCenter) _then;

/// Create a copy of ActivationCenter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? phone = null,}) {
  return _then(_ActivationCenter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
