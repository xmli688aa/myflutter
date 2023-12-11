import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/viewmodel/favor_view_model.dart';
import 'package:my_app/Favorcate/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

import '../../../core/model/meal_model.dart';

class HYFavorContent extends StatefulWidget {
  const HYFavorContent({Key? key}) : super(key: key);

  @override
  State<HYFavorContent> createState() => _HYFavorContentState();
}

class _HYFavorContentState extends State<HYFavorContent> {
  @override
  Widget build(BuildContext context) {

    return Consumer<HYFavorViewModel>(
      builder: ( context,  favorViewModel,  child) {
        List<HYMealModel>  favors = favorViewModel.favorMeals;
        print("favorViewModel.favorMeals:${favorViewModel.favorMeals}");
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
