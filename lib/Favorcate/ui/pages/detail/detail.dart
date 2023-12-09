import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/model/meal_model.dart';
import 'package:my_app/Favorcate/ui/shared/app_theme.dart';

class HYDetailScreen extends StatelessWidget {
  static const String routeName = "/HYDetailScreen";

  const HYDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HYMealModel mealModel =
        ModalRoute.of(context)?.settings.arguments as HYMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("${mealModel.title}"),
        backgroundColor: HYAppTheme.navigationBGColor,
      ),
      body: Center(
        child: Text("美食"),
      ),
    );
  }
}
