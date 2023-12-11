import 'package:my_app/Favorcate/core/services/meal_request.dart';

import 'base_view_model.dart';

class HYMealViewModel extends BaseMealViewModel {
  HYMealViewModel() {
    HYMealRequest.getMealsData().then((res) {
      meals = res;
    });
  }
}