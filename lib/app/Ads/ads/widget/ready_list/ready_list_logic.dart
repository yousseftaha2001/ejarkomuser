import 'package:ejarkom/app/Ads/models/all_ads_request/all_ads_request.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:get/get.dart';

import 'ready_list_state.dart';

/// @description:
/// @author
/// @date: 2022-10-12 18:48:43
class ReadyListLogic extends GetxController {
  final state = ReadyListState();
  void changePageState() =>
      state.gettingState.value = !state.gettingState.value;

  void getPage() async {
    changePageState();
    var result = await state.createAdHttp.getWaitingAds(api: getReadyAdsAPI);
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changePageState();
  }

  void pageDone(AllAdsRequest adsRequest) {
    state.ads = adsRequest.ads!;
  }

  void pageError(String e) {
    Get.snackbar('Error'.tr, e.toString());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPage();
  }
}
