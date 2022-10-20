import 'package:get/get.dart';

import 'logic.dart';

class StartPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartPointLogic(), fenix: true);
    // Get.put(() => LoginBinding());
    // Get.put(() => HomePage());
  }
}
