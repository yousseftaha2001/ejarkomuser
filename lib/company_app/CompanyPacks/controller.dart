import 'package:ejarkom/company_app/CompanyPacks/models/packs_request_model.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:get/get.dart';

import 'index.dart';

class CompanypacksController extends GetxController {
  CompanypacksController();

  final state = CompanypacksState();
    void changePageState({required int newState}) =>
      state.pageState.value = newState;

  void changeAddState() => state.addPackState.value = !state.addPackState.value;

  void getPage() async {
    changePageState(newState: 1);
    var result = await AuthManger.getRequestHelper(api: packsCompanyAPI);
    result.fold(
      (l) {
        state.error = l.error;
        changePageState(newState: 2);
      },
      (r) {
        // AdsRequestModel adsRequestModel = AdsRequestModel.fromJson(r);
        state.packsRequestModel = PacksRequestModel.fromJson(r);
        changePageState(newState: 3);
        update();
      },
    );
  }

  void buyPack(String id) async {
    changeAddState();
    var result = await AuthManger.getRequestHelper(api: '$buyPackAPI$id');
    result.fold(
      (l) {
        changeAddState();
        Get.snackbar('Error', l.error);
      },
      (r) {
        changeAddState();
        Get.back();
        Get.snackbar('Done', 'you have subscribed to this package');
      },
    );
  }

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    getPage();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
