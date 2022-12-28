import 'package:get/get.dart';

import 'controller.dart';

class AdsviewcompanyBinding implements Bindings {
  late String bid;
  AdsviewcompanyBinding(this.bid);
  @override
  void dependencies() {
    Get.lazyPut<AdsviewcompanyController>(() => AdsviewcompanyController(bid));
  }
}
