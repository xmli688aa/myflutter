import 'package:flutter/material.dart';

class HYAppTheme {
  // 1.共有属性

  static const double smallFontSize = 12;
  static const double normalFontSize = 14;
  static const double largeFontSize = 18;

  static const Color textNormalColor = Colors.black87;

  // 2.普通模式
  static final Color norTextColors = Colors.red;

  static final ThemeData norTheme = ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: const Color.fromRGBO(255, 254, 222, 1),
      textTheme: const TextTheme(
        //Text文本默认的类型是bodyMedium
        bodyMedium: TextStyle(fontSize: normalFontSize, color: textNormalColor),
        bodyLarge: TextStyle(fontSize: largeFontSize, color: textNormalColor),
        bodySmall: TextStyle(fontSize: smallFontSize, color: textNormalColor),

        //可以自定义的类型
        // displayLarge: TextStyle(fontSize: largeFontSize, color: textNormalColor),
        // displayMedium:
        // TextStyle(fontSize: normalFontSize, color: textNormalColor),
        // displaySmall: TextStyle(fontSize: smallFontSize, color: textNormalColor),

        //以下是过期的类型
        // bodyText1: TextStyle(fontSize: bodyFontSize,color: Colors.red),
        // bodyText2: TextStyle(fontSize: smallFontSize, color: Colors.black87),
        // headline4: TextStyle(fontSize: smallFontSize, color: Colors.black87),
        // headline3: TextStyle(fontSize: normalFontSize, color: Colors.black87),
        // headline2: TextStyle(fontSize: largeFontSize, color: Colors.black87),
      ));

  // 3.暗黑模式
  static final Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: TextTheme(
          bodyText1:
              TextStyle(fontSize: normalFontSize, color: darkTextColors)));
}
