// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_photo_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderPhotoItem {

 int get id; String get kind; String get url;
/// Create a copy of OrderPhotoItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPhotoItemCopyWith<OrderPhotoItem> get copyWith => _$OrderPhotoItemCopyWithImpl<OrderPhotoItem>(this as OrderPhotoItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPhotoItem&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,id,kind,url);

@override
String toString() {
  return 'OrderPhotoItem(id: $id, kind: $kind, url: $url)';
}


}

/// @nodoc
abstract mixin class $OrderPhotoItemCopyWith<$Res>  {
  factory $OrderPhotoItemCopyWith(OrderPhotoItem value, $Res Function(OrderPhotoItem) _then) = _$OrderPhotoItemCopyWithImpl;
@useResult
$Res call({
 int id, String kind, String url
});




}
/// @nodoc
class _$OrderPhotoItemCopyWithImpl<$Res>
    implements $OrderPhotoItemCopyWith<$Res> {
  _$OrderPhotoItemCopyWithImpl(this._self, this._then);

  final OrderPhotoItem _self;
  final $Res Function(OrderPhotoItem) _then;

/// Create a copy of OrderPhotoItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderPhotoItem].
extension OrderPhotoItemPatterns on OrderPhotoItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPhotoItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPhotoItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPhotoItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderPhotoItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPhotoItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPhotoItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String kind,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPhotoItem() when $default != null:
return $default(_that.id,_that.kind,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String kind,  String url)  $default,) {final _that = this;
switch (_that) {
case _OrderPhotoItem():
return $default(_that.id,_that.kind,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String kind,  String url)?  $default,) {final _that = this;
switch (_that) {
case _OrderPhotoItem() when $default != null:
return $default(_that.id,_that.kind,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _OrderPhotoItem implements OrderPhotoItem {
  const _OrderPhotoItem({required this.id, this.kind = 'flaw', required this.url});
  

@override final  int id;
@override@JsonKey() final  String kind;
@override final  String url;

/// Create a copy of OrderPhotoItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPhotoItemCopyWith<_OrderPhotoItem> get copyWith => __$OrderPhotoItemCopyWithImpl<_OrderPhotoItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPhotoItem&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,id,kind,url);

@override
String toString() {
  return 'OrderPhotoItem(id: $id, kind: $kind, url: $url)';
}


}

/// @nodoc
abstract mixin class _$OrderPhotoItemCopyWith<$Res> implements $OrderPhotoItemCopyWith<$Res> {
  factory _$OrderPhotoItemCopyWith(_OrderPhotoItem value, $Res Function(_OrderPhotoItem) _then) = __$OrderPhotoItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String kind, String url
});




}
/// @nodoc
class __$OrderPhotoItemCopyWithImpl<$Res>
    implements _$OrderPhotoItemCopyWith<$Res> {
  __$OrderPhotoItemCopyWithImpl(this._self, this._then);

  final _OrderPhotoItem _self;
  final $Res Function(_OrderPhotoItem) _then;

/// Create a copy of OrderPhotoItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? url = null,}) {
  return _then(_OrderPhotoItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
