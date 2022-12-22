/// Generated by Flutter GetX Starter on 2022-10-09 11:57
import 'dart:io';

import 'package:ejarkom/app/build/models/BuildViewModel.dart';
import 'package:ejarkom/app/build/widgets/data_error.dart';
import 'package:ejarkom/app/build/widgets/rend_indicator.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'build_state.dart';

class BuildLogic extends GetxController {
  final state = BuildState();
  late String id;

  BuildLogic({required this.id});

  void changeGetState() => state.getState.value = !state.getState.value;

  void changeH() {
    if (state.containerH.value == Get.height * 0.7) {
      state.containerH.value = Get.height * 0.5;
      state.containerIsOpened = 1.obs;
    } else {
      state.containerH.value = Get.height * 0.7;
      state.containerIsOpened = 2.obs;
    }
  }

  void changeContMode() {
    if (state.containerH.value == Get.height * 0.7 ||
        state.containerH.value == Get.height * 0.5) {
      state.containerH.value = Get.height * 0.1;
      state.containerIsOpened = 3.obs;
    } else {
      state.containerH.value = Get.height * 0.5;
      state.containerIsOpened = 1.obs;
    }
  }

  lan() async {
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse('${state.viewModel!.data!.video}'))) {
        await launch('${state.viewModel!.data!.video}', forceSafariVC: false);
      } else {
        if (await canLaunch('${state.viewModel!.data!.video}')) {
          await launch('${state.viewModel!.data!.video}');
        } else {
          throw 'Could not launch ${state.viewModel!.data!.video}';
        }
      }
    } else {
      var url = '${state.viewModel!.data!.video}';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
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
    // Get.snackbar('Error'.tr, e.toString());
    // Get.snackbar('Error'.tr, e.toString());
    mySnackBar(title: 'Error'.tr,body: e.toString());
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
        // Get.snackbar('Message'.tr, l, duration: Duration(seconds: 10));
        mySnackBar(title: 'Message'.tr,body: l.toString());
      }
    }, (r) {
      Get.back();
      // Get.snackbar('Done'.tr, 'Your request has been send'.tr);
      mySnackBar(title: 'Done'.tr,body: 'Your request has been send'.tr);
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
