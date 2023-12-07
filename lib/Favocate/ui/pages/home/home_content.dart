import 'package:flutter/material.dart';
import 'package:my_app/Favocate/core/services/json_parse.dart';
import 'package:my_app/day14_screenfit/extension/int_extension.dart';

import '../../../core/model/category_model.dart';
import 'category_item.dart';

class HYHomeContent extends StatefulWidget {
  const HYHomeContent({Key? key}) : super(key: key);

  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final List<HYCategoryModel> _categories = [];

  @override
  void initState() {
    super.initState();
    //获取json数据
    JsonParse.getCategoryData().then((value) {
      print(value);
      setState(() {
        _categories.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(20.px),
        itemCount: _categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20.px,
            crossAxisSpacing: 20.px),
        itemBuilder: (ctx, index) {
          return HYHomeCategoryItem(_categories[index]);
        });
  }
}

