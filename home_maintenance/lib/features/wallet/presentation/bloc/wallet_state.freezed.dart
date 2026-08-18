// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletState {

 bool get isLoading; bool get isSubmitting; WalletInfo? get wallet; ShamCashAccount? get shamCashAccount; List<WithdrawalItem> get withdrawals; WithdrawalItem? get selectedWithdrawal; String? get errorMessage; String? get successMessage;
/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletStateCopyWith<WalletState> get copyWith => _$WalletStateCopyWithImpl<WalletState>(this as WalletState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.shamCashAccount, shamCashAccount) || other.shamCashAccount == shamCashAccount)&&const DeepCollectionEquality().equals(other.withdrawals, withdrawals)&&(identical(other.selectedWithdrawal, selectedWithdrawal) || other.selectedWithdrawal == selectedWithdrawal)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSubmitting,wallet,shamCashAccount,const DeepCollectionEquality().hash(withdrawals),selectedWithdrawal,errorMessage,successMessage);

@override
String toString() {
  return 'WalletState(isLoading: $isLoading, isSubmitting: $isSubmitting, wallet: $wallet, shamCashAccount: $shamCashAccount, withdrawals: $withdrawals, selectedWithdrawal: $selectedWithdrawal, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $WalletStateCopyWith<$Res>  {
  factory $WalletStateCopyWith(WalletState value, $Res Function(WalletState) _then) = _$WalletStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSubmitting, WalletInfo? wallet, ShamCashAccount? shamCashAccount, List<WithdrawalItem> withdrawals, WithdrawalItem? selectedWithdrawal, String? errorMessage, String? successMessage
});


$WalletInfoCopyWith<$Res>? get wallet;$ShamCashAccountCopyWith<$Res>? get shamCashAccount;$WithdrawalItemCopyWith<$Res>? get selectedWithdrawal;

}
/// @nodoc
class _$WalletStateCopyWithImpl<$Res>
    implements $WalletStateCopyWith<$Res> {
  _$WalletStateCopyWithImpl(this._self, this._then);

  final WalletState _self;
  final $Res Function(WalletState) _then;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSubmitting = null,Object? wallet = freezed,Object? shamCashAccount = freezed,Object? withdrawals = null,Object? selectedWithdrawal = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,wallet: freezed == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as WalletInfo?,shamCashAccount: freezed == shamCashAccount ? _self.shamCashAccount : shamCashAccount // ignore: cast_nullable_to_non_nullable
as ShamCashAccount?,withdrawals: null == withdrawals ? _self.withdrawals : withdrawals // ignore: cast_nullable_to_non_nullable
as List<WithdrawalItem>,selectedWithdrawal: freezed == selectedWithdrawal ? _self.selectedWithdrawal : selectedWithdrawal // ignore: cast_nullable_to_non_nullable
as WithdrawalItem?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletInfoCopyWith<$Res>? get wallet {
    if (_self.wallet == null) {
    return null;
  }

  return $WalletInfoCopyWith<$Res>(_self.wallet!, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShamCashAccountCopyWith<$Res>? get shamCashAccount {
    if (_self.shamCashAccount == null) {
    return null;
  }

  return $ShamCashAccountCopyWith<$Res>(_self.shamCashAccount!, (value) {
    return _then(_self.copyWith(shamCashAccount: value));
  });
}/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WithdrawalItemCopyWith<$Res>? get selectedWithdrawal {
    if (_self.selectedWithdrawal == null) {
    return null;
  }

  return $WithdrawalItemCopyWith<$Res>(_self.selectedWithdrawal!, (value) {
    return _then(_self.copyWith(selectedWithdrawal: value));
  });
}
}


/// Adds pattern-matching-related methods to [WalletState].
extension WalletStatePatterns on WalletState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletState value)  $default,){
final _that = this;
switch (_that) {
case _WalletState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletState value)?  $default,){
final _that = this;
switch (_that) {
case _WalletState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSubmitting,  WalletInfo? wallet,  ShamCashAccount? shamCashAccount,  List<WithdrawalItem> withdrawals,  WithdrawalItem? selectedWithdrawal,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletState() when $default != null:
return $default(_that.isLoading,_that.isSubmitting,_that.wallet,_that.shamCashAccount,_that.withdrawals,_that.selectedWithdrawal,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSubmitting,  WalletInfo? wallet,  ShamCashAccount? shamCashAccount,  List<WithdrawalItem> withdrawals,  WithdrawalItem? selectedWithdrawal,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _WalletState():
return $default(_that.isLoading,_that.isSubmitting,_that.wallet,_that.shamCashAccount,_that.withdrawals,_that.selectedWithdrawal,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSubmitting,  WalletInfo? wallet,  ShamCashAccount? shamCashAccount,  List<WithdrawalItem> withdrawals,  WithdrawalItem? selectedWithdrawal,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _WalletState() when $default != null:
return $default(_that.isLoading,_that.isSubmitting,_that.wallet,_that.shamCashAccount,_that.withdrawals,_that.selectedWithdrawal,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _WalletState implements WalletState {
  const _WalletState({this.isLoading = false, this.isSubmitting = false, this.wallet, this.shamCashAccount, final  List<WithdrawalItem> withdrawals = const [], this.selectedWithdrawal, this.errorMessage, this.successMessage}): _withdrawals = withdrawals;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSubmitting;
@override final  WalletInfo? wallet;
@override final  ShamCashAccount? shamCashAccount;
 final  List<WithdrawalItem> _withdrawals;
@override@JsonKey() List<WithdrawalItem> get withdrawals {
  if (_withdrawals is EqualUnmodifiableListView) return _withdrawals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_withdrawals);
}

@override final  WithdrawalItem? selectedWithdrawal;
@override final  String? errorMessage;
@override final  String? successMessage;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletStateCopyWith<_WalletState> get copyWith => __$WalletStateCopyWithImpl<_WalletState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.shamCashAccount, shamCashAccount) || other.shamCashAccount == shamCashAccount)&&const DeepCollectionEquality().equals(other._withdrawals, _withdrawals)&&(identical(other.selectedWithdrawal, selectedWithdrawal) || other.selectedWithdrawal == selectedWithdrawal)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSubmitting,wallet,shamCashAccount,const DeepCollectionEquality().hash(_withdrawals),selectedWithdrawal,errorMessage,successMessage);

@override
String toString() {
  return 'WalletState(isLoading: $isLoading, isSubmitting: $isSubmitting, wallet: $wallet, shamCashAccount: $shamCashAccount, withdrawals: $withdrawals, selectedWithdrawal: $selectedWithdrawal, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$WalletStateCopyWith<$Res> implements $WalletStateCopyWith<$Res> {
  factory _$WalletStateCopyWith(_WalletState value, $Res Function(_WalletState) _then) = __$WalletStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSubmitting, WalletInfo? wallet, ShamCashAccount? shamCashAccount, List<WithdrawalItem> withdrawals, WithdrawalItem? selectedWithdrawal, String? errorMessage, String? successMessage
});


@override $WalletInfoCopyWith<$Res>? get wallet;@override $ShamCashAccountCopyWith<$Res>? get shamCashAccount;@override $WithdrawalItemCopyWith<$Res>? get selectedWithdrawal;

}
/// @nodoc
class __$WalletStateCopyWithImpl<$Res>
    implements _$WalletStateCopyWith<$Res> {
  __$WalletStateCopyWithImpl(this._self, this._then);

  final _WalletState _self;
  final $Res Function(_WalletState) _then;

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSubmitting = null,Object? wallet = freezed,Object? shamCashAccount = freezed,Object? withdrawals = null,Object? selectedWithdrawal = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_WalletState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,wallet: freezed == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as WalletInfo?,shamCashAccount: freezed == shamCashAccount ? _self.shamCashAccount : shamCashAccount // ignore: cast_nullable_to_non_nullable
as ShamCashAccount?,withdrawals: null == withdrawals ? _self._withdrawals : withdrawals // ignore: cast_nullable_to_non_nullable
as List<WithdrawalItem>,selectedWithdrawal: freezed == selectedWithdrawal ? _self.selectedWithdrawal : selectedWithdrawal // ignore: cast_nullable_to_non_nullable
as WithdrawalItem?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletInfoCopyWith<$Res>? get wallet {
    if (_self.wallet == null) {
    return null;
  }

  return $WalletInfoCopyWith<$Res>(_self.wallet!, (value) {
    return _then(_self.copyWith(wallet: value));
  });
}/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShamCashAccountCopyWith<$Res>? get shamCashAccount {
    if (_self.shamCashAccount == null) {
    return null;
  }

  return $ShamCashAccountCopyWith<$Res>(_self.shamCashAccount!, (value) {
    return _then(_self.copyWith(shamCashAccount: value));
  });
}/// Create a copy of WalletState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WithdrawalItemCopyWith<$Res>? get selectedWithdrawal {
    if (_self.selectedWithdrawal == null) {
    return null;
  }

  return $WithdrawalItemCopyWith<$Res>(_self.selectedWithdrawal!, (value) {
    return _then(_self.copyWith(selectedWithdrawal: value));
  });
}
}

// dart format on
