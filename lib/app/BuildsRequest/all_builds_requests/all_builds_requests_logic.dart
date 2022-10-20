/// Generated by Flutter GetX Starter on 2022-10-18 23:47
import 'package:ejarkom/app/BuildsRequest/models/ManagementsRequestsAll.dart';
import 'package:get/get.dart';

import 'all_builds_requests_state.dart';

class AllBuildsRequestsLogic extends GetxController {
  final state = AllBuildsRequestsState();
  void changePageState() =>
      state.gettingState.value = !state.gettingState.value;

  void getPage() async {
    changePageState();
    var result = await state.createAdHttp.getAllManagementRequests();
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changePageState();
  }

  void pageDone(ManagementsRequestsAll adsRequest) {
    state.ads = adsRequest.myData!;
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

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}