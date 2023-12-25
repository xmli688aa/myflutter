import 'package:flutter/material.dart';

class HYHomeAppBar extends AppBar{
  HYHomeAppBar(BuildContext context, {super.key}):super(
    title: const Text("美食广场"),
    backgroundColor: Colors.pink,
    //修改抽屉模式的图标 包裹一层Builder是为了拿到跟Scaffold同一级的Drawer
    leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.build),
        ),

  );
}