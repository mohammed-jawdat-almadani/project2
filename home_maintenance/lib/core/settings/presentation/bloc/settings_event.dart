import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.freezed.dart';

@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadSettings() = _LoadSettings;
  const factory SettingsEvent.changeLanguage(String languageCode) = _ChangeLanguage;
  const factory SettingsEvent.changeThemeMode(ThemeMode themeMode) = _ChangeThemeMode;
}
