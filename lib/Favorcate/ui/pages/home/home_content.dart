import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/services/json_parse.dart';
import 'package:my_app/day14_screenfit/extension/int_extension.dart';

import '../../../core/model/category_model.dart';
import 'category_item.dart';

class HYHomeContent extends StatelessWidget {
  const HYHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HYCategoryModel>>(
        future: JsonParse.getCategoryData(),
        builder: (ctx, snapShot) {
          if (!snapShot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          // print("FutureBuilder object");
          if (snapShot.error != null) return const Center(child: Text("请求错误"));
          // print("FutureBuilder object2");
          final List<HYCategoryModel>? categories = snapShot.data;
          return GridView.builder(
              padding: EdgeInsets.all(20.px),
              itemCount: categories?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 20.px,
                  crossAxisSpacing: 20.px),
              itemBuilder: (ctx, index) {
                return HYHomeCategoryItem(categories![index]);
              });
        });
  }
}
