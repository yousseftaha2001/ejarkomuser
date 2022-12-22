import 'package:ejarkom/app/build/widgets/rend_indicator.dart';
import 'package:ejarkom/app/login/view.dart';
import 'package:ejarkom/app/profile/models/ProfileModel.dart';
import 'package:ejarkom/app/start_point/view.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  // void li(){
  //   StreamSubscription? _sub;

  // Future<void> initUniLinks() async {
  //   // ... check initialUri

  //   // Attach a listener to the stream
  //   _sub = uriLinkStream.listen((Uri? uri) {
  //     // Use the uri and warn the user, if it is not correct
  //   }, onError: (err) {
  //     // Handle exception by warning the user their action did not succeed
  //   });

  //   // NOTE: Don't forget to call _sub.cancel() in dispose()
  // }
  // }

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
  void deleteMyAcocount() async {
    Get.dialog(
      CircularDialog(),
      barrierDismissible: false,
      barrierColor: Colors.black87,
    );
    print(state.userData.id!.toString());
    var result = await AuthManger.deleteAccount(state.userData.id!.toString());
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
    state.xOffset =isEnglish()? 490.w:-480.w;
    state.yOffset = 180.h;
    state.isDrawerOpen = true;
    update();
  }
}
