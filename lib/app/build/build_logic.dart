/// Generated by Flutter GetX Starter on 2022-10-09 11:57
import 'package:ejarkom/app/build/models/BuildViewModel.dart';
import 'package:ejarkom/app/build/widgets/data_error.dart';
import 'package:ejarkom/app/build/widgets/rend_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'build_state.dart';

class BuildLogic extends GetxController {
  final state = BuildState();
  late String id;

  BuildLogic({required this.id});

  void changeGetState() => state.getState.value = !state.getState.value;

  void changeH() {
    if (state.containerH.value == Get.height * 0.95.h) {
      state.containerH.value = Get.height * 0.45.h;
      state.containerIsOpened = false.obs;
    } else {
      state.containerH.value = Get.height * 0.95.h;
      state.containerIsOpened = true.obs;
    }
  }

  void getAd() async {
    changeGetState();
    var result = await state.mainScreenHTTP.buildView(id: id.toString());
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changeGetState();
  }

  void pageDone(BuildViewModel viewModel) {
    state.viewModel = viewModel;
  }

  void pageError(String e) {
    Get.snackbar('Error'.tr, e.toString());
  }

  void rentMethod() async {
    Get.dialog(CircularDialog(),
        barrierDismissible: false, barrierColor: Colors.black54);
    var result = await state.rentHttp
        .rentBuild(id: state.viewModel!.data!.id!.toString());
    result.fold((l) {
      if (l == 'please Complate Your Date') {
        Get.back();
        Get.dialog(
          DataErrorDialog(),
          barrierDismissible: false,
        );
      } else {
        Get.back();
        Get.snackbar('Message'.tr, l, duration: Duration(seconds: 10));
      }
    }, (r) {
      Get.back();
      Get.snackbar('Done', 'Your request has been send'.tr);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAd();
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
