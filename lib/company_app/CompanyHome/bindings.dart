import 'package:get/get.dart';

import 'controller.dart';

class CompanyhomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyhomeController>(() => CompanyhomeController());
  }
}
