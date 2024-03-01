import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_global_controller.dart';
import 'getx_second_logic.dart';

class GetxSecondPage extends StatelessWidget {
  static String routeName = "/GetxSecondPage";
  const GetxSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(GetxSecondLogic());
    final state = Get.find<GetxSecondLogic>().state;

    final AppGlobalController globalController  = Get.put(AppGlobalController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetxSecondPage'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            globalController.userName.value= "哼哼哈嘿";
          }, child: const Text("修改globalController的userName改成哼哼哈嘿")),
        ],
      ),
    );
  }
}
