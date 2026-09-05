// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_quote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderQuoteModel {

 int get id; String get type; String get status;@JsonKey(name: 'labor_cost') dynamic get laborCost;@JsonKey(name: 'warranty_days') dynamic get warrantyDays; String? get justification; dynamic get total;@JsonKey(name: 'expires_at') String? get expiresAt; List<QuotePartModel> get parts;
/// Create a copy of OrderQuoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderQuoteModelCopyWith<OrderQuoteModel> get copyWith => _$OrderQuoteModelCopyWithImpl<OrderQuoteModel>(this as OrderQuoteModel, _$identity);

  /// Serializes this OrderQuoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderQuoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.laborCost, laborCost)&&const DeepCollectionEquality().equals(other.warrantyDays, warrantyDays)&&(identical(other.justification, justification) || other.justification == justification)&&const DeepCollectionEquality().equals(other.total, total)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&const DeepCollectionEquality().equals(other.parts, parts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,const DeepCollectionEquality().hash(laborCost),const DeepCollectionEquality().hash(warrantyDays),justification,const DeepCollectionEquality().hash(total),expiresAt,const DeepCollectionEquality().hash(parts));

@override
String toString() {
  return 'OrderQuoteModel(id: $id, type: $type, status: $status, laborCost: $laborCost, warrantyDays: $warrantyDays, justification: $justification, total: $total, expiresAt: $expiresAt, parts: $parts)';
}


}

/// @nodoc
abstract mixin class $OrderQuoteModelCopyWith<$Res>  {
  factory $OrderQuoteModelCopyWith(OrderQuoteModel value, $Res Function(OrderQuoteModel) _then) = _$OrderQuoteModelCopyWithImpl;
@useResult
$Res call({
 int id, String type, String status,@JsonKey(name: 'labor_cost') dynamic laborCost,@JsonKey(name: 'warranty_days') dynamic warrantyDays, String? justification, dynamic total,@JsonKey(name: 'expires_at') String? expiresAt, List<QuotePartModel> parts
});




}
/// @nodoc
class _$OrderQuoteModelCopyWithImpl<$Res>
    implements $OrderQuoteModelCopyWith<$Res> {
  _$OrderQuoteModelCopyWithImpl(this._self, this._then);

  final OrderQuoteModel _self;
  final $Res Function(OrderQuoteModel) _then;

/// Create a copy of OrderQuoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? status = null,Object? laborCost = freezed,Object? warrantyDays = freezed,Object? justification = freezed,Object? total = freezed,Object? expiresAt = freezed,Object? parts = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,laborCost: freezed == laborCost ? _self.laborCost : laborCost // ignore: cast_nullable_to_non_nullable
as dynamic,warrantyDays: freezed == warrantyDays ? _self.warrantyDays : warrantyDays // ignore: cast_nullable_to_non_nullable
as dynamic,justification: freezed == justification ? _self.justification : justification // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as dynamic,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<QuotePartModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderQuoteModel].
extension OrderQuoteModelPatterns on OrderQuoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderQuoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderQuoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderQuoteModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderQuoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderQuoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderQuoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String type,  String status, @JsonKey(name: 'labor_cost')  dynamic laborCost, @JsonKey(name: 'warranty_days')  dynamic warrantyDays,  String? justification,  dynamic total, @JsonKey(name: 'expires_at')  String? expiresAt,  List<QuotePartModel> parts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderQuoteModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String type,  String status, @JsonKey(name: 'labor_cost')  dynamic laborCost, @JsonKey(name: 'warranty_days')  dynamic warrantyDays,  String? justification,  dynamic total, @JsonKey(name: 'expires_at')  String? expiresAt,  List<QuotePartModel> parts)  $default,) {final _that = this;
switch (_that) {
case _OrderQuoteModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String type,  String status, @JsonKey(name: 'labor_cost')  dynamic laborCost, @JsonKey(name: 'warranty_days')  dynamic warrantyDays,  String? justification,  dynamic total, @JsonKey(name: 'expires_at')  String? expiresAt,  List<QuotePartModel> parts)?  $default,) {final _that = this;
switch (_that) {
case _OrderQuoteModel() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.laborCost,_that.warrantyDays,_that.justification,_that.total,_that.expiresAt,_that.parts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderQuoteModel extends OrderQuoteModel {
  const _OrderQuoteModel({required this.id, this.type = 'initial', this.status = 'pending', @JsonKey(name: 'labor_cost') required this.laborCost, @JsonKey(name: 'warranty_days') this.warrantyDays, this.justification, this.total, @JsonKey(name: 'expires_at') this.expiresAt, final  List<QuotePartModel> parts = const []}): _parts = parts,super._();
  factory _OrderQuoteModel.fromJson(Map<String, dynamic> json) => _$OrderQuoteModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String type;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'labor_cost') final  dynamic laborCost;
@override@JsonKey(name: 'warranty_days') final  dynamic warrantyDays;
@override final  String? justification;
@override final  dynamic total;
@override@JsonKey(name: 'expires_at') final  String? expiresAt;
 final  List<QuotePartModel> _parts;
@override@JsonKey() List<QuotePartModel> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}


/// Create a copy of OrderQuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderQuoteModelCopyWith<_OrderQuoteModel> get copyWith => __$OrderQuoteModelCopyWithImpl<_OrderQuoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderQuoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderQuoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.laborCost, laborCost)&&const DeepCollectionEquality().equals(other.warrantyDays, warrantyDays)&&(identical(other.justification, justification) || other.justification == justification)&&const DeepCollectionEquality().equals(other.total, total)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&const DeepCollectionEquality().equals(other._parts, _parts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,const DeepCollectionEquality().hash(laborCost),const DeepCollectionEquality().hash(warrantyDays),justification,const DeepCollectionEquality().hash(total),expiresAt,const DeepCollectionEquality().hash(_parts));

@override
String toString() {
  return 'OrderQuoteModel(id: $id, type: $type, status: $status, laborCost: $laborCost, warrantyDays: $warrantyDays, justification: $justification, total: $total, expiresAt: $expiresAt, parts: $parts)';
}


}

/// @nodoc
abstract mixin class _$OrderQuoteModelCopyWith<$Res> implements $OrderQuoteModelCopyWith<$Res> {
  factory _$OrderQuoteModelCopyWith(_OrderQuoteModel value, $Res Function(_OrderQuoteModel) _then) = __$OrderQuoteModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String type, String status,@JsonKey(name: 'labor_cost') dynamic laborCost,@JsonKey(name: 'warranty_days') dynamic warrantyDays, String? justification, dynamic total,@JsonKey(name: 'expires_at') String? expiresAt, List<QuotePartModel> parts
});




}
/// @nodoc
class __$OrderQuoteModelCopyWithImpl<$Res>
    implements _$OrderQuoteModelCopyWith<$Res> {
  __$OrderQuoteModelCopyWithImpl(this._self, this._then);

  final _OrderQuoteModel _self;
  final $Res Function(_OrderQuoteModel) _then;

/// Create a copy of OrderQuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? status = null,Object? laborCost = freezed,Object? warrantyDays = freezed,Object? justification = freezed,Object? total = freezed,Object? expiresAt = freezed,Object? parts = null,}) {
  return _then(_OrderQuoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,laborCost: freezed == laborCost ? _self.laborCost : laborCost // ignore: cast_nullable_to_non_nullable
as dynamic,warrantyDays: freezed == warrantyDays ? _self.warrantyDays : warrantyDays // ignore: cast_nullable_to_non_nullable
as dynamic,justification: freezed == justification ? _self.justification : justification // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as dynamic,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<QuotePartModel>,
  ));
}


}

// dart format on
