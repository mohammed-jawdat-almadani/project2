// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdrawal_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WithdrawalItemModel {

 int get id; dynamic get amount; String get status;@JsonKey(name: 'sham_cash_number') String? get shamCashNumber;@JsonKey(name: 'sham_cash_name') String? get shamCashName;@JsonKey(name: 'has_receipt') bool get hasReceipt;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'rejection_reason') String? get rejectionReason;
/// Create a copy of WithdrawalItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawalItemModelCopyWith<WithdrawalItemModel> get copyWith => _$WithdrawalItemModelCopyWithImpl<WithdrawalItemModel>(this as WithdrawalItemModel, _$identity);

  /// Serializes this WithdrawalItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawalItemModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.amount, amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.shamCashNumber, shamCashNumber) || other.shamCashNumber == shamCashNumber)&&(identical(other.shamCashName, shamCashName) || other.shamCashName == shamCashName)&&(identical(other.hasReceipt, hasReceipt) || other.hasReceipt == hasReceipt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(amount),status,shamCashNumber,shamCashName,hasReceipt,createdAt,rejectionReason);

@override
String toString() {
  return 'WithdrawalItemModel(id: $id, amount: $amount, status: $status, shamCashNumber: $shamCashNumber, shamCashName: $shamCashName, hasReceipt: $hasReceipt, createdAt: $createdAt, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class $WithdrawalItemModelCopyWith<$Res>  {
  factory $WithdrawalItemModelCopyWith(WithdrawalItemModel value, $Res Function(WithdrawalItemModel) _then) = _$WithdrawalItemModelCopyWithImpl;
@useResult
$Res call({
 int id, dynamic amount, String status,@JsonKey(name: 'sham_cash_number') String? shamCashNumber,@JsonKey(name: 'sham_cash_name') String? shamCashName,@JsonKey(name: 'has_receipt') bool hasReceipt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'rejection_reason') String? rejectionReason
});




}
/// @nodoc
class _$WithdrawalItemModelCopyWithImpl<$Res>
    implements $WithdrawalItemModelCopyWith<$Res> {
  _$WithdrawalItemModelCopyWithImpl(this._self, this._then);

  final WithdrawalItemModel _self;
  final $Res Function(WithdrawalItemModel) _then;

/// Create a copy of WithdrawalItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = freezed,Object? status = null,Object? shamCashNumber = freezed,Object? shamCashName = freezed,Object? hasReceipt = null,Object? createdAt = freezed,Object? rejectionReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as dynamic,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,shamCashNumber: freezed == shamCashNumber ? _self.shamCashNumber : shamCashNumber // ignore: cast_nullable_to_non_nullable
as String?,shamCashName: freezed == shamCashName ? _self.shamCashName : shamCashName // ignore: cast_nullable_to_non_nullable
as String?,hasReceipt: null == hasReceipt ? _self.hasReceipt : hasReceipt // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawalItemModel].
extension WithdrawalItemModelPatterns on WithdrawalItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WithdrawalItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WithdrawalItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WithdrawalItemModel value)  $default,){
final _that = this;
switch (_that) {
case _WithdrawalItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WithdrawalItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _WithdrawalItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  dynamic amount,  String status, @JsonKey(name: 'sham_cash_number')  String? shamCashNumber, @JsonKey(name: 'sham_cash_name')  String? shamCashName, @JsonKey(name: 'has_receipt')  bool hasReceipt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WithdrawalItemModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  dynamic amount,  String status, @JsonKey(name: 'sham_cash_number')  String? shamCashNumber, @JsonKey(name: 'sham_cash_name')  String? shamCashName, @JsonKey(name: 'has_receipt')  bool hasReceipt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason)  $default,) {final _that = this;
switch (_that) {
case _WithdrawalItemModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  dynamic amount,  String status, @JsonKey(name: 'sham_cash_number')  String? shamCashNumber, @JsonKey(name: 'sham_cash_name')  String? shamCashName, @JsonKey(name: 'has_receipt')  bool hasReceipt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason)?  $default,) {final _that = this;
switch (_that) {
case _WithdrawalItemModel() when $default != null:
return $default(_that.id,_that.amount,_that.status,_that.shamCashNumber,_that.shamCashName,_that.hasReceipt,_that.createdAt,_that.rejectionReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WithdrawalItemModel extends WithdrawalItemModel {
  const _WithdrawalItemModel({required this.id, this.amount, this.status = 'processing', @JsonKey(name: 'sham_cash_number') this.shamCashNumber, @JsonKey(name: 'sham_cash_name') this.shamCashName, @JsonKey(name: 'has_receipt') this.hasReceipt = false, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'rejection_reason') this.rejectionReason}): super._();
  factory _WithdrawalItemModel.fromJson(Map<String, dynamic> json) => _$WithdrawalItemModelFromJson(json);

@override final  int id;
@override final  dynamic amount;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'sham_cash_number') final  String? shamCashNumber;
@override@JsonKey(name: 'sham_cash_name') final  String? shamCashName;
@override@JsonKey(name: 'has_receipt') final  bool hasReceipt;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;

/// Create a copy of WithdrawalItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawalItemModelCopyWith<_WithdrawalItemModel> get copyWith => __$WithdrawalItemModelCopyWithImpl<_WithdrawalItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WithdrawalItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawalItemModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.amount, amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.shamCashNumber, shamCashNumber) || other.shamCashNumber == shamCashNumber)&&(identical(other.shamCashName, shamCashName) || other.shamCashName == shamCashName)&&(identical(other.hasReceipt, hasReceipt) || other.hasReceipt == hasReceipt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(amount),status,shamCashNumber,shamCashName,hasReceipt,createdAt,rejectionReason);

@override
String toString() {
  return 'WithdrawalItemModel(id: $id, amount: $amount, status: $status, shamCashNumber: $shamCashNumber, shamCashName: $shamCashName, hasReceipt: $hasReceipt, createdAt: $createdAt, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class _$WithdrawalItemModelCopyWith<$Res> implements $WithdrawalItemModelCopyWith<$Res> {
  factory _$WithdrawalItemModelCopyWith(_WithdrawalItemModel value, $Res Function(_WithdrawalItemModel) _then) = __$WithdrawalItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, dynamic amount, String status,@JsonKey(name: 'sham_cash_number') String? shamCashNumber,@JsonKey(name: 'sham_cash_name') String? shamCashName,@JsonKey(name: 'has_receipt') bool hasReceipt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'rejection_reason') String? rejectionReason
});




}
/// @nodoc
class __$WithdrawalItemModelCopyWithImpl<$Res>
    implements _$WithdrawalItemModelCopyWith<$Res> {
  __$WithdrawalItemModelCopyWithImpl(this._self, this._then);

  final _WithdrawalItemModel _self;
  final $Res Function(_WithdrawalItemModel) _then;

/// Create a copy of WithdrawalItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = freezed,Object? status = null,Object? shamCashNumber = freezed,Object? shamCashName = freezed,Object? hasReceipt = null,Object? createdAt = freezed,Object? rejectionReason = freezed,}) {
  return _then(_WithdrawalItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as dynamic,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,shamCashNumber: freezed == shamCashNumber ? _self.shamCashNumber : shamCashNumber // ignore: cast_nullable_to_non_nullable
as String?,shamCashName: freezed == shamCashName ? _self.shamCashName : shamCashName // ignore: cast_nullable_to_non_nullable
as String?,hasReceipt: null == hasReceipt ? _self.hasReceipt : hasReceipt // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
