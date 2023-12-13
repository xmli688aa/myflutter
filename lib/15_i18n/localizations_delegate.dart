import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:my_app/15_i18n/localizations.dart';

//自定义Delegate
class HYLocalizationsDelegate extends LocalizationsDelegate<HYLocalizations>{
  static HYLocalizationsDelegate delegate = HYLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ["zh","en"].contains(locale.languageCode);
    // TODO: implement isSupported
    throw UnimplementedError();
  }

  @override
  Future<HYLocalizations> load(Locale locale) {
    return SynchronousFuture(HYLocalizations(locale));
    // TODO: implement load
    throw UnimplementedError();
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<HYLocalizations> old) {
    return false;
    // TODO: implement shouldReload
    throw UnimplementedError();
  }
  
}