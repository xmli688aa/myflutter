import 'package:flutter/material.dart';
import 'package:my_app/Favocate/core/services/json_parse.dart';
import 'package:my_app/day14_screenfit/extension/int_extension.dart';

import '../../../core/model/category_model.dart';

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
          return Container(
            decoration: BoxDecoration(
              color: Colors.red,
              gradient: LinearGradient(colors: [
                _categories[index].cColor.withOpacity(0.5),
                _categories[index].cColor,
              ]),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
                child: Text(
              "${_categories[index].title}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold
              ),
            )),
          );
        });
  }
}
