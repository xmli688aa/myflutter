import 'package:get/get.dart';
import 'package:my_app/17_template/pages/08_GetX%E7%9A%84%E4%BD%BF%E7%94%A8/GetXController/getx_controller_example/getx_second_page/getx_second_view.dart';


import 'getx_controller_example_state.dart';

class GetxControllerExampleLogic extends GetxController {
  final GetxControllerExampleState state = GetxControllerExampleState();
  void convertToUpperCase() {
    state.teacher.name.value = state.teacher.name.value.toUpperCase();
    update();
  }
 void jumpToSecondPage(){
    Get.toNamed(GetxSecondPage.routeName);
 }


}


