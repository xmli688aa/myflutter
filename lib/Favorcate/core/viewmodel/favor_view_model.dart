import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../model/meal_model.dart';
import 'filter_view_model.dart';

class HYFavorViewModel extends ChangeNotifier {
  final List<HYMealModel> _favorMeals = [];

  late HYFilterViewModel _filterVM ;
  void updateFilters(HYFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  List<HYMealModel> get favorMeals {
    List<HYMealModel> meals = _favorMeals.where((meal){
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
    return meals;
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
    return favorMeals.contains(mealModel);
  }
}
