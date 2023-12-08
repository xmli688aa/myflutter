import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_app/Favorcate/core/model/category_model.dart';

class JsonParse {
  static Future<List<HYCategoryModel>> getCategoryData() async {
    //1.加载json文件
    final String categoryStr =
        await rootBundle.loadString("assets/json/category.json");
    //2.解析json字符串 转成Map 或者List
    final categoryMap = json.decode(categoryStr);
    //3.将map中的内容转成一个一个对象
    final resultList = categoryMap["category"];
    List<HYCategoryModel> categorymodels = [];
    for(var json in resultList){
        HYCategoryModel model = HYCategoryModel.fromJson(json);
        // print(model.title);
        categorymodels.add(model);
    }
    // print("解析出的数据 $categorymodels");
    return categorymodels;

  }
}
