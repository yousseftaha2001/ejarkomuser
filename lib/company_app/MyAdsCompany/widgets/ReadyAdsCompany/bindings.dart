import 'package:get/get.dart';

import 'controller.dart';

class ReadyadscompanyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadyadscompanyController>(() => ReadyadscompanyController());
  }
}
