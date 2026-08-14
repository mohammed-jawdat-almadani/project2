// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {

 String get phone;
/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEventCopyWith<AuthEvent> get copyWith => _$AuthEventCopyWithImpl<AuthEvent>(this as AuthEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'AuthEvent(phone: $phone)';
}


}

/// @nodoc
abstract mixin class $AuthEventCopyWith<$Res>  {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) _then) = _$AuthEventCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._self, this._then);

  final AuthEvent _self;
  final $Res Function(AuthEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Login value)?  login,TResult Function( _RegisterStart value)?  registerStart,TResult Function( _ForgotPassword value)?  forgotPassword,TResult Function( _VerifyOtp value)?  verifyOtp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that);case _RegisterStart() when registerStart != null:
return registerStart(_that);case _ForgotPassword() when forgotPassword != null:
return forgotPassword(_that);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Login value)  login,required TResult Function( _RegisterStart value)  registerStart,required TResult Function( _ForgotPassword value)  forgotPassword,required TResult Function( _VerifyOtp value)  verifyOtp,}){
final _that = this;
switch (_that) {
case _Login():
return login(_that);case _RegisterStart():
return registerStart(_that);case _ForgotPassword():
return forgotPassword(_that);case _VerifyOtp():
return verifyOtp(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Login value)?  login,TResult? Function( _RegisterStart value)?  registerStart,TResult? Function( _ForgotPassword value)?  forgotPassword,TResult? Function( _VerifyOtp value)?  verifyOtp,}){
final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that);case _RegisterStart() when registerStart != null:
return registerStart(_that);case _ForgotPassword() when forgotPassword != null:
return forgotPassword(_that);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String phone,  String password)?  login,TResult Function( String phone)?  registerStart,TResult Function( String phone)?  forgotPassword,TResult Function( String phone,  String code)?  verifyOtp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that.phone,_that.password);case _RegisterStart() when registerStart != null:
return registerStart(_that.phone);case _ForgotPassword() when forgotPassword != null:
return forgotPassword(_that.phone);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.phone,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String phone,  String password)  login,required TResult Function( String phone)  registerStart,required TResult Function( String phone)  forgotPassword,required TResult Function( String phone,  String code)  verifyOtp,}) {final _that = this;
switch (_that) {
case _Login():
return login(_that.phone,_that.password);case _RegisterStart():
return registerStart(_that.phone);case _ForgotPassword():
return forgotPassword(_that.phone);case _VerifyOtp():
return verifyOtp(_that.phone,_that.code);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String phone,  String password)?  login,TResult? Function( String phone)?  registerStart,TResult? Function( String phone)?  forgotPassword,TResult? Function( String phone,  String code)?  verifyOtp,}) {final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that.phone,_that.password);case _RegisterStart() when registerStart != null:
return registerStart(_that.phone);case _ForgotPassword() when forgotPassword != null:
return forgotPassword(_that.phone);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.phone,_that.code);case _:
  return null;

}
}

}

/// @nodoc


class _Login implements AuthEvent {
  const _Login({required this.phone, required this.password});
  

@override final  String phone;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginCopyWith<_Login> get copyWith => __$LoginCopyWithImpl<_Login>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Login&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,phone,password);

@override
String toString() {
  return 'AuthEvent.login(phone: $phone, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) _then) = __$LoginCopyWithImpl;
@override @useResult
$Res call({
 String phone, String password
});




}
/// @nodoc
class __$LoginCopyWithImpl<$Res>
    implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(this._self, this._then);

  final _Login _self;
  final $Res Function(_Login) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? password = null,}) {
  return _then(_Login(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RegisterStart implements AuthEvent {
  const _RegisterStart({required this.phone});
  

@override final  String phone;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStartCopyWith<_RegisterStart> get copyWith => __$RegisterStartCopyWithImpl<_RegisterStart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterStart&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'AuthEvent.registerStart(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$RegisterStartCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RegisterStartCopyWith(_RegisterStart value, $Res Function(_RegisterStart) _then) = __$RegisterStartCopyWithImpl;
@override @useResult
$Res call({
 String phone
});




}
/// @nodoc
class __$RegisterStartCopyWithImpl<$Res>
    implements _$RegisterStartCopyWith<$Res> {
  __$RegisterStartCopyWithImpl(this._self, this._then);

  final _RegisterStart _self;
  final $Res Function(_RegisterStart) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_RegisterStart(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ForgotPassword implements AuthEvent {
  const _ForgotPassword({required this.phone});
  

@override final  String phone;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordCopyWith<_ForgotPassword> get copyWith => __$ForgotPasswordCopyWithImpl<_ForgotPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPassword&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'AuthEvent.forgotPassword(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$ForgotPasswordCopyWith(_ForgotPassword value, $Res Function(_ForgotPassword) _then) = __$ForgotPasswordCopyWithImpl;
@override @useResult
$Res call({
 String phone
});




}
/// @nodoc
class __$ForgotPasswordCopyWithImpl<$Res>
    implements _$ForgotPasswordCopyWith<$Res> {
  __$ForgotPasswordCopyWithImpl(this._self, this._then);

  final _ForgotPassword _self;
  final $Res Function(_ForgotPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_ForgotPassword(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _VerifyOtp implements AuthEvent {
  const _VerifyOtp({required this.phone, required this.code});
  

@override final  String phone;
 final  String code;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpCopyWith<_VerifyOtp> get copyWith => __$VerifyOtpCopyWithImpl<_VerifyOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtp&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,phone,code);

@override
String toString() {
  return 'AuthEvent.verifyOtp(phone: $phone, code: $code)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$VerifyOtpCopyWith(_VerifyOtp value, $Res Function(_VerifyOtp) _then) = __$VerifyOtpCopyWithImpl;
@override @useResult
$Res call({
 String phone, String code
});




}
/// @nodoc
class __$VerifyOtpCopyWithImpl<$Res>
    implements _$VerifyOtpCopyWith<$Res> {
  __$VerifyOtpCopyWithImpl(this._self, this._then);

  final _VerifyOtp _self;
  final $Res Function(_VerifyOtp) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? code = null,}) {
  return _then(_VerifyOtp(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Authenticated value)?  authenticated,TResult Function( _PasswordResetEmailSent value)?  passwordResetEmailSent,TResult Function( _OtpSent value)?  otpSent,TResult Function( _OtpVerified value)?  otpVerified,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _PasswordResetEmailSent() when passwordResetEmailSent != null:
return passwordResetEmailSent(_that);case _OtpSent() when otpSent != null:
return otpSent(_that);case _OtpVerified() when otpVerified != null:
return otpVerified(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Authenticated value)  authenticated,required TResult Function( _PasswordResetEmailSent value)  passwordResetEmailSent,required TResult Function( _OtpSent value)  otpSent,required TResult Function( _OtpVerified value)  otpVerified,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Authenticated():
return authenticated(_that);case _PasswordResetEmailSent():
return passwordResetEmailSent(_that);case _OtpSent():
return otpSent(_that);case _OtpVerified():
return otpVerified(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Authenticated value)?  authenticated,TResult? Function( _PasswordResetEmailSent value)?  passwordResetEmailSent,TResult? Function( _OtpSent value)?  otpSent,TResult? Function( _OtpVerified value)?  otpVerified,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _PasswordResetEmailSent() when passwordResetEmailSent != null:
return passwordResetEmailSent(_that);case _OtpSent() when otpSent != null:
return otpSent(_that);case _OtpVerified() when otpVerified != null:
return otpVerified(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( User user)?  authenticated,TResult Function()?  passwordResetEmailSent,TResult Function( String? debugCode)?  otpSent,TResult Function( String ticket)?  otpVerified,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Authenticated() when authenticated != null:
return authenticated(_that.user);case _PasswordResetEmailSent() when passwordResetEmailSent != null:
return passwordResetEmailSent();case _OtpSent() when otpSent != null:
return otpSent(_that.debugCode);case _OtpVerified() when otpVerified != null:
return otpVerified(_that.ticket);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( User user)  authenticated,required TResult Function()  passwordResetEmailSent,required TResult Function( String? debugCode)  otpSent,required TResult Function( String ticket)  otpVerified,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Authenticated():
return authenticated(_that.user);case _PasswordResetEmailSent():
return passwordResetEmailSent();case _OtpSent():
return otpSent(_that.debugCode);case _OtpVerified():
return otpVerified(_that.ticket);case _Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( User user)?  authenticated,TResult? Function()?  passwordResetEmailSent,TResult? Function( String? debugCode)?  otpSent,TResult? Function( String ticket)?  otpVerified,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Authenticated() when authenticated != null:
return authenticated(_that.user);case _PasswordResetEmailSent() when passwordResetEmailSent != null:
return passwordResetEmailSent();case _OtpSent() when otpSent != null:
return otpSent(_that.debugCode);case _OtpVerified() when otpVerified != null:
return otpVerified(_that.ticket);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _Loading implements AuthState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _Authenticated implements AuthState {
  const _Authenticated(this.user);
  

 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticatedCopyWith<_Authenticated> get copyWith => __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authenticated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.authenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(_Authenticated value, $Res Function(_Authenticated) _then) = __$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(this._self, this._then);

  final _Authenticated _self;
  final $Res Function(_Authenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Authenticated(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _PasswordResetEmailSent implements AuthState {
  const _PasswordResetEmailSent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordResetEmailSent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.passwordResetEmailSent()';
}


}




/// @nodoc


class _OtpSent implements AuthState {
  const _OtpSent([this.debugCode]);
  

 final  String? debugCode;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpSentCopyWith<_OtpSent> get copyWith => __$OtpSentCopyWithImpl<_OtpSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpSent&&(identical(other.debugCode, debugCode) || other.debugCode == debugCode));
}


@override
int get hashCode => Object.hash(runtimeType,debugCode);

@override
String toString() {
  return 'AuthState.otpSent(debugCode: $debugCode)';
}


}

/// @nodoc
abstract mixin class _$OtpSentCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$OtpSentCopyWith(_OtpSent value, $Res Function(_OtpSent) _then) = __$OtpSentCopyWithImpl;
@useResult
$Res call({
 String? debugCode
});




}
/// @nodoc
class __$OtpSentCopyWithImpl<$Res>
    implements _$OtpSentCopyWith<$Res> {
  __$OtpSentCopyWithImpl(this._self, this._then);

  final _OtpSent _self;
  final $Res Function(_OtpSent) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? debugCode = freezed,}) {
  return _then(_OtpSent(
freezed == debugCode ? _self.debugCode : debugCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _OtpVerified implements AuthState {
  const _OtpVerified(this.ticket);
  

 final  String ticket;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpVerifiedCopyWith<_OtpVerified> get copyWith => __$OtpVerifiedCopyWithImpl<_OtpVerified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpVerified&&(identical(other.ticket, ticket) || other.ticket == ticket));
}


@override
int get hashCode => Object.hash(runtimeType,ticket);

@override
String toString() {
  return 'AuthState.otpVerified(ticket: $ticket)';
}


}

/// @nodoc
abstract mixin class _$OtpVerifiedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$OtpVerifiedCopyWith(_OtpVerified value, $Res Function(_OtpVerified) _then) = __$OtpVerifiedCopyWithImpl;
@useResult
$Res call({
 String ticket
});




}
/// @nodoc
class __$OtpVerifiedCopyWithImpl<$Res>
    implements _$OtpVerifiedCopyWith<$Res> {
  __$OtpVerifiedCopyWithImpl(this._self, this._then);

  final _OtpVerified _self;
  final $Res Function(_OtpVerified) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ticket = null,}) {
  return _then(_OtpVerified(
null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements AuthState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
