import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/model/meal_model.dart';
import 'package:my_app/Favorcate/core/viewmodel/favor_view_model.dart';
import 'package:my_app/Favorcate/ui/pages/detail/detail_content.dart';
import 'package:my_app/Favorcate/ui/shared/app_theme.dart';
import 'package:provider/provider.dart';

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
      floatingActionButton: Consumer<HYFavorViewModel>(
        builder: (ctx,favorVM,child){
          //1.判断是否是收藏状态
          final isFavor = favorVM.isFavor(mealModel);
          final icon = isFavor?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color: Colors.black);
          return GestureDetector(
            onTap: (){
              print("点击了收藏");
                if(isFavor){
                  favorVM.removeMeal(mealModel);
                }else{
                  favorVM.addMeal(mealModel);
                }
            },
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              child: icon,
            ),
          );
        },
      ),
    );
  }
}
