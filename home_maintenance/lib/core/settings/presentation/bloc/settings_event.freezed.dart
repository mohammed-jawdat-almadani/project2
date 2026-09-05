// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent()';
}


}

/// @nodoc
class $SettingsEventCopyWith<$Res>  {
$SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}


/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadSettings value)?  loadSettings,TResult Function( _ChangeLanguage value)?  changeLanguage,TResult Function( _ChangeThemeMode value)?  changeThemeMode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadSettings() when loadSettings != null:
return loadSettings(_that);case _ChangeLanguage() when changeLanguage != null:
return changeLanguage(_that);case _ChangeThemeMode() when changeThemeMode != null:
return changeThemeMode(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadSettings value)  loadSettings,required TResult Function( _ChangeLanguage value)  changeLanguage,required TResult Function( _ChangeThemeMode value)  changeThemeMode,}){
final _that = this;
switch (_that) {
case _LoadSettings():
return loadSettings(_that);case _ChangeLanguage():
return changeLanguage(_that);case _ChangeThemeMode():
return changeThemeMode(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadSettings value)?  loadSettings,TResult? Function( _ChangeLanguage value)?  changeLanguage,TResult? Function( _ChangeThemeMode value)?  changeThemeMode,}){
final _that = this;
switch (_that) {
case _LoadSettings() when loadSettings != null:
return loadSettings(_that);case _ChangeLanguage() when changeLanguage != null:
return changeLanguage(_that);case _ChangeThemeMode() when changeThemeMode != null:
return changeThemeMode(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadSettings,TResult Function( String languageCode)?  changeLanguage,TResult Function( ThemeMode themeMode)?  changeThemeMode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadSettings() when loadSettings != null:
return loadSettings();case _ChangeLanguage() when changeLanguage != null:
return changeLanguage(_that.languageCode);case _ChangeThemeMode() when changeThemeMode != null:
return changeThemeMode(_that.themeMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadSettings,required TResult Function( String languageCode)  changeLanguage,required TResult Function( ThemeMode themeMode)  changeThemeMode,}) {final _that = this;
switch (_that) {
case _LoadSettings():
return loadSettings();case _ChangeLanguage():
return changeLanguage(_that.languageCode);case _ChangeThemeMode():
return changeThemeMode(_that.themeMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadSettings,TResult? Function( String languageCode)?  changeLanguage,TResult? Function( ThemeMode themeMode)?  changeThemeMode,}) {final _that = this;
switch (_that) {
case _LoadSettings() when loadSettings != null:
return loadSettings();case _ChangeLanguage() when changeLanguage != null:
return changeLanguage(_that.languageCode);case _ChangeThemeMode() when changeThemeMode != null:
return changeThemeMode(_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc


class _LoadSettings implements SettingsEvent {
  const _LoadSettings();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadSettings);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.loadSettings()';
}


}




/// @nodoc


class _ChangeLanguage implements SettingsEvent {
  const _ChangeLanguage(this.languageCode);
  

 final  String languageCode;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeLanguageCopyWith<_ChangeLanguage> get copyWith => __$ChangeLanguageCopyWithImpl<_ChangeLanguage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeLanguage&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode));
}


@override
int get hashCode => Object.hash(runtimeType,languageCode);

@override
String toString() {
  return 'SettingsEvent.changeLanguage(languageCode: $languageCode)';
}


}

/// @nodoc
abstract mixin class _$ChangeLanguageCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$ChangeLanguageCopyWith(_ChangeLanguage value, $Res Function(_ChangeLanguage) _then) = __$ChangeLanguageCopyWithImpl;
@useResult
$Res call({
 String languageCode
});




}
/// @nodoc
class __$ChangeLanguageCopyWithImpl<$Res>
    implements _$ChangeLanguageCopyWith<$Res> {
  __$ChangeLanguageCopyWithImpl(this._self, this._then);

  final _ChangeLanguage _self;
  final $Res Function(_ChangeLanguage) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? languageCode = null,}) {
  return _then(_ChangeLanguage(
null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ChangeThemeMode implements SettingsEvent {
  const _ChangeThemeMode(this.themeMode);
  

 final  ThemeMode themeMode;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeThemeModeCopyWith<_ChangeThemeMode> get copyWith => __$ChangeThemeModeCopyWithImpl<_ChangeThemeMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeThemeMode&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'SettingsEvent.changeThemeMode(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$ChangeThemeModeCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$ChangeThemeModeCopyWith(_ChangeThemeMode value, $Res Function(_ChangeThemeMode) _then) = __$ChangeThemeModeCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode
});




}
/// @nodoc
class __$ChangeThemeModeCopyWithImpl<$Res>
    implements _$ChangeThemeModeCopyWith<$Res> {
  __$ChangeThemeModeCopyWithImpl(this._self, this._then);

  final _ChangeThemeMode _self;
  final $Res Function(_ChangeThemeMode) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(_ChangeThemeMode(
null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

// dart format on
