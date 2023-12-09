import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/model/meal_model.dart';
import 'package:my_app/Favorcate/ui/pages/detail/detail_content.dart';
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
        title: Text("${mealModel.title}",style: TextStyle(color: Colors.white),),
        backgroundColor: HYAppTheme.navigationBGColor,
      ),
      body: HYDetailContent(mealModel),
      floatingActionButton: GestureDetector(
        onTap: (){
          print("点击了收藏");
        },
        child: CircleAvatar(
            backgroundColor: Colors.amber,
          child: Icon(Icons.favorite_border,color: Colors.black,),
        ),
      ),
    );
  }
}
