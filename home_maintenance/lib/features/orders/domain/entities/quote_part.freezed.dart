// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuotePart {

 int? get id; String get name; String get price; String get classification;// 'standard', 'original', 'commercial'
 String? get imageUrl; File? get localImage;
/// Create a copy of QuotePart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuotePartCopyWith<QuotePart> get copyWith => _$QuotePartCopyWithImpl<QuotePart>(this as QuotePart, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotePart&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.localImage, localImage) || other.localImage == localImage));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price,classification,imageUrl,localImage);

@override
String toString() {
  return 'QuotePart(id: $id, name: $name, price: $price, classification: $classification, imageUrl: $imageUrl, localImage: $localImage)';
}


}

/// @nodoc
abstract mixin class $QuotePartCopyWith<$Res>  {
  factory $QuotePartCopyWith(QuotePart value, $Res Function(QuotePart) _then) = _$QuotePartCopyWithImpl;
@useResult
$Res call({
 int? id, String name, String price, String classification, String? imageUrl, File? localImage
});




}
/// @nodoc
class _$QuotePartCopyWithImpl<$Res>
    implements $QuotePartCopyWith<$Res> {
  _$QuotePartCopyWithImpl(this._self, this._then);

  final QuotePart _self;
  final $Res Function(QuotePart) _then;

/// Create a copy of QuotePart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? price = null,Object? classification = null,Object? imageUrl = freezed,Object? localImage = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,localImage: freezed == localImage ? _self.localImage : localImage // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuotePart].
extension QuotePartPatterns on QuotePart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuotePart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuotePart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuotePart value)  $default,){
final _that = this;
switch (_that) {
case _QuotePart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuotePart value)?  $default,){
final _that = this;
switch (_that) {
case _QuotePart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  String price,  String classification,  String? imageUrl,  File? localImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuotePart() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.classification,_that.imageUrl,_that.localImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  String price,  String classification,  String? imageUrl,  File? localImage)  $default,) {final _that = this;
switch (_that) {
case _QuotePart():
return $default(_that.id,_that.name,_that.price,_that.classification,_that.imageUrl,_that.localImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  String price,  String classification,  String? imageUrl,  File? localImage)?  $default,) {final _that = this;
switch (_that) {
case _QuotePart() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.classification,_that.imageUrl,_that.localImage);case _:
  return null;

}
}

}

/// @nodoc


class _QuotePart implements QuotePart {
  const _QuotePart({this.id, required this.name, required this.price, this.classification = 'standard', this.imageUrl, this.localImage});
  

@override final  int? id;
@override final  String name;
@override final  String price;
@override@JsonKey() final  String classification;
// 'standard', 'original', 'commercial'
@override final  String? imageUrl;
@override final  File? localImage;

/// Create a copy of QuotePart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuotePartCopyWith<_QuotePart> get copyWith => __$QuotePartCopyWithImpl<_QuotePart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuotePart&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.localImage, localImage) || other.localImage == localImage));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price,classification,imageUrl,localImage);

@override
String toString() {
  return 'QuotePart(id: $id, name: $name, price: $price, classification: $classification, imageUrl: $imageUrl, localImage: $localImage)';
}


}

/// @nodoc
abstract mixin class _$QuotePartCopyWith<$Res> implements $QuotePartCopyWith<$Res> {
  factory _$QuotePartCopyWith(_QuotePart value, $Res Function(_QuotePart) _then) = __$QuotePartCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, String price, String classification, String? imageUrl, File? localImage
});




}
/// @nodoc
class __$QuotePartCopyWithImpl<$Res>
    implements _$QuotePartCopyWith<$Res> {
  __$QuotePartCopyWithImpl(this._self, this._then);

  final _QuotePart _self;
  final $Res Function(_QuotePart) _then;

/// Create a copy of QuotePart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? price = null,Object? classification = null,Object? imageUrl = freezed,Object? localImage = freezed,}) {
  return _then(_QuotePart(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,localImage: freezed == localImage ? _self.localImage : localImage // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

// dart format on
