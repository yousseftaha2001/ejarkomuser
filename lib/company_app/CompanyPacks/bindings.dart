import 'package:get/get.dart';

import 'controller.dart';

class CompanypacksBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanypacksController>(() => CompanypacksController());
  }
}
