import 'package:get/get.dart';

import 'controller.dart';

class CancledadscompanyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancledadscompanyController>(() => CancledadscompanyController());
  }
}
