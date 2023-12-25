
import 'package:flutter/material.dart';

class ETAboutPage extends StatefulWidget {
  static const String routeName = "/about";
  const ETAboutPage({super.key});
  @override
  _ETAboutPageState createState() => _ETAboutPageState();
}

class _ETAboutPageState extends State<ETAboutPage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("关于页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message),
            ElevatedButton(
              child: const Text("返回首页"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
