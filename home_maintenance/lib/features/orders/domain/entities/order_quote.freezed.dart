// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderQuote {

 int get id; String get type;// 'initial', 'addon'
 String get status;// 'pending', 'accepted', 'rejected'
 String get laborCost; int get warrantyDays; String? get justification; String? get total; DateTime? get expiresAt; List<QuotePart> get parts;
/// Create a copy of OrderQuote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderQuoteCopyWith<OrderQuote> get copyWith => _$OrderQuoteCopyWithImpl<OrderQuote>(this as OrderQuote, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderQuote&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.laborCost, laborCost) || other.laborCost == laborCost)&&(identical(other.warrantyDays, warrantyDays) || other.warrantyDays == warrantyDays)&&(identical(other.justification, justification) || other.justification == justification)&&(identical(other.total, total) || other.total == total)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&const DeepCollectionEquality().equals(other.parts, parts));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,status,laborCost,warrantyDays,justification,total,expiresAt,const DeepCollectionEquality().hash(parts));

@override
String toString() {
  return 'OrderQuote(id: $id, type: $type, status: $status, laborCost: $laborCost, warrantyDays: $warrantyDays, justification: $justification, total: $total, expiresAt: $expiresAt, parts: $parts)';
}


}

/// @nodoc
abstract mixin class $OrderQuoteCopyWith<$Res>  {
  factory $OrderQuoteCopyWith(OrderQuote value, $Res Function(OrderQuote) _then) = _$OrderQuoteCopyWithImpl;
@useResult
$Res call({
 int id, String type, String status, String laborCost, int warrantyDays, String? justification, String? total, DateTime? expiresAt, List<QuotePart> parts
});




}
/// @nodoc
class _$OrderQuoteCopyWithImpl<$Res>
    implements $OrderQuoteCopyWith<$Res> {
  _$OrderQuoteCopyWithImpl(this._self, this._then);

  final OrderQuote _self;
  final $Res Function(OrderQuote) _then;

/// Create a copy of OrderQuote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? status = null,Object? laborCost = null,Object? warrantyDays = null,Object? justification = freezed,Object? total = freezed,Object? expiresAt = freezed,Object? parts = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,laborCost: null == laborCost ? _self.laborCost : laborCost // ignore: cast_nullable_to_non_nullable
as String,warrantyDays: null == warrantyDays ? _self.warrantyDays : warrantyDays // ignore: cast_nullable_to_non_nullable
as int,justification: freezed == justification ? _self.justification : justification // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<QuotePart>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderQuote].
extension OrderQuotePatterns on OrderQuote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderQuote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderQuote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderQuote value)  $default,){
final _that = this;
switch (_that) {
case _OrderQuote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderQuote value)?  $default,){
final _that = this;
switch (_that) {
case _OrderQuote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String type,  String status,  String laborCost,  int warrantyDays,  String? justification,  String? total,  DateTime? expiresAt,  List<QuotePart> parts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderQuote() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.laborCost,_that.warrantyDays,_that.justification,_that.total,_that.expiresAt,_that.parts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String type,  String status,  String laborCost,  int warrantyDays,  String? justification,  String? total,  DateTime? expiresAt,  List<QuotePart> parts)  $default,) {final _that = this;
switch (_that) {
case _OrderQuote():
return $default(_that.id,_that.type,_that.status,_that.laborCost,_that.warrantyDays,_that.justification,_that.total,_that.expiresAt,_that.parts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String type,  String status,  String laborCost,  int warrantyDays,  String? justification,  String? total,  DateTime? expiresAt,  List<QuotePart> parts)?  $default,) {final _that = this;
switch (_that) {
case _OrderQuote() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.laborCost,_that.warrantyDays,_that.justification,_that.total,_that.expiresAt,_that.parts);case _:
  return null;

}
}

}

/// @nodoc


class _OrderQuote implements OrderQuote {
  const _OrderQuote({required this.id, this.type = 'initial', this.status = 'pending', required this.laborCost, this.warrantyDays = 30, this.justification, this.total, this.expiresAt, final  List<QuotePart> parts = const []}): _parts = parts;
  

@override final  int id;
@override@JsonKey() final  String type;
// 'initial', 'addon'
@override@JsonKey() final  String status;
// 'pending', 'accepted', 'rejected'
@override final  String laborCost;
@override@JsonKey() final  int warrantyDays;
@override final  String? justification;
@override final  String? total;
@override final  DateTime? expiresAt;
 final  List<QuotePart> _parts;
@override@JsonKey() List<QuotePart> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}


/// Create a copy of OrderQuote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderQuoteCopyWith<_OrderQuote> get copyWith => __$OrderQuoteCopyWithImpl<_OrderQuote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderQuote&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.laborCost, laborCost) || other.laborCost == laborCost)&&(identical(other.warrantyDays, warrantyDays) || other.warrantyDays == warrantyDays)&&(identical(other.justification, justification) || other.justification == justification)&&(identical(other.total, total) || other.total == total)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&const DeepCollectionEquality().equals(other._parts, _parts));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,status,laborCost,warrantyDays,justification,total,expiresAt,const DeepCollectionEquality().hash(_parts));

@override
String toString() {
  return 'OrderQuote(id: $id, type: $type, status: $status, laborCost: $laborCost, warrantyDays: $warrantyDays, justification: $justification, total: $total, expiresAt: $expiresAt, parts: $parts)';
}


}

/// @nodoc
abstract mixin class _$OrderQuoteCopyWith<$Res> implements $OrderQuoteCopyWith<$Res> {
  factory _$OrderQuoteCopyWith(_OrderQuote value, $Res Function(_OrderQuote) _then) = __$OrderQuoteCopyWithImpl;
@override @useResult
$Res call({
 int id, String type, String status, String laborCost, int warrantyDays, String? justification, String? total, DateTime? expiresAt, List<QuotePart> parts
});




}
/// @nodoc
class __$OrderQuoteCopyWithImpl<$Res>
    implements _$OrderQuoteCopyWith<$Res> {
  __$OrderQuoteCopyWithImpl(this._self, this._then);

  final _OrderQuote _self;
  final $Res Function(_OrderQuote) _then;

/// Create a copy of OrderQuote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? status = null,Object? laborCost = null,Object? warrantyDays = null,Object? justification = freezed,Object? total = freezed,Object? expiresAt = freezed,Object? parts = null,}) {
  return _then(_OrderQuote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,laborCost: null == laborCost ? _self.laborCost : laborCost // ignore: cast_nullable_to_non_nullable
as String,warrantyDays: null == warrantyDays ? _self.warrantyDays : warrantyDays // ignore: cast_nullable_to_non_nullable
as int,justification: freezed == justification ? _self.justification : justification // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<QuotePart>,
  ));
}


}

// dart format on
