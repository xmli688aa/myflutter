import 'dart:ui';

import 'package:flutter/cupertino.dart';

class HYLocalizations{
  final Locale locale;
  HYLocalizations(this.locale);

  static HYLocalizations of(BuildContext context){
   return Localizations.of(context, HYLocalizations);
}
  static final Map<String, Map<String, String>> _localizeValues ={
    "en":{
      "title":"Home",
      "hello":"Hello~",
      "pickTime":"Pick a Time~",
    },
    "zh":{
      "title":"首页",
      "hello":"你好~",
      "pickTime":"选择一个时间~",
    }
  };
  String get title{
    String result = _localizeValues[locale.languageCode]?["title"] as String;
    return result;
  }
  String get hello{
    String result = _localizeValues[locale.languageCode]?["hello"] as String;
    return result;
  }
  String get pickTime{
    String result = _localizeValues[locale.languageCode]?["pickTime"] as String;
    return result;
  }


}