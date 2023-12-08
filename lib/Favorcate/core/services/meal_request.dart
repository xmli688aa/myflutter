import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_app/Favorcate/core/model/meal_model.dart';

import 'http_request.dart';

class HYMealRequest {
  static Future<List<HYMealModel>> getMealsData() async {
    //这里模仿网络请求
    final request =
        await HttpRequest.request(url: "https://httpbin.org/get", params: {});
    //这里判断数据 如果数据不对就从本地获取数据
    if (request["meal"] != List) {
      return getLocalFileData();
    }
    return Future.value();
  }

  static Future<List<HYMealModel>> getLocalFileData() async {
    print("从本地json文件中获取");
    //从本地json文件中获取
    final jsonStr = await rootBundle.loadString("assets/json/meal.json");
    //将json字符串转成map或者list
    Map jsonMap = json.decode(jsonStr);
    final resultList = jsonMap["meal"];
    List<HYMealModel> list = [];
    // 将list的数据转成模型
    for (var json in resultList) {
      list.add(HYMealModel.fromJson(json));
    }
    return list;
  }
}
