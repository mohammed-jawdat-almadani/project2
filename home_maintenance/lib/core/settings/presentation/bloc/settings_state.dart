import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(Locale('ar', 'AE')) Locale locale,
    @Default(ThemeMode.light) ThemeMode themeMode,
    @Default(false) bool isLoaded,
  }) = _SettingsState;
}
