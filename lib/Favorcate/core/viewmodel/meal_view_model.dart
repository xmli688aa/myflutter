import 'package:flutter/cupertino.dart';
import 'package:my_app/Favorcate/core/model/meal_model.dart';
import 'package:my_app/Favorcate/core/services/meal_request.dart';
import 'package:my_app/Favorcate/core/viewmodel/filter_view_model.dart';

class HYMealViewModel extends ChangeNotifier {
  List<HYMealModel> _meals = [];

  late HYFilterViewModel _filterVM;

  void updateFilters(HYFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  List<HYMealModel> get meals {
    return _meals.where((meal) {
      //这里做过滤 要依赖HYFilterViewModel 所以要在providers里面设置依赖
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  HYMealViewModel() {
    HYMealRequest.getMealsData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}
