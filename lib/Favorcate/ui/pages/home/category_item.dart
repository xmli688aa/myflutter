import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/ui/pages/detail/detail.dart';
import 'package:my_app/14_screenfit/extension/int_extension.dart';

import '../../../core/model/category_model.dart';
import '../meal/meal.dart';


class HYHomeCategoryItem extends StatelessWidget {
  HYCategoryModel _categoryModel;
  HYHomeCategoryItem(this._categoryModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          gradient: LinearGradient(colors: [
            _categoryModel.cColor.withOpacity(0.5),
            _categoryModel.cColor,
          ]),
          borderRadius: BorderRadius.circular(15.px),
        ),
        child: Center(
            child: Text(
              "${_categoryModel.title}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold
              ),
            )),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(HYMealScreen.routeName, arguments: _categoryModel);

        // Navigator.of(context).pushNamed(HYDetailScreen.routeName,arguments: _categoryModel);
      },
    );
  }
}