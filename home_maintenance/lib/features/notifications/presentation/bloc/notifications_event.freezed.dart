// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent()';
}


}

/// @nodoc
class $NotificationsEventCopyWith<$Res>  {
$NotificationsEventCopyWith(NotificationsEvent _, $Res Function(NotificationsEvent) __);
}


/// Adds pattern-matching-related methods to [NotificationsEvent].
extension NotificationsEventPatterns on NotificationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetch value)?  fetch,TResult Function( _FilterChanged value)?  filterChanged,TResult Function( _FetchUnreadCount value)?  fetchUnreadCount,TResult Function( _MarkRead value)?  markRead,TResult Function( _MarkAllRead value)?  markAllRead,TResult Function( _Refresh value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _FetchUnreadCount() when fetchUnreadCount != null:
return fetchUnreadCount(_that);case _MarkRead() when markRead != null:
return markRead(_that);case _MarkAllRead() when markAllRead != null:
return markAllRead(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetch value)  fetch,required TResult Function( _FilterChanged value)  filterChanged,required TResult Function( _FetchUnreadCount value)  fetchUnreadCount,required TResult Function( _MarkRead value)  markRead,required TResult Function( _MarkAllRead value)  markAllRead,required TResult Function( _Refresh value)  refresh,}){
final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that);case _FilterChanged():
return filterChanged(_that);case _FetchUnreadCount():
return fetchUnreadCount(_that);case _MarkRead():
return markRead(_that);case _MarkAllRead():
return markAllRead(_that);case _Refresh():
return refresh(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetch value)?  fetch,TResult? Function( _FilterChanged value)?  filterChanged,TResult? Function( _FetchUnreadCount value)?  fetchUnreadCount,TResult? Function( _MarkRead value)?  markRead,TResult? Function( _MarkAllRead value)?  markAllRead,TResult? Function( _Refresh value)?  refresh,}){
final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _FetchUnreadCount() when fetchUnreadCount != null:
return fetchUnreadCount(_that);case _MarkRead() when markRead != null:
return markRead(_that);case _MarkAllRead() when markAllRead != null:
return markAllRead(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? status,  int page)?  fetch,TResult Function( String? status)?  filterChanged,TResult Function()?  fetchUnreadCount,TResult Function( int notificationId)?  markRead,TResult Function()?  markAllRead,TResult Function()?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.status,_that.page);case _FilterChanged() when filterChanged != null:
return filterChanged(_that.status);case _FetchUnreadCount() when fetchUnreadCount != null:
return fetchUnreadCount();case _MarkRead() when markRead != null:
return markRead(_that.notificationId);case _MarkAllRead() when markAllRead != null:
return markAllRead();case _Refresh() when refresh != null:
return refresh();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? status,  int page)  fetch,required TResult Function( String? status)  filterChanged,required TResult Function()  fetchUnreadCount,required TResult Function( int notificationId)  markRead,required TResult Function()  markAllRead,required TResult Function()  refresh,}) {final _that = this;
switch (_that) {
case _Fetch():
return fetch(_that.status,_that.page);case _FilterChanged():
return filterChanged(_that.status);case _FetchUnreadCount():
return fetchUnreadCount();case _MarkRead():
return markRead(_that.notificationId);case _MarkAllRead():
return markAllRead();case _Refresh():
return refresh();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? status,  int page)?  fetch,TResult? Function( String? status)?  filterChanged,TResult? Function()?  fetchUnreadCount,TResult? Function( int notificationId)?  markRead,TResult? Function()?  markAllRead,TResult? Function()?  refresh,}) {final _that = this;
switch (_that) {
case _Fetch() when fetch != null:
return fetch(_that.status,_that.page);case _FilterChanged() when filterChanged != null:
return filterChanged(_that.status);case _FetchUnreadCount() when fetchUnreadCount != null:
return fetchUnreadCount();case _MarkRead() when markRead != null:
return markRead(_that.notificationId);case _MarkAllRead() when markAllRead != null:
return markAllRead();case _Refresh() when refresh != null:
return refresh();case _:
  return null;

}
}

}

/// @nodoc


class _Fetch implements NotificationsEvent {
  const _Fetch({this.status, this.page = 1});
  

 final  String? status;
@JsonKey() final  int page;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCopyWith<_Fetch> get copyWith => __$FetchCopyWithImpl<_Fetch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch&&(identical(other.status, status) || other.status == status)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,status,page);

@override
String toString() {
  return 'NotificationsEvent.fetch(status: $status, page: $page)';
}


}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) = __$FetchCopyWithImpl;
@useResult
$Res call({
 String? status, int page
});




}
/// @nodoc
class __$FetchCopyWithImpl<$Res>
    implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? page = null,}) {
  return _then(_Fetch(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FilterChanged implements NotificationsEvent {
  const _FilterChanged(this.status);
  

 final  String? status;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterChangedCopyWith<_FilterChanged> get copyWith => __$FilterChangedCopyWithImpl<_FilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterChanged&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'NotificationsEvent.filterChanged(status: $status)';
}


}

/// @nodoc
abstract mixin class _$FilterChangedCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory _$FilterChangedCopyWith(_FilterChanged value, $Res Function(_FilterChanged) _then) = __$FilterChangedCopyWithImpl;
@useResult
$Res call({
 String? status
});




}
/// @nodoc
class __$FilterChangedCopyWithImpl<$Res>
    implements _$FilterChangedCopyWith<$Res> {
  __$FilterChangedCopyWithImpl(this._self, this._then);

  final _FilterChanged _self;
  final $Res Function(_FilterChanged) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(_FilterChanged(
freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _FetchUnreadCount implements NotificationsEvent {
  const _FetchUnreadCount();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchUnreadCount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent.fetchUnreadCount()';
}


}




/// @nodoc


class _MarkRead implements NotificationsEvent {
  const _MarkRead(this.notificationId);
  

 final  int notificationId;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkReadCopyWith<_MarkRead> get copyWith => __$MarkReadCopyWithImpl<_MarkRead>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkRead&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}


@override
int get hashCode => Object.hash(runtimeType,notificationId);

@override
String toString() {
  return 'NotificationsEvent.markRead(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class _$MarkReadCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory _$MarkReadCopyWith(_MarkRead value, $Res Function(_MarkRead) _then) = __$MarkReadCopyWithImpl;
@useResult
$Res call({
 int notificationId
});




}
/// @nodoc
class __$MarkReadCopyWithImpl<$Res>
    implements _$MarkReadCopyWith<$Res> {
  __$MarkReadCopyWithImpl(this._self, this._then);

  final _MarkRead _self;
  final $Res Function(_MarkRead) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationId = null,}) {
  return _then(_MarkRead(
null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _MarkAllRead implements NotificationsEvent {
  const _MarkAllRead();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAllRead);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent.markAllRead()';
}


}




/// @nodoc


class _Refresh implements NotificationsEvent {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent.refresh()';
}


}




// dart format on
