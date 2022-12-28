import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:get/get.dart';

import '../../../../app/Ads/models/all_ads_request/all_ads_request.dart';
import '../../../../utils/method.dart';
import 'index.dart';

class WaitingadscompanyController extends GetxController {
  WaitingadscompanyController();

  final state = WaitingadscompanyState();
  void changePageState() =>
      state.gettingState.value = !state.gettingState.value;

  void getPage() async {
    changePageState();
    var result = await state.createAdHttp.getWaitingAds(api: getWaitAdsCompany);
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changePageState();
  }
  void updatePage()async{
    var result = await state.createAdHttp.getWaitingAds(api: getWaitAdsCompany);
    result.fold((l) => pageError(l), (r) => pageDone(r));
    update();
  }

  void changeCancelState() =>
      state.cancelState.value = !state.cancelState.value;

  void cancelAd({required String id}) async {
    changeCancelState();
    var result = await AuthManger.postRequestHelper(api: '$cancelAPIComapny$id');
    result.fold(
      (l) {
        Get.snackbar('Error'.tr, l.error);
      },
      (r) {
        Get.back();
        // getAds();
        getPage();
        Get.snackbar('Done'.tr, 'AD has been Canceled'.tr);
      },
    );
    changeCancelState();
  }

  void pageDone(AllAdsRequest adsRequest) {
    state.ads = adsRequest.ads!;
  }

  void pageError(String e) {
    // Get.snackbar('Error'.tr, e.toString());
    mySnackBar(title: 'Error'.tr,body: e.toString());
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
