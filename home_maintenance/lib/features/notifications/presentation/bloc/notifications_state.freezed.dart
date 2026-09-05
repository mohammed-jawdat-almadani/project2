// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsState {

 bool get isLoading; bool get isMarkingAllRead; List<NotificationItem> get notifications; int get unreadCount; String? get currentFilter;// null for all, 'unread' for unread
 String? get errorMessage; String? get successMessage;
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsStateCopyWith<NotificationsState> get copyWith => _$NotificationsStateCopyWithImpl<NotificationsState>(this as NotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isMarkingAllRead, isMarkingAllRead) || other.isMarkingAllRead == isMarkingAllRead)&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isMarkingAllRead,const DeepCollectionEquality().hash(notifications),unreadCount,currentFilter,errorMessage,successMessage);

@override
String toString() {
  return 'NotificationsState(isLoading: $isLoading, isMarkingAllRead: $isMarkingAllRead, notifications: $notifications, unreadCount: $unreadCount, currentFilter: $currentFilter, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res>  {
  factory $NotificationsStateCopyWith(NotificationsState value, $Res Function(NotificationsState) _then) = _$NotificationsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isMarkingAllRead, List<NotificationItem> notifications, int unreadCount, String? currentFilter, String? errorMessage, String? successMessage
});




}
/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isMarkingAllRead = null,Object? notifications = null,Object? unreadCount = null,Object? currentFilter = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isMarkingAllRead: null == isMarkingAllRead ? _self.isMarkingAllRead : isMarkingAllRead // ignore: cast_nullable_to_non_nullable
as bool,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationItem>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isMarkingAllRead,  List<NotificationItem> notifications,  int unreadCount,  String? currentFilter,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.isLoading,_that.isMarkingAllRead,_that.notifications,_that.unreadCount,_that.currentFilter,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isMarkingAllRead,  List<NotificationItem> notifications,  int unreadCount,  String? currentFilter,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _NotificationsState():
return $default(_that.isLoading,_that.isMarkingAllRead,_that.notifications,_that.unreadCount,_that.currentFilter,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isMarkingAllRead,  List<NotificationItem> notifications,  int unreadCount,  String? currentFilter,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.isLoading,_that.isMarkingAllRead,_that.notifications,_that.unreadCount,_that.currentFilter,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsState implements NotificationsState {
  const _NotificationsState({this.isLoading = false, this.isMarkingAllRead = false, final  List<NotificationItem> notifications = const [], this.unreadCount = 0, this.currentFilter, this.errorMessage, this.successMessage}): _notifications = notifications;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isMarkingAllRead;
 final  List<NotificationItem> _notifications;
@override@JsonKey() List<NotificationItem> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override@JsonKey() final  int unreadCount;
@override final  String? currentFilter;
// null for all, 'unread' for unread
@override final  String? errorMessage;
@override final  String? successMessage;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsStateCopyWith<_NotificationsState> get copyWith => __$NotificationsStateCopyWithImpl<_NotificationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isMarkingAllRead, isMarkingAllRead) || other.isMarkingAllRead == isMarkingAllRead)&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isMarkingAllRead,const DeepCollectionEquality().hash(_notifications),unreadCount,currentFilter,errorMessage,successMessage);

@override
String toString() {
  return 'NotificationsState(isLoading: $isLoading, isMarkingAllRead: $isMarkingAllRead, notifications: $notifications, unreadCount: $unreadCount, currentFilter: $currentFilter, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$NotificationsStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsStateCopyWith(_NotificationsState value, $Res Function(_NotificationsState) _then) = __$NotificationsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isMarkingAllRead, List<NotificationItem> notifications, int unreadCount, String? currentFilter, String? errorMessage, String? successMessage
});




}
/// @nodoc
class __$NotificationsStateCopyWithImpl<$Res>
    implements _$NotificationsStateCopyWith<$Res> {
  __$NotificationsStateCopyWithImpl(this._self, this._then);

  final _NotificationsState _self;
  final $Res Function(_NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isMarkingAllRead = null,Object? notifications = null,Object? unreadCount = null,Object? currentFilter = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_NotificationsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isMarkingAllRead: null == isMarkingAllRead ? _self.isMarkingAllRead : isMarkingAllRead // ignore: cast_nullable_to_non_nullable
as bool,notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationItem>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
