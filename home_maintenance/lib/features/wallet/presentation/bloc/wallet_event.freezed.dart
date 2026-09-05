// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletEvent()';
}


}

/// @nodoc
class $WalletEventCopyWith<$Res>  {
$WalletEventCopyWith(WalletEvent _, $Res Function(WalletEvent) __);
}


/// Adds pattern-matching-related methods to [WalletEvent].
extension WalletEventPatterns on WalletEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Refresh value)?  refresh,TResult Function( _RequestWithdrawal value)?  requestWithdrawal,TResult Function( _SetShamCashAccount value)?  setShamCashAccount,TResult Function( _SelectWithdrawal value)?  selectWithdrawal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Refresh() when refresh != null:
return refresh(_that);case _RequestWithdrawal() when requestWithdrawal != null:
return requestWithdrawal(_that);case _SetShamCashAccount() when setShamCashAccount != null:
return setShamCashAccount(_that);case _SelectWithdrawal() when selectWithdrawal != null:
return selectWithdrawal(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Refresh value)  refresh,required TResult Function( _RequestWithdrawal value)  requestWithdrawal,required TResult Function( _SetShamCashAccount value)  setShamCashAccount,required TResult Function( _SelectWithdrawal value)  selectWithdrawal,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Refresh():
return refresh(_that);case _RequestWithdrawal():
return requestWithdrawal(_that);case _SetShamCashAccount():
return setShamCashAccount(_that);case _SelectWithdrawal():
return selectWithdrawal(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Refresh value)?  refresh,TResult? Function( _RequestWithdrawal value)?  requestWithdrawal,TResult? Function( _SetShamCashAccount value)?  setShamCashAccount,TResult? Function( _SelectWithdrawal value)?  selectWithdrawal,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Refresh() when refresh != null:
return refresh(_that);case _RequestWithdrawal() when requestWithdrawal != null:
return requestWithdrawal(_that);case _SetShamCashAccount() when setShamCashAccount != null:
return setShamCashAccount(_that);case _SelectWithdrawal() when selectWithdrawal != null:
return selectWithdrawal(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  refresh,TResult Function( String amount)?  requestWithdrawal,TResult Function( String name,  String number)?  setShamCashAccount,TResult Function( int id)?  selectWithdrawal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Refresh() when refresh != null:
return refresh();case _RequestWithdrawal() when requestWithdrawal != null:
return requestWithdrawal(_that.amount);case _SetShamCashAccount() when setShamCashAccount != null:
return setShamCashAccount(_that.name,_that.number);case _SelectWithdrawal() when selectWithdrawal != null:
return selectWithdrawal(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  refresh,required TResult Function( String amount)  requestWithdrawal,required TResult Function( String name,  String number)  setShamCashAccount,required TResult Function( int id)  selectWithdrawal,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Refresh():
return refresh();case _RequestWithdrawal():
return requestWithdrawal(_that.amount);case _SetShamCashAccount():
return setShamCashAccount(_that.name,_that.number);case _SelectWithdrawal():
return selectWithdrawal(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  refresh,TResult? Function( String amount)?  requestWithdrawal,TResult? Function( String name,  String number)?  setShamCashAccount,TResult? Function( int id)?  selectWithdrawal,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Refresh() when refresh != null:
return refresh();case _RequestWithdrawal() when requestWithdrawal != null:
return requestWithdrawal(_that.amount);case _SetShamCashAccount() when setShamCashAccount != null:
return setShamCashAccount(_that.name,_that.number);case _SelectWithdrawal() when selectWithdrawal != null:
return selectWithdrawal(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements WalletEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletEvent.init()';
}


}




/// @nodoc


class _Refresh implements WalletEvent {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WalletEvent.refresh()';
}


}




/// @nodoc


class _RequestWithdrawal implements WalletEvent {
  const _RequestWithdrawal(this.amount);
  

 final  String amount;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestWithdrawalCopyWith<_RequestWithdrawal> get copyWith => __$RequestWithdrawalCopyWithImpl<_RequestWithdrawal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestWithdrawal&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'WalletEvent.requestWithdrawal(amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$RequestWithdrawalCopyWith<$Res> implements $WalletEventCopyWith<$Res> {
  factory _$RequestWithdrawalCopyWith(_RequestWithdrawal value, $Res Function(_RequestWithdrawal) _then) = __$RequestWithdrawalCopyWithImpl;
@useResult
$Res call({
 String amount
});




}
/// @nodoc
class __$RequestWithdrawalCopyWithImpl<$Res>
    implements _$RequestWithdrawalCopyWith<$Res> {
  __$RequestWithdrawalCopyWithImpl(this._self, this._then);

  final _RequestWithdrawal _self;
  final $Res Function(_RequestWithdrawal) _then;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(_RequestWithdrawal(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetShamCashAccount implements WalletEvent {
  const _SetShamCashAccount({required this.name, required this.number});
  

 final  String name;
 final  String number;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetShamCashAccountCopyWith<_SetShamCashAccount> get copyWith => __$SetShamCashAccountCopyWithImpl<_SetShamCashAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetShamCashAccount&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,name,number);

@override
String toString() {
  return 'WalletEvent.setShamCashAccount(name: $name, number: $number)';
}


}

/// @nodoc
abstract mixin class _$SetShamCashAccountCopyWith<$Res> implements $WalletEventCopyWith<$Res> {
  factory _$SetShamCashAccountCopyWith(_SetShamCashAccount value, $Res Function(_SetShamCashAccount) _then) = __$SetShamCashAccountCopyWithImpl;
@useResult
$Res call({
 String name, String number
});




}
/// @nodoc
class __$SetShamCashAccountCopyWithImpl<$Res>
    implements _$SetShamCashAccountCopyWith<$Res> {
  __$SetShamCashAccountCopyWithImpl(this._self, this._then);

  final _SetShamCashAccount _self;
  final $Res Function(_SetShamCashAccount) _then;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? number = null,}) {
  return _then(_SetShamCashAccount(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SelectWithdrawal implements WalletEvent {
  const _SelectWithdrawal(this.id);
  

 final  int id;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectWithdrawalCopyWith<_SelectWithdrawal> get copyWith => __$SelectWithdrawalCopyWithImpl<_SelectWithdrawal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectWithdrawal&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'WalletEvent.selectWithdrawal(id: $id)';
}


}

/// @nodoc
abstract mixin class _$SelectWithdrawalCopyWith<$Res> implements $WalletEventCopyWith<$Res> {
  factory _$SelectWithdrawalCopyWith(_SelectWithdrawal value, $Res Function(_SelectWithdrawal) _then) = __$SelectWithdrawalCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$SelectWithdrawalCopyWithImpl<$Res>
    implements _$SelectWithdrawalCopyWith<$Res> {
  __$SelectWithdrawalCopyWithImpl(this._self, this._then);

  final _SelectWithdrawal _self;
  final $Res Function(_SelectWithdrawal) _then;

/// Create a copy of WalletEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_SelectWithdrawal(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
