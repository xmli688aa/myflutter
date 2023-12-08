import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/model/category_model.dart';
import 'package:my_app/Favorcate/core/services/meal_request.dart';
class HYDetailScreen extends StatelessWidget {
  static const String routeName = "/HYDetailScreen" ;
  const HYDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HYMealRequest.getMealsData().then((value) {
      print("详情页 $value");
    });
    final HYCategoryModel categoryModal = ModalRoute.of(context)?.settings.arguments as HYCategoryModel;

    return Scaffold(
      appBar: AppBar(title: Text("${categoryModal.title}"),),
      body: Center(
        child: Text("美食"),
      ),
    );
  }
}
