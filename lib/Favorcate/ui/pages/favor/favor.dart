import 'package:flutter/material.dart';
import 'favor_content.dart';
class HYFavorScreen extends StatelessWidget {
  static const String routeName = "./HYFavorScreen";

  const HYFavorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的收藏"),
      ),
      body:const HYFavorContent(),
    );
  }
}
