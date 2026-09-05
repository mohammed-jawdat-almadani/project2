// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// Adds pattern-matching-related methods to [ChatEvent].
extension ChatEventPatterns on ChatEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Poll value)?  poll,TResult Function( _SendMessage value)?  sendMessage,TResult Function( _MarkRead value)?  markRead,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Poll() when poll != null:
return poll(_that);case _SendMessage() when sendMessage != null:
return sendMessage(_that);case _MarkRead() when markRead != null:
return markRead(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Poll value)  poll,required TResult Function( _SendMessage value)  sendMessage,required TResult Function( _MarkRead value)  markRead,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Poll():
return poll(_that);case _SendMessage():
return sendMessage(_that);case _MarkRead():
return markRead(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Poll value)?  poll,TResult? Function( _SendMessage value)?  sendMessage,TResult? Function( _MarkRead value)?  markRead,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Poll() when poll != null:
return poll(_that);case _SendMessage() when sendMessage != null:
return sendMessage(_that);case _MarkRead() when markRead != null:
return markRead(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int orderId)?  init,TResult Function()?  poll,TResult Function( String? messageText,  String? imagePath)?  sendMessage,TResult Function()?  markRead,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.orderId);case _Poll() when poll != null:
return poll();case _SendMessage() when sendMessage != null:
return sendMessage(_that.messageText,_that.imagePath);case _MarkRead() when markRead != null:
return markRead();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int orderId)  init,required TResult Function()  poll,required TResult Function( String? messageText,  String? imagePath)  sendMessage,required TResult Function()  markRead,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.orderId);case _Poll():
return poll();case _SendMessage():
return sendMessage(_that.messageText,_that.imagePath);case _MarkRead():
return markRead();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int orderId)?  init,TResult? Function()?  poll,TResult? Function( String? messageText,  String? imagePath)?  sendMessage,TResult? Function()?  markRead,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.orderId);case _Poll() when poll != null:
return poll();case _SendMessage() when sendMessage != null:
return sendMessage(_that.messageText,_that.imagePath);case _MarkRead() when markRead != null:
return markRead();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements ChatEvent {
  const _Init(this.orderId);
  

 final  int orderId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'ChatEvent.init(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@useResult
$Res call({
 int orderId
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(_Init(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Poll implements ChatEvent {
  const _Poll();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Poll);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.poll()';
}


}




/// @nodoc


class _SendMessage implements ChatEvent {
  const _SendMessage({this.messageText, this.imagePath});
  

 final  String? messageText;
 final  String? imagePath;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageCopyWith<_SendMessage> get copyWith => __$SendMessageCopyWithImpl<_SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessage&&(identical(other.messageText, messageText) || other.messageText == messageText)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,messageText,imagePath);

@override
String toString() {
  return 'ChatEvent.sendMessage(messageText: $messageText, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class _$SendMessageCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$SendMessageCopyWith(_SendMessage value, $Res Function(_SendMessage) _then) = __$SendMessageCopyWithImpl;
@useResult
$Res call({
 String? messageText, String? imagePath
});




}
/// @nodoc
class __$SendMessageCopyWithImpl<$Res>
    implements _$SendMessageCopyWith<$Res> {
  __$SendMessageCopyWithImpl(this._self, this._then);

  final _SendMessage _self;
  final $Res Function(_SendMessage) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageText = freezed,Object? imagePath = freezed,}) {
  return _then(_SendMessage(
messageText: freezed == messageText ? _self.messageText : messageText // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _MarkRead implements ChatEvent {
  const _MarkRead();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkRead);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.markRead()';
}


}




// dart format on
