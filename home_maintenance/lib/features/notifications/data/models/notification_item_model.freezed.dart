// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationItemModel {

 int get id; String get category; String get title; String get body; Map<String, dynamic>? get target;@JsonKey(name: 'is_read') bool get isRead;@JsonKey(name: 'read_at') String? get readAt;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of NotificationItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationItemModelCopyWith<NotificationItemModel> get copyWith => _$NotificationItemModelCopyWithImpl<NotificationItemModel>(this as NotificationItemModel, _$identity);

  /// Serializes this NotificationItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.target, target)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,title,body,const DeepCollectionEquality().hash(target),isRead,readAt,createdAt);

@override
String toString() {
  return 'NotificationItemModel(id: $id, category: $category, title: $title, body: $body, target: $target, isRead: $isRead, readAt: $readAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $NotificationItemModelCopyWith<$Res>  {
  factory $NotificationItemModelCopyWith(NotificationItemModel value, $Res Function(NotificationItemModel) _then) = _$NotificationItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String category, String title, String body, Map<String, dynamic>? target,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'read_at') String? readAt,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$NotificationItemModelCopyWithImpl<$Res>
    implements $NotificationItemModelCopyWith<$Res> {
  _$NotificationItemModelCopyWithImpl(this._self, this._then);

  final NotificationItemModel _self;
  final $Res Function(NotificationItemModel) _then;

/// Create a copy of NotificationItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? title = null,Object? body = null,Object? target = freezed,Object? isRead = null,Object? readAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationItemModel].
extension NotificationItemModelPatterns on NotificationItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationItemModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String category,  String title,  String body,  Map<String, dynamic>? target, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'read_at')  String? readAt, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationItemModel() when $default != null:
return $default(_that.id,_that.category,_that.title,_that.body,_that.target,_that.isRead,_that.readAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String category,  String title,  String body,  Map<String, dynamic>? target, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'read_at')  String? readAt, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationItemModel():
return $default(_that.id,_that.category,_that.title,_that.body,_that.target,_that.isRead,_that.readAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String category,  String title,  String body,  Map<String, dynamic>? target, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'read_at')  String? readAt, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationItemModel() when $default != null:
return $default(_that.id,_that.category,_that.title,_that.body,_that.target,_that.isRead,_that.readAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationItemModel extends NotificationItemModel {
  const _NotificationItemModel({required this.id, this.category = 'orders', required this.title, required this.body, final  Map<String, dynamic>? target, @JsonKey(name: 'is_read') this.isRead = false, @JsonKey(name: 'read_at') this.readAt, @JsonKey(name: 'created_at') this.createdAt}): _target = target,super._();
  factory _NotificationItemModel.fromJson(Map<String, dynamic> json) => _$NotificationItemModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String category;
@override final  String title;
@override final  String body;
 final  Map<String, dynamic>? _target;
@override Map<String, dynamic>? get target {
  final value = _target;
  if (value == null) return null;
  if (_target is EqualUnmodifiableMapView) return _target;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'is_read') final  bool isRead;
@override@JsonKey(name: 'read_at') final  String? readAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of NotificationItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationItemModelCopyWith<_NotificationItemModel> get copyWith => __$NotificationItemModelCopyWithImpl<_NotificationItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other._target, _target)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,title,body,const DeepCollectionEquality().hash(_target),isRead,readAt,createdAt);

@override
String toString() {
  return 'NotificationItemModel(id: $id, category: $category, title: $title, body: $body, target: $target, isRead: $isRead, readAt: $readAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationItemModelCopyWith<$Res> implements $NotificationItemModelCopyWith<$Res> {
  factory _$NotificationItemModelCopyWith(_NotificationItemModel value, $Res Function(_NotificationItemModel) _then) = __$NotificationItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String category, String title, String body, Map<String, dynamic>? target,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'read_at') String? readAt,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$NotificationItemModelCopyWithImpl<$Res>
    implements _$NotificationItemModelCopyWith<$Res> {
  __$NotificationItemModelCopyWithImpl(this._self, this._then);

  final _NotificationItemModel _self;
  final $Res Function(_NotificationItemModel) _then;

/// Create a copy of NotificationItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? title = null,Object? body = null,Object? target = freezed,Object? isRead = null,Object? readAt = freezed,Object? createdAt = freezed,}) {
  return _then(_NotificationItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,target: freezed == target ? _self._target : target // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
