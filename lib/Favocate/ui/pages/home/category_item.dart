import 'package:flutter/material.dart';
import 'package:my_app/day14_screenfit/extension/int_extension.dart';

import '../../../core/model/category_model.dart';


class HYHomeCategoryItem extends StatelessWidget {
  HYCategoryModel _categoryModel;
  HYHomeCategoryItem(this._categoryModel);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}