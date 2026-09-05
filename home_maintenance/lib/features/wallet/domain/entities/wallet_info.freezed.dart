// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletInfo {

 String get availableBalance; String get heldBalance; String get currency;
/// Create a copy of WalletInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletInfoCopyWith<WalletInfo> get copyWith => _$WalletInfoCopyWithImpl<WalletInfo>(this as WalletInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletInfo&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.heldBalance, heldBalance) || other.heldBalance == heldBalance)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,availableBalance,heldBalance,currency);

@override
String toString() {
  return 'WalletInfo(availableBalance: $availableBalance, heldBalance: $heldBalance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $WalletInfoCopyWith<$Res>  {
  factory $WalletInfoCopyWith(WalletInfo value, $Res Function(WalletInfo) _then) = _$WalletInfoCopyWithImpl;
@useResult
$Res call({
 String availableBalance, String heldBalance, String currency
});




}
/// @nodoc
class _$WalletInfoCopyWithImpl<$Res>
    implements $WalletInfoCopyWith<$Res> {
  _$WalletInfoCopyWithImpl(this._self, this._then);

  final WalletInfo _self;
  final $Res Function(WalletInfo) _then;

/// Create a copy of WalletInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableBalance = null,Object? heldBalance = null,Object? currency = null,}) {
  return _then(_self.copyWith(
availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as String,heldBalance: null == heldBalance ? _self.heldBalance : heldBalance // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletInfo].
extension WalletInfoPatterns on WalletInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletInfo value)  $default,){
final _that = this;
switch (_that) {
case _WalletInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletInfo value)?  $default,){
final _that = this;
switch (_that) {
case _WalletInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String availableBalance,  String heldBalance,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletInfo() when $default != null:
return $default(_that.availableBalance,_that.heldBalance,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String availableBalance,  String heldBalance,  String currency)  $default,) {final _that = this;
switch (_that) {
case _WalletInfo():
return $default(_that.availableBalance,_that.heldBalance,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String availableBalance,  String heldBalance,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _WalletInfo() when $default != null:
return $default(_that.availableBalance,_that.heldBalance,_that.currency);case _:
  return null;

}
}

}

/// @nodoc


class _WalletInfo implements WalletInfo {
  const _WalletInfo({this.availableBalance = '0.00', this.heldBalance = '0.00', this.currency = 'SYP'});
  

@override@JsonKey() final  String availableBalance;
@override@JsonKey() final  String heldBalance;
@override@JsonKey() final  String currency;

/// Create a copy of WalletInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletInfoCopyWith<_WalletInfo> get copyWith => __$WalletInfoCopyWithImpl<_WalletInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletInfo&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.heldBalance, heldBalance) || other.heldBalance == heldBalance)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,availableBalance,heldBalance,currency);

@override
String toString() {
  return 'WalletInfo(availableBalance: $availableBalance, heldBalance: $heldBalance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$WalletInfoCopyWith<$Res> implements $WalletInfoCopyWith<$Res> {
  factory _$WalletInfoCopyWith(_WalletInfo value, $Res Function(_WalletInfo) _then) = __$WalletInfoCopyWithImpl;
@override @useResult
$Res call({
 String availableBalance, String heldBalance, String currency
});




}
/// @nodoc
class __$WalletInfoCopyWithImpl<$Res>
    implements _$WalletInfoCopyWith<$Res> {
  __$WalletInfoCopyWithImpl(this._self, this._then);

  final _WalletInfo _self;
  final $Res Function(_WalletInfo) _then;

/// Create a copy of WalletInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableBalance = null,Object? heldBalance = null,Object? currency = null,}) {
  return _then(_WalletInfo(
availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as String,heldBalance: null == heldBalance ? _self.heldBalance : heldBalance // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
