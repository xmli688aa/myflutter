import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class HYLocalizations {
  final Locale locale;

  HYLocalizations(this.locale);

  static HYLocalizations of(BuildContext context) {
    return Localizations.of(context, HYLocalizations);
  }

  static  Map<String, Map<String, String>> _localizeValues = {};

  Future loadJson() async {
    //1.加载json文件
    String jsonStr = await rootBundle.loadString("assets/json/i18n.json");
    //2.解析json数据
    Map<String, dynamic> resultMap = json.decode(jsonStr);
    _localizeValues = resultMap.map((key, value) {
      return MapEntry(key, value.cast<String,String>());
    });
  }

  String get title {
    String result = _localizeValues[locale.languageCode]?["title"] as String;
    return result;
  }

  String get hello {
    String result = _localizeValues[locale.languageCode]?["hello"] as String;
    return result;
  }

  String get pickTime {
    String result = _localizeValues[locale.languageCode]?["pickTime"] as String;
    return result;
  }


}