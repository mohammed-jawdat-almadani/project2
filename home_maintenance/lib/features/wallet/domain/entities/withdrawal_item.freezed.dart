// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdrawal_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WithdrawalItem {

 int get id; String get amount; String get status;// 'processing', 'completed', 'rejected'
 String? get shamCashNumber; String? get shamCashName; bool get hasReceipt; DateTime? get createdAt; String? get rejectionReason;
/// Create a copy of WithdrawalItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawalItemCopyWith<WithdrawalItem> get copyWith => _$WithdrawalItemCopyWithImpl<WithdrawalItem>(this as WithdrawalItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawalItem&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.shamCashNumber, shamCashNumber) || other.shamCashNumber == shamCashNumber)&&(identical(other.shamCashName, shamCashName) || other.shamCashName == shamCashName)&&(identical(other.hasReceipt, hasReceipt) || other.hasReceipt == hasReceipt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}


@override
int get hashCode => Object.hash(runtimeType,id,amount,status,shamCashNumber,shamCashName,hasReceipt,createdAt,rejectionReason);

@override
String toString() {
  return 'WithdrawalItem(id: $id, amount: $amount, status: $status, shamCashNumber: $shamCashNumber, shamCashName: $shamCashName, hasReceipt: $hasReceipt, createdAt: $createdAt, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class $WithdrawalItemCopyWith<$Res>  {
  factory $WithdrawalItemCopyWith(WithdrawalItem value, $Res Function(WithdrawalItem) _then) = _$WithdrawalItemCopyWithImpl;
@useResult
$Res call({
 int id, String amount, String status, String? shamCashNumber, String? shamCashName, bool hasReceipt, DateTime? createdAt, String? rejectionReason
});




}
/// @nodoc
class _$WithdrawalItemCopyWithImpl<$Res>
    implements $WithdrawalItemCopyWith<$Res> {
  _$WithdrawalItemCopyWithImpl(this._self, this._then);

  final WithdrawalItem _self;
  final $Res Function(WithdrawalItem) _then;

/// Create a copy of WithdrawalItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? status = null,Object? shamCashNumber = freezed,Object? shamCashName = freezed,Object? hasReceipt = null,Object? createdAt = freezed,Object? rejectionReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,shamCashNumber: freezed == shamCashNumber ? _self.shamCashNumber : shamCashNumber // ignore: cast_nullable_to_non_nullable
as String?,shamCashName: freezed == shamCashName ? _self.shamCashName : shamCashName // ignore: cast_nullable_to_non_nullable
as String?,hasReceipt: null == hasReceipt ? _self.hasReceipt : hasReceipt // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawalItem].
extension WithdrawalItemPatterns on WithdrawalItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WithdrawalItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WithdrawalItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WithdrawalItem value)  $default,){
final _that = this;
switch (_that) {
case _WithdrawalItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WithdrawalItem value)?  $default,){
final _that = this;
switch (_that) {
case _WithdrawalItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String amount,  String status,  String? shamCashNumber,  String? shamCashName,  bool hasReceipt,  DateTime? createdAt,  String? rejectionReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WithdrawalItem() when $default != null:
return $default(_that.id,_that.amount,_that.status,_that.shamCashNumber,_that.shamCashName,_that.hasReceipt,_that.createdAt,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String amount,  String status,  String? shamCashNumber,  String? shamCashName,  bool hasReceipt,  DateTime? createdAt,  String? rejectionReason)  $default,) {final _that = this;
switch (_that) {
case _WithdrawalItem():
return $default(_that.id,_that.amount,_that.status,_that.shamCashNumber,_that.shamCashName,_that.hasReceipt,_that.createdAt,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String amount,  String status,  String? shamCashNumber,  String? shamCashName,  bool hasReceipt,  DateTime? createdAt,  String? rejectionReason)?  $default,) {final _that = this;
switch (_that) {
case _WithdrawalItem() when $default != null:
return $default(_that.id,_that.amount,_that.status,_that.shamCashNumber,_that.shamCashName,_that.hasReceipt,_that.createdAt,_that.rejectionReason);case _:
  return null;

}
}

}

/// @nodoc


class _WithdrawalItem implements WithdrawalItem {
  const _WithdrawalItem({required this.id, required this.amount, required this.status, this.shamCashNumber, this.shamCashName, this.hasReceipt = false, this.createdAt, this.rejectionReason});
  

@override final  int id;
@override final  String amount;
@override final  String status;
// 'processing', 'completed', 'rejected'
@override final  String? shamCashNumber;
@override final  String? shamCashName;
@override@JsonKey() final  bool hasReceipt;
@override final  DateTime? createdAt;
@override final  String? rejectionReason;

/// Create a copy of WithdrawalItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawalItemCopyWith<_WithdrawalItem> get copyWith => __$WithdrawalItemCopyWithImpl<_WithdrawalItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawalItem&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.shamCashNumber, shamCashNumber) || other.shamCashNumber == shamCashNumber)&&(identical(other.shamCashName, shamCashName) || other.shamCashName == shamCashName)&&(identical(other.hasReceipt, hasReceipt) || other.hasReceipt == hasReceipt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}


@override
int get hashCode => Object.hash(runtimeType,id,amount,status,shamCashNumber,shamCashName,hasReceipt,createdAt,rejectionReason);

@override
String toString() {
  return 'WithdrawalItem(id: $id, amount: $amount, status: $status, shamCashNumber: $shamCashNumber, shamCashName: $shamCashName, hasReceipt: $hasReceipt, createdAt: $createdAt, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class _$WithdrawalItemCopyWith<$Res> implements $WithdrawalItemCopyWith<$Res> {
  factory _$WithdrawalItemCopyWith(_WithdrawalItem value, $Res Function(_WithdrawalItem) _then) = __$WithdrawalItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String amount, String status, String? shamCashNumber, String? shamCashName, bool hasReceipt, DateTime? createdAt, String? rejectionReason
});




}
/// @nodoc
class __$WithdrawalItemCopyWithImpl<$Res>
    implements _$WithdrawalItemCopyWith<$Res> {
  __$WithdrawalItemCopyWithImpl(this._self, this._then);

  final _WithdrawalItem _self;
  final $Res Function(_WithdrawalItem) _then;

/// Create a copy of WithdrawalItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? status = null,Object? shamCashNumber = freezed,Object? shamCashName = freezed,Object? hasReceipt = null,Object? createdAt = freezed,Object? rejectionReason = freezed,}) {
  return _then(_WithdrawalItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,shamCashNumber: freezed == shamCashNumber ? _self.shamCashNumber : shamCashNumber // ignore: cast_nullable_to_non_nullable
as String?,shamCashName: freezed == shamCashName ? _self.shamCashName : shamCashName // ignore: cast_nullable_to_non_nullable
as String?,hasReceipt: null == hasReceipt ? _self.hasReceipt : hasReceipt // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
