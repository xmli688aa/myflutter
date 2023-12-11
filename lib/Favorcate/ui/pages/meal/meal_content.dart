import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:my_app/Favorcate/core/model/category_model.dart';
import 'package:my_app/Favorcate/core/model/meal_model.dart';
import 'package:my_app/Favorcate/core/viewmodel/meal_view_model.dart';
import 'package:provider/provider.dart';

import '../../widgets/meal_item.dart';

class HYMealContent extends StatelessWidget {
  HYCategoryModel categoryModel;

  HYMealContent(this.categoryModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HYMealViewModel, List<HYMealModel>>(
      selector: (ctx, mealVM) {
        return mealVM.meals
            .where((meal) => meal.categories.contains(categoryModel.id))
            .toList();
      },
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),

      builder: (ctx, meals, child) {
        return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              HYMealModel model = meals[index];
              return HYMealItem(model);
            });
      },
    );
  }
}


// class HYMealContent extends StatelessWidget {
//   HYCategoryModel categoryModel;
//
//   HYMealContent(this.categoryModel, {Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     print(categoryModel.id);
//     return Consumer<HYMealViewModel>(builder:(ctx,mealVM,child){
//       // List<HYMealModel> hyMealModels = [];
//       // for(HYMealModel model in mealVM.meals){
//       //   List categories = model.categories;
//       //   if(categories.contains(categoryModel.id)){
//       //     hyMealModels.add(model);
//       //   }
//       // }
//       //上面的东西可以简写成下面的
//       List<HYMealModel> hyMealModels = mealVM.meals.where((meal) => meal.categories.contains(categoryModel.id)).toList();
//       print("${mealVM.meals}");
//       return ListView.builder(
//           itemCount: hyMealModels.length,
//           itemBuilder: (ctx,index){
//             HYMealModel mealModel = hyMealModels[index];
//             return Text("${mealModel.title}");
//           });
//     });
//   }
// }
