import 'package:ejarkom/app/Ads/models/all_ads_request/all_ads_request.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:get/get.dart';

import 'done_list_state.dart';

/// @description:
/// @author
/// @date: 2022-10-12 18:18:48
class DoneListLogic extends GetxController {
  final state = DoneListState();
  void changePageState() =>
      state.gettingState.value = !state.gettingState.value;

  void getPage() async {
    changePageState();
    var result = await state.createAdHttp.getWaitingAds(api: getDoneAdsAPI);
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
