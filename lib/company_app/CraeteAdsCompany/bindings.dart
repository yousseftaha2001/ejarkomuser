import 'package:get/get.dart';

import 'controller.dart';

class CraeteadscompanyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CraeteadscompanyController>(() => CraeteadscompanyController());
  }
}
