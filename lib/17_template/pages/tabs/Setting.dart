import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});


  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            ListTile(
              title: Text("我是一个文本"),
            ),
            ListTile(
              title: Text("我是一个文本"),
            ),
            ListTile(
              title: Text("我是一个文本"),
            ),
            ListTile(
              title: Text("我是一个文本"),
            )
          ],
        )
      ],
    );
  }
}