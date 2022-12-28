import 'dart:io';

import 'package:ejarkom/app/Ads/models/all_ads_request/ad.dart';
import 'package:ejarkom/company_app/AdsViewCompany/models/ads.dart';
import 'package:ejarkom/company_app/AdsViewCompany/models/ads_request_model.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'index.dart';

class AdsviewcompanyController extends GetxController {
  AdsviewcompanyController(this.bid);
  late String bid;

  final state = AdsviewcompanyState();
  void changePageState({required int newState}) =>
      state.pageState.value = newState;

  void changeActionState() =>
      state.actionState.value = !state.actionState.value;

  void getAds() async {
    changePageState(newState: 1);
    var result = await AuthManger.getRequestHelper(api: '$buildAdsAPICompany$bid');
    result.fold(
      (l) {
        state.localError = l;
        changePageState(newState: 2);
      },
      (r2) async {
        var result =
            await AuthManger.getRequestHelper(api: '$adsRequestsAPICompany$bid');
        result.fold(
          (l) {
            state.localError = l;
            changePageState(newState: 2);
          },
          (r) {
            print(r);
            state.requests = AdsRequestsModel.fromJson(r).reqest!;

            state.ads = AdCompany.fromJson(r2['data']);

            changePageState(newState: 3);
          },
        );
      },
    );
    update();
  }

  void actionDialog({required String type, required String id}) async {
    changeActionState();

    if (type == 'reject') {
      var result =
          await AuthManger.actionOnRequest(id: id, api: rejectRequestAPICompany);
      result.fold(
        (l) {
          changeActionState();
          Get.back();
          Get.snackbar(
            'Error'.tr,
            l,
            duration: const Duration(seconds: 5),
            icon: Icon(
              Icons.close,
              color: Colors.red,
              size: 45.sp,
            ),
          );
        },
        (r) {
          changeActionState();
          getAds();
          Get.back();
          Get.snackbar(
            'Error'.tr,
            'This Request has been rejected'.tr,
            duration: const Duration(seconds: 5),
            icon: Icon(
              Icons.check,
              color: Colors.green,
              size: 45.sp,
            ),
          );
        },
      );
    } else {
      var result =
          await AuthManger.actionOnRequest(id: id, api: acceptRequestAPICompany);
      result.fold(
        (l) {
          changeActionState();
          Get.back();
          print(l);
          Get.snackbar(
            'Error'.tr,
            l,
            duration: const Duration(seconds: 5),
            icon: Icon(
              Icons.close,
              color: Colors.red,
              size: 45.sp,
            ),
          );
        },
        (r) {
          // changeCheckMethodState();
          
          print(Get.isSnackbarOpen);
          Get.back();
          getAds();
          Get.snackbar(
            'Done'.tr,
            'This Request has been Approved'.tr,
            duration: const Duration(seconds: 5),
            icon: Icon(
              Icons.check,
              color: Colors.green,
              size: 45.sp,
            ),
          );
        },
      );
    }
  }

  // void changeActionState() =>
  //     state.actionState.value = !state.actionState.value;

  void getAdsRequests() async {
    var result = await AuthManger.getRequestHelper(api: adsRequestsAPICompanya);
    result.fold(
      (l) {
        state.localError = l;
      },
      (r) {
        state.requests = AdsRequestsModel.fromJson(r).reqest!;
      },
    );
  }

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }
  lan() async {
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse('${state.ads!.video}'))) {
        await launch('${state.ads!.video}', forceSafariVC: false);
      } else {
        if (await canLaunch('${state.ads!.video}')) {
          await launch('${state.ads!.video}');
        } else {
          throw 'Could not launch ${state.ads!.video}';
        }
      }
    } else {
      var url = '${state.ads!.video}';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
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


  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
        getAds();
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
