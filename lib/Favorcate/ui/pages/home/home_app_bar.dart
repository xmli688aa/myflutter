import 'package:flutter/material.dart';

class HYHomeAppBar extends AppBar{
  HYHomeAppBar():super(
    title: Text("美食广场"),
    backgroundColor: Colors.pink,
    //修改抽屉模式的图标 包裹一层Builder是为了拿到跟Scaffold同一级的Drawer
    leading: Builder(
      builder: (ctx){
        return IconButton(
          onPressed: () {
            Scaffold.of(ctx).openDrawer();
          }, icon: Icon(Icons.build),
        );
      },
    ),
  );
}