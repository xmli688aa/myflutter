import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../model/meal_model.dart';
import 'base_view_model.dart';
import 'filter_view_model.dart';

class HYFavorViewModel extends BaseMealViewModel {
void addMeal(HYMealModel meal) {
  originMeals.add(meal);
  notifyListeners();
}

void removeMeal(HYMealModel meal) {
  originMeals.remove(meal);
  notifyListeners();
}

void handleMeal(HYMealModel meal) {
  if (isFavor(meal)) {
    removeMeal(meal);
  } else {
    addMeal(meal);
  }
}

bool isFavor(HYMealModel meal) {
  return originMeals.contains(meal);
}
}