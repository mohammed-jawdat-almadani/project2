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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Login value)?  login,TResult Function( _RegisterStart value)?  registerStart,TResult Function( _ForgotPassword value)?  forgotPassword,TResult Function( _VerifyOtp value)?  verifyOtp,TResult Function( _LoadCategories value)?  loadCategories,TResult Function( _CheckAuthStatus value)?  checkAuthStatus,TResult Function( _RegisterProviderSubmit value)?  registerProviderSubmit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that);case _RegisterStart() when registerStart != null:
return registerStart(_that);case _ForgotPassword() when forgotPassword != null:
return forgotPassword(_that);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _LoadCategories() when loadCategories != null:
return loadCategories(_that);case _CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case _RegisterProviderSubmit() when registerProviderSubmit != null:
return registerProviderSubmit(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Login value)  login,required TResult Function( _RegisterStart value)  registerStart,required TResult Function( _ForgotPassword value)  forgotPassword,required TResult Function( _VerifyOtp value)  verifyOtp,required TResult Function( _LoadCategories value)  loadCategories,required TResult Function( _CheckAuthStatus value)  checkAuthStatus,required TResult Function( _RegisterProviderSubmit value)  registerProviderSubmit,}){
final _that = this;
switch (_that) {
case _Login():
return login(_that);case _RegisterStart():
return registerStart(_that);case _ForgotPassword():
return forgotPassword(_that);case _VerifyOtp():
return verifyOtp(_that);case _LoadCategories():
return loadCategories(_that);case _CheckAuthStatus():
return checkAuthStatus(_that);case _RegisterProviderSubmit():
return registerProviderSubmit(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Login value)?  login,TResult? Function( _RegisterStart value)?  registerStart,TResult? Function( _ForgotPassword value)?  forgotPassword,TResult? Function( _VerifyOtp value)?  verifyOtp,TResult? Function( _LoadCategories value)?  loadCategories,TResult? Function( _CheckAuthStatus value)?  checkAuthStatus,TResult? Function( _RegisterProviderSubmit value)?  registerProviderSubmit,}){
final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that);case _RegisterStart() when registerStart != null:
return registerStart(_that);case _ForgotPassword() when forgotPassword != null:
return forgotPassword(_that);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case _LoadCategories() when loadCategories != null:
return loadCategories(_that);case _CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case _RegisterProviderSubmit() when registerProviderSubmit != null:
return registerProviderSubmit(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String phone,  String password)?  login,TResult Function( String phone)?  registerStart,TResult Function( String phone)?  forgotPassword,TResult Function( String phone,  String code)?  verifyOtp,TResult Function()?  loadCategories,TResult Function()?  checkAuthStatus,TResult Function( String phone,  String ticket,  String firstName,  String lastName,  List<int> serviceCategoryIds,  String password,  String passwordConfirmation,  String? selfiePath,  String? idFrontPath,  String? idBackPath)?  registerProviderSubmit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that.phone,_that.password);case _RegisterStart() when registerStart != null:
return registerStart(_that.phone);case _ForgotPassword() when forgotPassword != null:
return forgotPassword(_that.phone);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.phone,_that.code);case _LoadCategories() when loadCategories != null:
return loadCategories();case _CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case _RegisterProviderSubmit() when registerProviderSubmit != null:
return registerProviderSubmit(_that.phone,_that.ticket,_that.firstName,_that.lastName,_that.serviceCategoryIds,_that.password,_that.passwordConfirmation,_that.selfiePath,_that.idFrontPath,_that.idBackPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String phone,  String password)  login,required TResult Function( String phone)  registerStart,required TResult Function( String phone)  forgotPassword,required TResult Function( String phone,  String code)  verifyOtp,required TResult Function()  loadCategories,required TResult Function()  checkAuthStatus,required TResult Function( String phone,  String ticket,  String firstName,  String lastName,  List<int> serviceCategoryIds,  String password,  String passwordConfirmation,  String? selfiePath,  String? idFrontPath,  String? idBackPath)  registerProviderSubmit,}) {final _that = this;
switch (_that) {
case _Login():
return login(_that.phone,_that.password);case _RegisterStart():
return registerStart(_that.phone);case _ForgotPassword():
return forgotPassword(_that.phone);case _VerifyOtp():
return verifyOtp(_that.phone,_that.code);case _LoadCategories():
return loadCategories();case _CheckAuthStatus():
return checkAuthStatus();case _RegisterProviderSubmit():
return registerProviderSubmit(_that.phone,_that.ticket,_that.firstName,_that.lastName,_that.serviceCategoryIds,_that.password,_that.passwordConfirmation,_that.selfiePath,_that.idFrontPath,_that.idBackPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String phone,  String password)?  login,TResult? Function( String phone)?  registerStart,TResult? Function( String phone)?  forgotPassword,TResult? Function( String phone,  String code)?  verifyOtp,TResult? Function()?  loadCategories,TResult? Function()?  checkAuthStatus,TResult? Function( String phone,  String ticket,  String firstName,  String lastName,  List<int> serviceCategoryIds,  String password,  String passwordConfirmation,  String? selfiePath,  String? idFrontPath,  String? idBackPath)?  registerProviderSubmit,}) {final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that.phone,_that.password);case _RegisterStart() when registerStart != null:
return registerStart(_that.phone);case _ForgotPassword() when forgotPassword != null:
return forgotPassword(_that.phone);case _VerifyOtp() when verifyOtp != null:
return verifyOtp(_that.phone,_that.code);case _LoadCategories() when loadCategories != null:
return loadCategories();case _CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case _RegisterProviderSubmit() when registerProviderSubmit != null:
return registerProviderSubmit(_that.phone,_that.ticket,_that.firstName,_that.lastName,_that.serviceCategoryIds,_that.password,_that.passwordConfirmation,_that.selfiePath,_that.idFrontPath,_that.idBackPath);case _:
  return null;

}
}

}

/// @nodoc


class _Login implements AuthEvent {
  const _Login({required this.phone, required this.password});
  

 final  String phone;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? password = null,}) {
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
  

 final  String phone;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_RegisterStart(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ForgotPassword implements AuthEvent {
  const _ForgotPassword({required this.phone});
  

 final  String phone;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_ForgotPassword(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _VerifyOtp implements AuthEvent {
  const _VerifyOtp({required this.phone, required this.code});
  

 final  String phone;
 final  String code;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? code = null,}) {
  return _then(_VerifyOtp(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadCategories implements AuthEvent {
  const _LoadCategories();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadCategories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.loadCategories()';
}


}




/// @nodoc


class _CheckAuthStatus implements AuthEvent {
  const _CheckAuthStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckAuthStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkAuthStatus()';
}


}




/// @nodoc


class _RegisterProviderSubmit implements AuthEvent {
  const _RegisterProviderSubmit({required this.phone, required this.ticket, required this.firstName, required this.lastName, required final  List<int> serviceCategoryIds, required this.password, required this.passwordConfirmation, this.selfiePath, this.idFrontPath, this.idBackPath}): _serviceCategoryIds = serviceCategoryIds;
  

 final  String phone;
 final  String ticket;
 final  String firstName;
 final  String lastName;
 final  List<int> _serviceCategoryIds;
 List<int> get serviceCategoryIds {
  if (_serviceCategoryIds is EqualUnmodifiableListView) return _serviceCategoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serviceCategoryIds);
}

 final  String password;
 final  String passwordConfirmation;
 final  String? selfiePath;
 final  String? idFrontPath;
 final  String? idBackPath;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterProviderSubmitCopyWith<_RegisterProviderSubmit> get copyWith => __$RegisterProviderSubmitCopyWithImpl<_RegisterProviderSubmit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterProviderSubmit&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.ticket, ticket) || other.ticket == ticket)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&const DeepCollectionEquality().equals(other._serviceCategoryIds, _serviceCategoryIds)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation)&&(identical(other.selfiePath, selfiePath) || other.selfiePath == selfiePath)&&(identical(other.idFrontPath, idFrontPath) || other.idFrontPath == idFrontPath)&&(identical(other.idBackPath, idBackPath) || other.idBackPath == idBackPath));
}


@override
int get hashCode => Object.hash(runtimeType,phone,ticket,firstName,lastName,const DeepCollectionEquality().hash(_serviceCategoryIds),password,passwordConfirmation,selfiePath,idFrontPath,idBackPath);

@override
String toString() {
  return 'AuthEvent.registerProviderSubmit(phone: $phone, ticket: $ticket, firstName: $firstName, lastName: $lastName, serviceCategoryIds: $serviceCategoryIds, password: $password, passwordConfirmation: $passwordConfirmation, selfiePath: $selfiePath, idFrontPath: $idFrontPath, idBackPath: $idBackPath)';
}


}

/// @nodoc
abstract mixin class _$RegisterProviderSubmitCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RegisterProviderSubmitCopyWith(_RegisterProviderSubmit value, $Res Function(_RegisterProviderSubmit) _then) = __$RegisterProviderSubmitCopyWithImpl;
@useResult
$Res call({
 String phone, String ticket, String firstName, String lastName, List<int> serviceCategoryIds, String password, String passwordConfirmation, String? selfiePath, String? idFrontPath, String? idBackPath
});




}
/// @nodoc
class __$RegisterProviderSubmitCopyWithImpl<$Res>
    implements _$RegisterProviderSubmitCopyWith<$Res> {
  __$RegisterProviderSubmitCopyWithImpl(this._self, this._then);

  final _RegisterProviderSubmit _self;
  final $Res Function(_RegisterProviderSubmit) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? ticket = null,Object? firstName = null,Object? lastName = null,Object? serviceCategoryIds = null,Object? password = null,Object? passwordConfirmation = null,Object? selfiePath = freezed,Object? idFrontPath = freezed,Object? idBackPath = freezed,}) {
  return _then(_RegisterProviderSubmit(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,ticket: null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,serviceCategoryIds: null == serviceCategoryIds ? _self._serviceCategoryIds : serviceCategoryIds // ignore: cast_nullable_to_non_nullable
as List<int>,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,selfiePath: freezed == selfiePath ? _self.selfiePath : selfiePath // ignore: cast_nullable_to_non_nullable
as String?,idFrontPath: freezed == idFrontPath ? _self.idFrontPath : idFrontPath // ignore: cast_nullable_to_non_nullable
as String?,idBackPath: freezed == idBackPath ? _self.idBackPath : idBackPath // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Authenticated value)?  authenticated,TResult Function( _PasswordResetEmailSent value)?  passwordResetEmailSent,TResult Function( _CategoriesLoaded value)?  categoriesLoaded,TResult Function( _Unauthenticated value)?  unauthenticated,TResult Function( _OtpSent value)?  otpSent,TResult Function( _OtpVerified value)?  otpVerified,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _PasswordResetEmailSent() when passwordResetEmailSent != null:
return passwordResetEmailSent(_that);case _CategoriesLoaded() when categoriesLoaded != null:
return categoriesLoaded(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _OtpSent() when otpSent != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Authenticated value)  authenticated,required TResult Function( _PasswordResetEmailSent value)  passwordResetEmailSent,required TResult Function( _CategoriesLoaded value)  categoriesLoaded,required TResult Function( _Unauthenticated value)  unauthenticated,required TResult Function( _OtpSent value)  otpSent,required TResult Function( _OtpVerified value)  otpVerified,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Authenticated():
return authenticated(_that);case _PasswordResetEmailSent():
return passwordResetEmailSent(_that);case _CategoriesLoaded():
return categoriesLoaded(_that);case _Unauthenticated():
return unauthenticated(_that);case _OtpSent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Authenticated value)?  authenticated,TResult? Function( _PasswordResetEmailSent value)?  passwordResetEmailSent,TResult? Function( _CategoriesLoaded value)?  categoriesLoaded,TResult? Function( _Unauthenticated value)?  unauthenticated,TResult? Function( _OtpSent value)?  otpSent,TResult? Function( _OtpVerified value)?  otpVerified,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _PasswordResetEmailSent() when passwordResetEmailSent != null:
return passwordResetEmailSent(_that);case _CategoriesLoaded() when categoriesLoaded != null:
return categoriesLoaded(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _OtpSent() when otpSent != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( User user)?  authenticated,TResult Function()?  passwordResetEmailSent,TResult Function( List<CategoryModel> categories)?  categoriesLoaded,TResult Function()?  unauthenticated,TResult Function( String? debugCode)?  otpSent,TResult Function( String ticket)?  otpVerified,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Authenticated() when authenticated != null:
return authenticated(_that.user);case _PasswordResetEmailSent() when passwordResetEmailSent != null:
return passwordResetEmailSent();case _CategoriesLoaded() when categoriesLoaded != null:
return categoriesLoaded(_that.categories);case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _OtpSent() when otpSent != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( User user)  authenticated,required TResult Function()  passwordResetEmailSent,required TResult Function( List<CategoryModel> categories)  categoriesLoaded,required TResult Function()  unauthenticated,required TResult Function( String? debugCode)  otpSent,required TResult Function( String ticket)  otpVerified,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Authenticated():
return authenticated(_that.user);case _PasswordResetEmailSent():
return passwordResetEmailSent();case _CategoriesLoaded():
return categoriesLoaded(_that.categories);case _Unauthenticated():
return unauthenticated();case _OtpSent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( User user)?  authenticated,TResult? Function()?  passwordResetEmailSent,TResult? Function( List<CategoryModel> categories)?  categoriesLoaded,TResult? Function()?  unauthenticated,TResult? Function( String? debugCode)?  otpSent,TResult? Function( String ticket)?  otpVerified,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Authenticated() when authenticated != null:
return authenticated(_that.user);case _PasswordResetEmailSent() when passwordResetEmailSent != null:
return passwordResetEmailSent();case _CategoriesLoaded() when categoriesLoaded != null:
return categoriesLoaded(_that.categories);case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _OtpSent() when otpSent != null:
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


class _CategoriesLoaded implements AuthState {
  const _CategoriesLoaded(final  List<CategoryModel> categories): _categories = categories;
  

 final  List<CategoryModel> _categories;
 List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesLoadedCopyWith<_CategoriesLoaded> get copyWith => __$CategoriesLoadedCopyWithImpl<_CategoriesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriesLoaded&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'AuthState.categoriesLoaded(categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$CategoriesLoadedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$CategoriesLoadedCopyWith(_CategoriesLoaded value, $Res Function(_CategoriesLoaded) _then) = __$CategoriesLoadedCopyWithImpl;
@useResult
$Res call({
 List<CategoryModel> categories
});




}
/// @nodoc
class __$CategoriesLoadedCopyWithImpl<$Res>
    implements _$CategoriesLoadedCopyWith<$Res> {
  __$CategoriesLoadedCopyWithImpl(this._self, this._then);

  final _CategoriesLoaded _self;
  final $Res Function(_CategoriesLoaded) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(_CategoriesLoaded(
null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}


}

/// @nodoc


class _Unauthenticated implements AuthState {
  const _Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthenticated()';
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
