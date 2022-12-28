import 'package:get/get.dart';

import 'controller.dart';

class WaitingadscompanyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingadscompanyController>(() => WaitingadscompanyController());
  }
}
