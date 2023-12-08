import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/ui/pages/home/home_content.dart';


class HYHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
        backgroundColor: Colors.pink,
      ),
      body: HYHomeContent(),
    );
  }
}
