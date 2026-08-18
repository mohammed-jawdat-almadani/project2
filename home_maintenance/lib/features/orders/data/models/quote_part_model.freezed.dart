// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_part_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuotePartModel {

 int? get id; String get name; dynamic get price; String get classification;@JsonKey(name: 'image_url') String? get imageUrl;
/// Create a copy of QuotePartModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuotePartModelCopyWith<QuotePartModel> get copyWith => _$QuotePartModelCopyWithImpl<QuotePartModel>(this as QuotePartModel, _$identity);

  /// Serializes this QuotePartModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotePartModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.price, price)&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(price),classification,imageUrl);

@override
String toString() {
  return 'QuotePartModel(id: $id, name: $name, price: $price, classification: $classification, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $QuotePartModelCopyWith<$Res>  {
  factory $QuotePartModelCopyWith(QuotePartModel value, $Res Function(QuotePartModel) _then) = _$QuotePartModelCopyWithImpl;
@useResult
$Res call({
 int? id, String name, dynamic price, String classification,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class _$QuotePartModelCopyWithImpl<$Res>
    implements $QuotePartModelCopyWith<$Res> {
  _$QuotePartModelCopyWithImpl(this._self, this._then);

  final QuotePartModel _self;
  final $Res Function(QuotePartModel) _then;

/// Create a copy of QuotePartModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? price = freezed,Object? classification = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as dynamic,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuotePartModel].
extension QuotePartModelPatterns on QuotePartModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuotePartModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuotePartModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuotePartModel value)  $default,){
final _that = this;
switch (_that) {
case _QuotePartModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuotePartModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuotePartModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  dynamic price,  String classification, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuotePartModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.classification,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  dynamic price,  String classification, @JsonKey(name: 'image_url')  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _QuotePartModel():
return $default(_that.id,_that.name,_that.price,_that.classification,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  dynamic price,  String classification, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _QuotePartModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.classification,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuotePartModel extends QuotePartModel {
  const _QuotePartModel({this.id, required this.name, required this.price, this.classification = 'standard', @JsonKey(name: 'image_url') this.imageUrl}): super._();
  factory _QuotePartModel.fromJson(Map<String, dynamic> json) => _$QuotePartModelFromJson(json);

@override final  int? id;
@override final  String name;
@override final  dynamic price;
@override@JsonKey() final  String classification;
@override@JsonKey(name: 'image_url') final  String? imageUrl;

/// Create a copy of QuotePartModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuotePartModelCopyWith<_QuotePartModel> get copyWith => __$QuotePartModelCopyWithImpl<_QuotePartModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuotePartModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuotePartModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.price, price)&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(price),classification,imageUrl);

@override
String toString() {
  return 'QuotePartModel(id: $id, name: $name, price: $price, classification: $classification, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$QuotePartModelCopyWith<$Res> implements $QuotePartModelCopyWith<$Res> {
  factory _$QuotePartModelCopyWith(_QuotePartModel value, $Res Function(_QuotePartModel) _then) = __$QuotePartModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, dynamic price, String classification,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class __$QuotePartModelCopyWithImpl<$Res>
    implements _$QuotePartModelCopyWith<$Res> {
  __$QuotePartModelCopyWithImpl(this._self, this._then);

  final _QuotePartModel _self;
  final $Res Function(_QuotePartModel) _then;

/// Create a copy of QuotePartModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? price = freezed,Object? classification = null,Object? imageUrl = freezed,}) {
  return _then(_QuotePartModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as dynamic,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
