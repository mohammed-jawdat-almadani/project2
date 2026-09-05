// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchProfile value)?  fetchProfile,TResult Function( _Logout value)?  logout,TResult Function( _TogglePushNotifications value)?  togglePushNotifications,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchProfile() when fetchProfile != null:
return fetchProfile(_that);case _Logout() when logout != null:
return logout(_that);case _TogglePushNotifications() when togglePushNotifications != null:
return togglePushNotifications(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchProfile value)  fetchProfile,required TResult Function( _Logout value)  logout,required TResult Function( _TogglePushNotifications value)  togglePushNotifications,}){
final _that = this;
switch (_that) {
case _FetchProfile():
return fetchProfile(_that);case _Logout():
return logout(_that);case _TogglePushNotifications():
return togglePushNotifications(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchProfile value)?  fetchProfile,TResult? Function( _Logout value)?  logout,TResult? Function( _TogglePushNotifications value)?  togglePushNotifications,}){
final _that = this;
switch (_that) {
case _FetchProfile() when fetchProfile != null:
return fetchProfile(_that);case _Logout() when logout != null:
return logout(_that);case _TogglePushNotifications() when togglePushNotifications != null:
return togglePushNotifications(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchProfile,TResult Function()?  logout,TResult Function( bool enabled)?  togglePushNotifications,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchProfile() when fetchProfile != null:
return fetchProfile();case _Logout() when logout != null:
return logout();case _TogglePushNotifications() when togglePushNotifications != null:
return togglePushNotifications(_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchProfile,required TResult Function()  logout,required TResult Function( bool enabled)  togglePushNotifications,}) {final _that = this;
switch (_that) {
case _FetchProfile():
return fetchProfile();case _Logout():
return logout();case _TogglePushNotifications():
return togglePushNotifications(_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchProfile,TResult? Function()?  logout,TResult? Function( bool enabled)?  togglePushNotifications,}) {final _that = this;
switch (_that) {
case _FetchProfile() when fetchProfile != null:
return fetchProfile();case _Logout() when logout != null:
return logout();case _TogglePushNotifications() when togglePushNotifications != null:
return togglePushNotifications(_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _FetchProfile implements ProfileEvent {
  const _FetchProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.fetchProfile()';
}


}




/// @nodoc


class _Logout implements ProfileEvent {
  const _Logout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.logout()';
}


}




/// @nodoc


class _TogglePushNotifications implements ProfileEvent {
  const _TogglePushNotifications(this.enabled);
  

 final  bool enabled;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TogglePushNotificationsCopyWith<_TogglePushNotifications> get copyWith => __$TogglePushNotificationsCopyWithImpl<_TogglePushNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TogglePushNotifications&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString() {
  return 'ProfileEvent.togglePushNotifications(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$TogglePushNotificationsCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$TogglePushNotificationsCopyWith(_TogglePushNotifications value, $Res Function(_TogglePushNotifications) _then) = __$TogglePushNotificationsCopyWithImpl;
@useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class __$TogglePushNotificationsCopyWithImpl<$Res>
    implements _$TogglePushNotificationsCopyWith<$Res> {
  __$TogglePushNotificationsCopyWithImpl(this._self, this._then);

  final _TogglePushNotifications _self;
  final $Res Function(_TogglePushNotifications) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? enabled = null,}) {
  return _then(_TogglePushNotifications(
null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
