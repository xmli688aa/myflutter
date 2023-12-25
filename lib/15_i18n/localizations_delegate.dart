import 'package:flutter/cupertino.dart';
import 'package:my_app/15_i18n/localizations.dart';

//自定义Delegate
class HYLocalizationsDelegate extends LocalizationsDelegate<HYLocalizations> {
  static HYLocalizationsDelegate delegate = HYLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["zh", "en"].contains(locale.languageCode);
  }

  @override
  Future<HYLocalizations> load(Locale locale) async {
    final localizations = HYLocalizations(locale);
    await localizations.loadJson();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<HYLocalizations> old) {
    return false;
  }
}
