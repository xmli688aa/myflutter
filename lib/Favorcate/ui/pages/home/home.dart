import 'package:flutter/material.dart';
import 'package:my_app/14_screenfit/extension/int_extension.dart';
import 'package:my_app/Favorcate/ui/pages/home/home_content.dart';
import 'package:my_app/Favorcate/ui/pages/home/home_drawer.dart';

import 'home_app_bar.dart';

class HYHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYHomeAppBar(),
      body: HYHomeContent(),
      drawer:HYHomeDrawer(),
    );
  }
}
