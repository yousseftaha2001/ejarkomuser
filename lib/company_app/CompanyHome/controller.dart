import 'package:ejarkom/app/build/widgets/rend_indicator.dart';
import 'package:ejarkom/company_app/CompanyLogin/index.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/method.dart';
import '../../utils/my_database.dart';
import '../CompanyData/models/profile_request_model.dart';
import 'index.dart';

class CompanyhomeController extends GetxController {
  CompanyhomeController();
   void changePageState() =>
      state.gettingState.value = !state.gettingState.value;

  void getPage() async {
    changePageState();
    var result = await AuthManger.getRequestHelper(api: profileCompanyAPI);
    result.fold(
      (l) {
        // state.error = l.error;
        changePageState();
      },
      (r) {
        // AdsRequestModel adsRequestModel = AdsRequestModel.fromJson(r);
        state.profile = ProfileRequestModel.fromJson(r);
        changePageState();
      },
    );
  }
  final state = CompanyhomeState();
  void changeLogoutState() =>
      state.logoutState.value = !state.logoutState.value;
       void logoutMethod() async {
    Get.dialog(
      CircularDialog(),
      barrierDismissible: false,
      barrierColor: Colors.black87,
    );
    var result = await AuthManger.logoutHTTPC();
    result.fold(
      (l) {
        Get.back();
        Get.snackbar('Error', 'Check your internet Connection');
      },
      (r) {
        MyDataBase.removeDate();
        Get.back();
        Get.offAll(() => CompanyloginPage());
      },
    );
  }
  //  void deleteMyAcocount() async {
  //   Get.dialog(
  //     CircularDialog(),
  //     barrierDismissible: false,
  //     barrierColor: Colors.black87,
  //   );
  //   print(state.userData.id!.toString());
  //   var result = await AuthManger.deleteAccount(state.userData.id!.toString());
  //   result.fold(
  //     (l) {
  //       Get.back();
  //       Get.snackbar('Error', 'Check your internet Connection');
  //     },
  //     (r) {
  //       MyDataBase.removeDate();
  //       Get.back();
  //       Get.offAll(() => LoginPage());
  //     },
  //   );
  // }

   void closeDrawer() {
    state.xOffset = 0;
    state.yOffset = 0;
    state.isDrawerOpen = false;
    update();
  }

  void openDrawer() {
    state.xOffset =isEnglish()? 490.w:-480.w;
    state.yOffset = 180.h;
    state.isDrawerOpen = true;
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
