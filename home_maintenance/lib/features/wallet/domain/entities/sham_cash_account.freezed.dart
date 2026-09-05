// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sham_cash_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShamCashAccount {

 String get name; String get number; bool get isLinked;
/// Create a copy of ShamCashAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShamCashAccountCopyWith<ShamCashAccount> get copyWith => _$ShamCashAccountCopyWithImpl<ShamCashAccount>(this as ShamCashAccount, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShamCashAccount&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.isLinked, isLinked) || other.isLinked == isLinked));
}


@override
int get hashCode => Object.hash(runtimeType,name,number,isLinked);

@override
String toString() {
  return 'ShamCashAccount(name: $name, number: $number, isLinked: $isLinked)';
}


}

/// @nodoc
abstract mixin class $ShamCashAccountCopyWith<$Res>  {
  factory $ShamCashAccountCopyWith(ShamCashAccount value, $Res Function(ShamCashAccount) _then) = _$ShamCashAccountCopyWithImpl;
@useResult
$Res call({
 String name, String number, bool isLinked
});




}
/// @nodoc
class _$ShamCashAccountCopyWithImpl<$Res>
    implements $ShamCashAccountCopyWith<$Res> {
  _$ShamCashAccountCopyWithImpl(this._self, this._then);

  final ShamCashAccount _self;
  final $Res Function(ShamCashAccount) _then;

/// Create a copy of ShamCashAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? number = null,Object? isLinked = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,isLinked: null == isLinked ? _self.isLinked : isLinked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShamCashAccount].
extension ShamCashAccountPatterns on ShamCashAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShamCashAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShamCashAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShamCashAccount value)  $default,){
final _that = this;
switch (_that) {
case _ShamCashAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShamCashAccount value)?  $default,){
final _that = this;
switch (_that) {
case _ShamCashAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String number,  bool isLinked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShamCashAccount() when $default != null:
return $default(_that.name,_that.number,_that.isLinked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String number,  bool isLinked)  $default,) {final _that = this;
switch (_that) {
case _ShamCashAccount():
return $default(_that.name,_that.number,_that.isLinked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String number,  bool isLinked)?  $default,) {final _that = this;
switch (_that) {
case _ShamCashAccount() when $default != null:
return $default(_that.name,_that.number,_that.isLinked);case _:
  return null;

}
}

}

/// @nodoc


class _ShamCashAccount implements ShamCashAccount {
  const _ShamCashAccount({required this.name, required this.number, this.isLinked = true});
  

@override final  String name;
@override final  String number;
@override@JsonKey() final  bool isLinked;

/// Create a copy of ShamCashAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShamCashAccountCopyWith<_ShamCashAccount> get copyWith => __$ShamCashAccountCopyWithImpl<_ShamCashAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShamCashAccount&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.isLinked, isLinked) || other.isLinked == isLinked));
}


@override
int get hashCode => Object.hash(runtimeType,name,number,isLinked);

@override
String toString() {
  return 'ShamCashAccount(name: $name, number: $number, isLinked: $isLinked)';
}


}

/// @nodoc
abstract mixin class _$ShamCashAccountCopyWith<$Res> implements $ShamCashAccountCopyWith<$Res> {
  factory _$ShamCashAccountCopyWith(_ShamCashAccount value, $Res Function(_ShamCashAccount) _then) = __$ShamCashAccountCopyWithImpl;
@override @useResult
$Res call({
 String name, String number, bool isLinked
});




}
/// @nodoc
class __$ShamCashAccountCopyWithImpl<$Res>
    implements _$ShamCashAccountCopyWith<$Res> {
  __$ShamCashAccountCopyWithImpl(this._self, this._then);

  final _ShamCashAccount _self;
  final $Res Function(_ShamCashAccount) _then;

/// Create a copy of ShamCashAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? number = null,Object? isLinked = null,}) {
  return _then(_ShamCashAccount(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,isLinked: null == isLinked ? _self.isLinked : isLinked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
