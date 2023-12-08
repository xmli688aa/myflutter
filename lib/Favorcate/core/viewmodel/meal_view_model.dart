import 'package:flutter/cupertino.dart';
import 'package:my_app/Favorcate/core/model/meal_model.dart';
import 'package:my_app/Favorcate/core/services/meal_request.dart';

class HYMealViewModel extends ChangeNotifier{
  List<HYMealModel> meals = [];
  HYMealViewModel(){
    HYMealRequest.getMealsData().then((value){
      meals = value;
      notifyListeners();
    });
  }

}