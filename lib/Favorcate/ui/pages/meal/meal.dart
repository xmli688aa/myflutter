import 'package:flutter/material.dart';


import '../../../core/model/category_model.dart';

class HYMealScreen extends StatelessWidget {
  static const String routeName = "/meal";

  const HYMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取参数
    final HYCategoryModel category = ModalRoute.of(context)?.settings.arguments as HYCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title as String),
      ),
      body: Center(
        child: Text("Meal List"),
      ),
    );
  }
}
