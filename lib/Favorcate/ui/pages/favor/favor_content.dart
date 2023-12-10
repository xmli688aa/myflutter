import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/viewmodel/favor_view_model.dart';
import 'package:my_app/Favorcate/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class HYFavorContent extends StatelessWidget {
  const HYFavorContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<HYFavorViewModel>(
      builder: (BuildContext context, HYFavorViewModel favorViewModel, Widget? child) {
        final favors = favorViewModel.favorMeals;
        if(favors.length == 0){
          return Center(
            child: Text("未收藏美食"),
          );
        }
        return ListView.builder(
            itemCount: favors.length,
            itemBuilder: (ctx,index){
              return HYMealItem(favors[index]);
            });
      },
    );
  }
}
