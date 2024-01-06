import 'package:get/get.dart';


import 'getx_controller_example_state.dart';

class GetxControllerExampleLogic extends GetxController {
  final GetxControllerExampleState state = GetxControllerExampleState();
  void convertToUpperCase() {
    state.teacher.name.value = state.teacher.name.value.toUpperCase();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}


