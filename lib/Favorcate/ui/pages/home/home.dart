import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/ui/pages/home/home_content.dart';

import 'home_app_bar.dart';

class HYHomeScreen extends StatelessWidget {
  const HYHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYHomeAppBar(context),
      body: const HYHomeContent(),
    );
  }
}
