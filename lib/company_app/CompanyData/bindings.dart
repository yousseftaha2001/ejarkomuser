import 'package:get/get.dart';

import 'controller.dart';

class CompanydataBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanydataController>(() => CompanydataController());
  }
}
