import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings_event.dart';
import 'settings_state.dart';

@lazySingleton
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  static const String _keyLanguage = 'app_language';
  static const String _keyThemeMode = 'app_theme_mode';

  SettingsBloc() : super(const SettingsState()) {
    on<SettingsEvent>((event, emit) async {
      await event.map(
        loadSettings: (_) async => _onLoadSettings(emit),
        changeLanguage: (e) async => _onChangeLanguage(e.languageCode, emit),
        changeThemeMode: (e) async => _onChangeThemeMode(e.themeMode, emit),
      );
    });
  }

  Future<void> _onLoadSettings(Emitter<SettingsState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final langCode = prefs.getString(_keyLanguage) ?? 'ar';
      final themeIndex = prefs.getInt(_keyThemeMode) ?? ThemeMode.light.index;

      final themeMode = ThemeMode.values[themeIndex];
      final locale = langCode == 'en'
          ? const Locale('en', 'US')
          : const Locale('ar', 'AE');

      emit(state.copyWith(
        locale: locale,
        themeMode: themeMode,
        isLoaded: true,
      ));
    } catch (_) {
      emit(state.copyWith(isLoaded: true));
    }
  }

  Future<void> _onChangeLanguage(
      String languageCode, Emitter<SettingsState> emit) async {
    final locale = languageCode == 'en'
        ? const Locale('en', 'US')
        : const Locale('ar', 'AE');

    emit(state.copyWith(locale: locale));

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyLanguage, languageCode);
    } catch (_) {}
  }

  Future<void> _onChangeThemeMode(
      ThemeMode themeMode, Emitter<SettingsState> emit) async {
    emit(state.copyWith(themeMode: themeMode));

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_keyThemeMode, themeMode.index);
    } catch (_) {}
  }
}
