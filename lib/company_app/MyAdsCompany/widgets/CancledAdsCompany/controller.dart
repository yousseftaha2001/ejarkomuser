import 'package:ejarkom/utils/apis.dart';
import 'package:get/get.dart';

import '../../../../app/Ads/models/all_ads_request/all_ads_request.dart';
import '../../../../utils/method.dart';
import 'index.dart';

class CancledadscompanyController extends GetxController {
  CancledadscompanyController();

  final state = CancledadscompanyState();
  void changePageState() =>
      state.gettingState.value = !state.gettingState.value;

  void getPage() async {
    changePageState();
    var result = await state.createAdHttp.getWaitingAds(api: getCaneldAdsCompany);
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changePageState();
  }

  void pageDone(AllAdsRequest adsRequest) {
    state.ads = adsRequest.ads!;
  }

  void pageError(String e) {
    // Get.snackbar('Error'.tr, e.toString());
    mySnackBar(title: 'Error'.tr,body: e.toString());
  }

  void updatePage()async{
    var result = await state.createAdHttp.getWaitingAds(api: getCaneldAdsCompany);
    result.fold((l) => pageError(l), (r) => pageDone(r));
    update();
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
    getPage();
    super.onInit();
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
