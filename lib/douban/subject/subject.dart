import 'package:flutter/material.dart';
import 'package:my_app/douban/main/navigation_bar.dart';

class ETSubjectPage extends StatelessWidget {
  const ETSubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("书影音"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text("书影音"),
      ),
    );
  }
}
