
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_app/15_i18n/localizations_delegate.dart';

import '../generated/l10n.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HYHomePage(),
      //国际化配置语言
      supportedLocales:  S.delegate.supportedLocales,
      //设置组件也跟着手机语言保持一致
      localizationsDelegates:  [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        HYLocalizationsDelegate.delegate,
        S.delegate
      ],
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
               S.of(context).hello,
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              child:  Text(
                S.of(context).pickTime,
                style: const TextStyle(fontSize: 20, color: Colors.black),
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
