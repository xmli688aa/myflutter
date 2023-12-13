import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_app/15_i18n/localizations.dart';
import 'package:my_app/15_i18n/localizations_delegate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HYHomePage(),
      //国际化配置语言
      supportedLocales:  [
        Locale("zh"),
        Locale("en"),
      ],
      //设置组件也跟着手机语言保持一致
      localizationsDelegates:  [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        HYLocalizationsDelegate.delegate,
      ],
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HYLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
               HYLocalizations.of(context).hello,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              child:  Text(
                HYLocalizations.of(context).pickTime,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2033))
                    .then((selectTime) {
                  print(selectTime.toString());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
