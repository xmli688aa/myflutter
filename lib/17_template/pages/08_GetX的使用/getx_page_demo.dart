import 'package:flutter/material.dart';

class ETGetXPageDemo extends StatefulWidget {
  static String routeName = "/ETGetXPageDemo";
  const ETGetXPageDemo({super.key});

  @override
  State<ETGetXPageDemo> createState() => _ETGetXPageDemoState();
}

class _ETGetXPageDemoState extends State<ETGetXPageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetXPage"),
      ),
      body: Center(
        child: Text("GetXPage"),
      ),
    );
  }
}
