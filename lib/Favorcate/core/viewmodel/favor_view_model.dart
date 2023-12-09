import 'package:flutter/foundation.dart';

import '../model/meal_model.dart';

class HYFavorViewModel extends ChangeNotifier {
  List<HYMealModel> _favorMeals = [];

  List<HYMealModel> get favorMeals {
    return _favorMeals;
  }

  void addMeal(HYMealModel mealModel) {
    _favorMeals.add(mealModel);
    notifyListeners();
  }

  void removeMeal(HYMealModel mealModel) {
    _favorMeals.remove(mealModel);
    notifyListeners();
  }

  bool isFavor(HYMealModel mealModel) {
    return _favorMeals.contains(mealModel);
  }
}
