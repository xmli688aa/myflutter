import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/router/router.dart';
import 'package:my_app/Favorcate/core/viewmodel/favor_view_model.dart';
import 'package:my_app/Favorcate/core/viewmodel/filter_view_model.dart';
import 'package:my_app/Favorcate/core/viewmodel/meal_view_model.dart';
import 'package:my_app/Favorcate/ui/shared/app_theme.dart';
import 'package:provider/provider.dart';

import '../14_screenfit/shared/size_fit.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (ctx) => HYFilterViewModel(),
      ),
      //设置HYMealViewModel依赖HYFileterViewModel
      //注意 需要在HYFilterViewModel的provider下面设置
      ChangeNotifierProxyProvider<HYFilterViewModel,HYMealViewModel>(
          create: (ctx) => HYMealViewModel(),
          update: (ctx, filterVM, mealVM) {
            print("更新了数据HYMealViewModel");
            mealVM?.updateFilters(filterVM);
            return mealVM as HYMealViewModel;
          }),
      ChangeNotifierProxyProvider<HYFilterViewModel,HYFavorViewModel>(
          create: (ctx) => HYFavorViewModel(),
          update: (ctx, filterVM, favorVM) {
            print("更新了数据HYFavorViewModel");
            favorVM?.updateFilters(filterVM);
            return favorVM as HYFavorViewModel;
          }),
      // ChangeNotifierProvider(
      //   create: (ctx) => HYFavorViewModel(),
      // ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 对HYSizeFit进行初始化
    HYSizeFit.initialize();

    return MaterialApp(
      title: '美食广场',
      // 主题
      theme: HYAppTheme.norTheme,
      initialRoute: HYRouter.initialRoute,
      routes: HYRouter.routes,
      onGenerateRoute: HYRouter.generateRoute,
      onUnknownRoute: HYRouter.unknownRoute,
    );
  }
}
