import 'package:flutter/material.dart';
import 'package:my_app/douban/main/navigation_bar.dart';

class ETSubjectPage extends StatelessWidget {
  const ETSubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ETNavigationBar(backgroundColor: Colors.yellow,title: Text("属性表"),),
      body: Center(
        child: Text("书影音"),
      ),
    );
  }
}
