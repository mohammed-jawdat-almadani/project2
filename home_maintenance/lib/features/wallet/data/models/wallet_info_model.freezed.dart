// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletInfoModel {

@JsonKey(name: 'available_balance') dynamic get availableBalance;@JsonKey(name: 'held_balance') dynamic get heldBalance; String get currency;
/// Create a copy of WalletInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletInfoModelCopyWith<WalletInfoModel> get copyWith => _$WalletInfoModelCopyWithImpl<WalletInfoModel>(this as WalletInfoModel, _$identity);

  /// Serializes this WalletInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletInfoModel&&const DeepCollectionEquality().equals(other.availableBalance, availableBalance)&&const DeepCollectionEquality().equals(other.heldBalance, heldBalance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availableBalance),const DeepCollectionEquality().hash(heldBalance),currency);

@override
String toString() {
  return 'WalletInfoModel(availableBalance: $availableBalance, heldBalance: $heldBalance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $WalletInfoModelCopyWith<$Res>  {
  factory $WalletInfoModelCopyWith(WalletInfoModel value, $Res Function(WalletInfoModel) _then) = _$WalletInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'available_balance') dynamic availableBalance,@JsonKey(name: 'held_balance') dynamic heldBalance, String currency
});




}
/// @nodoc
class _$WalletInfoModelCopyWithImpl<$Res>
    implements $WalletInfoModelCopyWith<$Res> {
  _$WalletInfoModelCopyWithImpl(this._self, this._then);

  final WalletInfoModel _self;
  final $Res Function(WalletInfoModel) _then;

/// Create a copy of WalletInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableBalance = freezed,Object? heldBalance = freezed,Object? currency = null,}) {
  return _then(_self.copyWith(
availableBalance: freezed == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as dynamic,heldBalance: freezed == heldBalance ? _self.heldBalance : heldBalance // ignore: cast_nullable_to_non_nullable
as dynamic,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletInfoModel].
extension WalletInfoModelPatterns on WalletInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _WalletInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _WalletInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'available_balance')  dynamic availableBalance, @JsonKey(name: 'held_balance')  dynamic heldBalance,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletInfoModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'available_balance')  dynamic availableBalance, @JsonKey(name: 'held_balance')  dynamic heldBalance,  String currency)  $default,) {final _that = this;
switch (_that) {
case _WalletInfoModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'available_balance')  dynamic availableBalance, @JsonKey(name: 'held_balance')  dynamic heldBalance,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _WalletInfoModel() when $default != null:
return $default(_that.availableBalance,_that.heldBalance,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletInfoModel extends WalletInfoModel {
  const _WalletInfoModel({@JsonKey(name: 'available_balance') this.availableBalance = '0.00', @JsonKey(name: 'held_balance') this.heldBalance = '0.00', this.currency = 'SYP'}): super._();
  factory _WalletInfoModel.fromJson(Map<String, dynamic> json) => _$WalletInfoModelFromJson(json);

@override@JsonKey(name: 'available_balance') final  dynamic availableBalance;
@override@JsonKey(name: 'held_balance') final  dynamic heldBalance;
@override@JsonKey() final  String currency;

/// Create a copy of WalletInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletInfoModelCopyWith<_WalletInfoModel> get copyWith => __$WalletInfoModelCopyWithImpl<_WalletInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletInfoModel&&const DeepCollectionEquality().equals(other.availableBalance, availableBalance)&&const DeepCollectionEquality().equals(other.heldBalance, heldBalance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availableBalance),const DeepCollectionEquality().hash(heldBalance),currency);

@override
String toString() {
  return 'WalletInfoModel(availableBalance: $availableBalance, heldBalance: $heldBalance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$WalletInfoModelCopyWith<$Res> implements $WalletInfoModelCopyWith<$Res> {
  factory _$WalletInfoModelCopyWith(_WalletInfoModel value, $Res Function(_WalletInfoModel) _then) = __$WalletInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'available_balance') dynamic availableBalance,@JsonKey(name: 'held_balance') dynamic heldBalance, String currency
});




}
/// @nodoc
class __$WalletInfoModelCopyWithImpl<$Res>
    implements _$WalletInfoModelCopyWith<$Res> {
  __$WalletInfoModelCopyWithImpl(this._self, this._then);

  final _WalletInfoModel _self;
  final $Res Function(_WalletInfoModel) _then;

/// Create a copy of WalletInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableBalance = freezed,Object? heldBalance = freezed,Object? currency = null,}) {
  return _then(_WalletInfoModel(
availableBalance: freezed == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as dynamic,heldBalance: freezed == heldBalance ? _self.heldBalance : heldBalance // ignore: cast_nullable_to_non_nullable
as dynamic,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
