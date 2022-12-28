import 'package:get/get.dart';

import 'models/packs_request_model.dart';

class CompanypacksState {
  String? error;
  // String? errorD;
  RxInt pageState = 0.obs;
  PacksRequestModel? packsRequestModel;
  RxBool addPackState = false.obs;
}
