import 'package:ejarkom/app/build/widgets/rend_indicator.dart';
import 'package:ejarkom/app/login/view.dart';
import 'package:ejarkom/app/profile/models/ProfileModel.dart';
import 'package:ejarkom/app/start_point/view.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

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

  void changeLogoutState() =>
      state.logoutState.value = !state.logoutState.value;
  void changePageState() =>
      state.gettingState.value = !state.gettingState.value;

  void getPage() async {
    changePageState();
    var result = await state.profileHttp.getProfile();
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changePageState();
  }

  void pageDone(ProfileModel profileModel) {
    state.userData = profileModel.dataUser!;
  }

  void pageError(String e) {
    Get.snackbar('Error'.tr, e.toString());
  }

  void logoutMethod() async {
    Get.dialog(
      CircularDialog(),
      barrierDismissible: false,
      barrierColor: Colors.black87,
    );
    var result = await AuthManger.logoutHTTP();
    result.fold(
      (l) {
        Get.back();
        Get.snackbar('Error', 'Check your internet Connection');
      },
      (r) {
        MyDataBase.removeDate();
        Get.back();
        Get.offAll(() => LoginPage());
      },
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void closeDrawer() {
    state.xOffset = 0;
    state.yOffset = 0;
    state.isDrawerOpen = false;
    update();
  }

  void openDrawer() {
    state.xOffset = 290.w;
    state.yOffset = 80.h;
    state.isDrawerOpen = true;
    update();
  }
}
