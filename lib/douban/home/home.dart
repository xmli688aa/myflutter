import 'package:flutter/material.dart';

import 'home_content.dart';

class ETHomePage extends StatefulWidget {
  const ETHomePage({Key? key}) : super(key: key);

  @override
  State<ETHomePage> createState() => _ETHomePageState();
}

class _ETHomePageState extends State<ETHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("首页"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ETHomePageContent(),
    );
  }
}
