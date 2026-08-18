import 'package:flutter/material.dart';
import 'app_strings.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('ar', 'AE'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String translate(String key) {
    return AppStrings.get(key, locale.languageCode);
  }

  bool get isArabic => locale.languageCode == 'ar';
  bool get isRtl => isArabic;
  TextDirection get textDirection =>
      isRtl ? TextDirection.rtl : TextDirection.ltr;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  String tr(String key) => AppLocalizations.of(this).translate(key);
  bool get isRtl => AppLocalizations.of(this).isRtl;
  bool get isArabic => AppLocalizations.of(this).isArabic;
  TextDirection get textDirection => AppLocalizations.of(this).textDirection;
}
