// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PhoneChanged value)?  phoneChanged,TResult Function( _PasswordChanged value)?  passwordChanged,TResult Function( _Submit value)?  submit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneChanged() when phoneChanged != null:
return phoneChanged(_that);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _Submit() when submit != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PhoneChanged value)  phoneChanged,required TResult Function( _PasswordChanged value)  passwordChanged,required TResult Function( _Submit value)  submit,}){
final _that = this;
switch (_that) {
case _PhoneChanged():
return phoneChanged(_that);case _PasswordChanged():
return passwordChanged(_that);case _Submit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PhoneChanged value)?  phoneChanged,TResult? Function( _PasswordChanged value)?  passwordChanged,TResult? Function( _Submit value)?  submit,}){
final _that = this;
switch (_that) {
case _PhoneChanged() when phoneChanged != null:
return phoneChanged(_that);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _Submit() when submit != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String phone)?  phoneChanged,TResult Function( String password)?  passwordChanged,TResult Function()?  submit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneChanged() when phoneChanged != null:
return phoneChanged(_that.phone);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case _Submit() when submit != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String phone)  phoneChanged,required TResult Function( String password)  passwordChanged,required TResult Function()  submit,}) {final _that = this;
switch (_that) {
case _PhoneChanged():
return phoneChanged(_that.phone);case _PasswordChanged():
return passwordChanged(_that.password);case _Submit():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String phone)?  phoneChanged,TResult? Function( String password)?  passwordChanged,TResult? Function()?  submit,}) {final _that = this;
switch (_that) {
case _PhoneChanged() when phoneChanged != null:
return phoneChanged(_that.phone);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case _Submit() when submit != null:
return submit();case _:
  return null;

}
}

}

/// @nodoc


class _PhoneChanged implements LoginEvent {
  const _PhoneChanged(this.phone);
  

 final  String phone;

/// Create a copy of LoginEvent
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
  return 'LoginEvent.phoneChanged(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$PhoneChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
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

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_PhoneChanged(
null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PasswordChanged implements LoginEvent {
  const _PasswordChanged(this.password);
  

 final  String password;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordChangedCopyWith<_PasswordChanged> get copyWith => __$PasswordChangedCopyWithImpl<_PasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'LoginEvent.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class _$PasswordChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$PasswordChangedCopyWith(_PasswordChanged value, $Res Function(_PasswordChanged) _then) = __$PasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class __$PasswordChangedCopyWithImpl<$Res>
    implements _$PasswordChangedCopyWith<$Res> {
  __$PasswordChangedCopyWithImpl(this._self, this._then);

  final _PasswordChanged _self;
  final $Res Function(_PasswordChanged) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(_PasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Submit implements LoginEvent {
  const _Submit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.submit()';
}


}




/// @nodoc
mixin _$LoginState {

 PhoneInput get phone; PasswordInput get password; FormzSubmissionStatus get status; bool get showErrors;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.status, status) || other.status == status)&&(identical(other.showErrors, showErrors) || other.showErrors == showErrors));
}


@override
int get hashCode => Object.hash(runtimeType,phone,password,status,showErrors);

@override
String toString() {
  return 'LoginState(phone: $phone, password: $password, status: $status, showErrors: $showErrors)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 PhoneInput phone, PasswordInput password, FormzSubmissionStatus status, bool showErrors
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? password = null,Object? status = null,Object? showErrors = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as PhoneInput,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as PasswordInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,showErrors: null == showErrors ? _self.showErrors : showErrors // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginState value)  $default,){
final _that = this;
switch (_that) {
case _LoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PhoneInput phone,  PasswordInput password,  FormzSubmissionStatus status,  bool showErrors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.phone,_that.password,_that.status,_that.showErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PhoneInput phone,  PasswordInput password,  FormzSubmissionStatus status,  bool showErrors)  $default,) {final _that = this;
switch (_that) {
case _LoginState():
return $default(_that.phone,_that.password,_that.status,_that.showErrors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PhoneInput phone,  PasswordInput password,  FormzSubmissionStatus status,  bool showErrors)?  $default,) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.phone,_that.password,_that.status,_that.showErrors);case _:
  return null;

}
}

}

/// @nodoc


class _LoginState implements LoginState {
  const _LoginState({this.phone = const PhoneInput.pure(), this.password = const PasswordInput.pure(), this.status = FormzSubmissionStatus.initial, this.showErrors = false});
  

@override@JsonKey() final  PhoneInput phone;
@override@JsonKey() final  PasswordInput password;
@override@JsonKey() final  FormzSubmissionStatus status;
@override@JsonKey() final  bool showErrors;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.status, status) || other.status == status)&&(identical(other.showErrors, showErrors) || other.showErrors == showErrors));
}


@override
int get hashCode => Object.hash(runtimeType,phone,password,status,showErrors);

@override
String toString() {
  return 'LoginState(phone: $phone, password: $password, status: $status, showErrors: $showErrors)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 PhoneInput phone, PasswordInput password, FormzSubmissionStatus status, bool showErrors
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? password = null,Object? status = null,Object? showErrors = null,}) {
  return _then(_LoginState(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as PhoneInput,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as PasswordInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,showErrors: null == showErrors ? _self.showErrors : showErrors // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
