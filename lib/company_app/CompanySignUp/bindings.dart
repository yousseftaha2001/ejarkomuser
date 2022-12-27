import 'package:get/get.dart';

import 'controller.dart';

class CompanysignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanysignupController>(() => CompanysignupController());
  }
}
