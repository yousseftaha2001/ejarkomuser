import 'package:get/get.dart';

import 'controller.dart';

class FinishedadscompanyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinishedadscompanyController>(() => FinishedadscompanyController());
  }
}
