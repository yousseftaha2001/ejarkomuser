import 'package:get/get.dart';

import 'controller.dart';

class MyadscompanyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyadscompanyController>(() => MyadscompanyController());
  }
}
