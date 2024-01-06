import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_controller_example_logic.dart';

class GetxControllerExamplePage extends StatefulWidget {
  static String routeName = "/GetxControllerExamplePage";
  const GetxControllerExamplePage({Key? key}) : super(key: key);

  @override
  State<GetxControllerExamplePage> createState() => _GetxControllerExamplePageState();
}

class _GetxControllerExamplePageState extends State<GetxControllerExamplePage> {
  final logic = Get.put(GetxControllerExampleLogic());
  final state = Get.find<GetxControllerExampleLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetxControllerExamplePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("姓名是：${state.teacher.name}")),
            ElevatedButton(onPressed: (){
              logic.convertToUpperCase();
            }, child: Text("改成大写")),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<GetxControllerExampleLogic>();
    super.dispose();
  }
}