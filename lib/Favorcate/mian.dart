import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/router/router.dart';
import 'package:my_app/Favorcate/core/viewmodel/favor_view_model.dart';
import 'package:my_app/Favorcate/core/viewmodel/meal_view_model.dart';
import 'package:my_app/Favorcate/ui/shared/app_theme.dart';
import 'package:provider/provider.dart';

import '../day14_screenfit/shared/size_fit.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => HYMealViewModel(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => HYFavorViewModel(),
          ),
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
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text("美食广场"),
      //   ),
      //   body: Center(
      //     child: Text("data"),
      //   ),
      // ),
    );
  }
}
