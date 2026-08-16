// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent()';
}


}

/// @nodoc
class $RegisterEventCopyWith<$Res>  {
$RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}


/// Adds pattern-matching-related methods to [RegisterEvent].
extension RegisterEventPatterns on RegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PhoneChanged value)?  phoneChanged,TResult Function( _Submit value)?  submit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneChanged() when phoneChanged != null:
return phoneChanged(_that);case _Submit() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PhoneChanged value)  phoneChanged,required TResult Function( _Submit value)  submit,}){
final _that = this;
switch (_that) {
case _PhoneChanged():
return phoneChanged(_that);case _Submit():
return submit(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PhoneChanged value)?  phoneChanged,TResult? Function( _Submit value)?  submit,}){
final _that = this;
switch (_that) {
case _PhoneChanged() when phoneChanged != null:
return phoneChanged(_that);case _Submit() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String phone)?  phoneChanged,TResult Function()?  submit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneChanged() when phoneChanged != null:
return phoneChanged(_that.phone);case _Submit() when submit != null:
return submit();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String phone)  phoneChanged,required TResult Function()  submit,}) {final _that = this;
switch (_that) {
case _PhoneChanged():
return phoneChanged(_that.phone);case _Submit():
return submit();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String phone)?  phoneChanged,TResult? Function()?  submit,}) {final _that = this;
switch (_that) {
case _PhoneChanged() when phoneChanged != null:
return phoneChanged(_that.phone);case _Submit() when submit != null:
return submit();case _:
  return null;

}
}

}

/// @nodoc


class _PhoneChanged implements RegisterEvent {
  const _PhoneChanged(this.phone);
  

 final  String phone;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneChangedCopyWith<_PhoneChanged> get copyWith => __$PhoneChangedCopyWithImpl<_PhoneChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneChanged&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'RegisterEvent.phoneChanged(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$PhoneChangedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory _$PhoneChangedCopyWith(_PhoneChanged value, $Res Function(_PhoneChanged) _then) = __$PhoneChangedCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class __$PhoneChangedCopyWithImpl<$Res>
    implements _$PhoneChangedCopyWith<$Res> {
  __$PhoneChangedCopyWithImpl(this._self, this._then);

  final _PhoneChanged _self;
  final $Res Function(_PhoneChanged) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_PhoneChanged(
null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Submit implements RegisterEvent {
  const _Submit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.submit()';
}


}




/// @nodoc
mixin _$RegisterState {

 PhoneInput get phone; FormzSubmissionStatus get status; bool get showErrors;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.showErrors, showErrors) || other.showErrors == showErrors));
}


@override
int get hashCode => Object.hash(runtimeType,phone,status,showErrors);

@override
String toString() {
  return 'RegisterState(phone: $phone, status: $status, showErrors: $showErrors)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 PhoneInput phone, FormzSubmissionStatus status, bool showErrors
});




}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? status = null,Object? showErrors = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as PhoneInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,showErrors: null == showErrors ? _self.showErrors : showErrors // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterState value)  $default,){
final _that = this;
switch (_that) {
case _RegisterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PhoneInput phone,  FormzSubmissionStatus status,  bool showErrors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.phone,_that.status,_that.showErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PhoneInput phone,  FormzSubmissionStatus status,  bool showErrors)  $default,) {final _that = this;
switch (_that) {
case _RegisterState():
return $default(_that.phone,_that.status,_that.showErrors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PhoneInput phone,  FormzSubmissionStatus status,  bool showErrors)?  $default,) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.phone,_that.status,_that.showErrors);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterState implements RegisterState {
  const _RegisterState({this.phone = const PhoneInput.pure(), this.status = FormzSubmissionStatus.initial, this.showErrors = false});
  

@override@JsonKey() final  PhoneInput phone;
@override@JsonKey() final  FormzSubmissionStatus status;
@override@JsonKey() final  bool showErrors;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.showErrors, showErrors) || other.showErrors == showErrors));
}


@override
int get hashCode => Object.hash(runtimeType,phone,status,showErrors);

@override
String toString() {
  return 'RegisterState(phone: $phone, status: $status, showErrors: $showErrors)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 PhoneInput phone, FormzSubmissionStatus status, bool showErrors
});




}
/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? status = null,Object? showErrors = null,}) {
  return _then(_RegisterState(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as PhoneInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,showErrors: null == showErrors ? _self.showErrors : showErrors // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
