import 'dart:async';
import 'dart:convert';

import 'package:ejarkom/app/home/logic.dart';
import 'package:ejarkom/app/home/state.dart';
import 'package:ejarkom/app/login/view.dart';
import 'package:ejarkom/app/main/models/PageOneModel.dart';
import 'package:ejarkom/app/view_all/view_all_logic.dart';
import 'package:ejarkom/app/view_all/view_all_view.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:ejarkom/utils/push.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  void changePageState() => state.pageIsHere.value = !state.pageIsHere.value;

  void getPage() async {
    changePageState();
    var result = await state.mainScreenHTTP.getAllPage();
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changePageState();
  }

  void pageDone(PageOneModel pageOneModel) {
    state.pageOneModel = pageOneModel;
    if (state.pageOneModel!.ads1!.isNotEmpty) {
      Timer.periodic(Duration(seconds: 2), (timer) {
        if (state.adsIndex.value == state.pageOneModel!.ads1!.length) {
          state.controller.animateToPage(
            0,
            duration: Duration(milliseconds: 100),
            curve: Curves.easeIn,
          );
        } else {
          state.controller.animateToPage(
            state.adsIndex.value++,
            duration: Duration(milliseconds: 100),
            curve: Curves.easeIn,
          );
        }
      });
    }
  }

  void pageError(String e) {
    // Get.snackbar('Error'.tr, e.toString());
    mySnackBar(title: 'Error'.tr, body: e.toString());
    print(e.toString()+'d');
    if(e=='L'){
        MyDataBase.removeDate();
        Get.back();
        Get.offAll(() => LoginPage());
    }
  }

  void gotoAll(String id) {
    Get.put(ViewAllLogic(id: id.toString()), permanent: true);
    Get.to(() => ViewAllView());
  }

  Future<void> newPusher() async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    try {
      await pusher.init(
          apiKey: key,
          cluster: cluster,
          onConnectionStateChange: (String? c, String? v) {},
          onError: (String? v, int? a, dynamic b) {},
          onSubscriptionSucceeded: (String? c, dynamic b) {},
          onEvent: (event) {
            // print(jsonDecode(event.data.toString()));

            if (event.eventName != 'pusher:pong') {
              var formatedData = jsonDecode(event.data);
              var id = MyDataBase.getId();
              print(event.eventName);
              // print(formatedData);

              if (formatedData['id'] == id) {
                print(event.eventName);
                if (event.eventName.contains('user_data')) {
                  infoNotiiftcaion();
                }
                if (event.eventName.contains('serves')) {
                  serviceNotiifction(formatedData['stute2']);
                }
                if (event.eventName.contains('ads')) {
                  adsNotiifction(formatedData['stute2']);
                  print(formatedData);
                  print('ss');
                }
                if (event.eventName.contains('my_requsts')) {
                  requestsNotiifction(formatedData['stute2']);
                  print(formatedData);
                  print('ss');
                }
                if (event.eventName.contains('chachups')) {
                  checkUpNotiication();
                  print(formatedData);
                  print('ss');
                }
                if (event.eventName.contains('managent')) {
                  checkUpNotiication();
                  print(formatedData);
                  print('ss');
                }
              }

              // print(event.data);
            }
          });
      await pusher.subscribe(channelName: 'user');
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e");
    }
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPage();
    newPusher();
  }

  void infoNotiiftcaion() {
    HomeState homeState = Get.find<HomeLogic>().state;
    HomeLogic logic = Get.find();
    Get.snackbar(
      'Message'.tr,
      'Your data has a response'.tr,
      backgroundColor: Colors.black.withOpacity(0.3),
      barBlur: 40.sp,
      duration: Duration(seconds: 10),
      onTap: (snack) {
        print(snack.barBlur);

        homeState.cureentScreen.value = 3;
        // homeState.isDrawerOpen
        //     ? logic.closeDrawer()
        //     : logic.openDrawer();
      },
      colorText: Colors.white,
      icon: Image.asset(
        'assets/images/logo.jpg',
        height: 50.h,
      ),
    );
  }

  void checkUpNotiication() {
    HomeState homeState = Get.find<HomeLogic>().state;
    HomeLogic logic = Get.find();
    Get.snackbar(
      'Message'.tr,
      'Your CheckUp has a response'.tr,
      backgroundColor: Colors.black.withOpacity(0.3),
      barBlur: 40.sp,
      duration: Duration(seconds: 10),
      onTap: (snack) {
        print(snack.barBlur);

        homeState.cureentScreen.value = 6;
        // homeState.isDrawerOpen
        //     ? logic.closeDrawer()
        //     : logic.openDrawer();
      },
      colorText: Colors.white,
      icon: Image.asset(
        'assets/images/logo.jpg',
        height: 50.h,
      ),
    );
  }

  void managementNotiication() {
    HomeState homeState = Get.find<HomeLogic>().state;
    HomeLogic logic = Get.find();
    Get.snackbar(
      'Message'.tr,
      'Your Managment Request has a response'.tr,
      backgroundColor: Colors.black.withOpacity(0.3),
      barBlur: 40.sp,
      duration: Duration(seconds: 10),
      onTap: (snack) {
        print(snack.barBlur);

        homeState.cureentScreen.value = 7;
        // homeState.isDrawerOpen
        //     ? logic.closeDrawer()
        //     : logic.openDrawer();
      },
      colorText: Colors.white,
      icon: Image.asset(
        'assets/images/logo.jpg',
        height: 50.h,
      ),
    );
  }

  void serviceNotiifction(String state2) {
    print('te');
    HomeState homeState = Get.find<HomeLogic>().state;
    HomeLogic logic = Get.find();
    Get.snackbar(
      'Message'.tr,
      'Your Services ads is now $state2'.tr,
      backgroundColor: Colors.black.withOpacity(0.3),
      barBlur: 40.sp,
      duration: Duration(seconds: 10),
      onTap: (snack) {
        print(snack.barBlur);

        homeState.cureentScreen.value = 5;
        Get.back();
        // homeState.isDrawerOpen
        //     ? logic.closeDrawer()
        //     : logic.openDrawer();
      },
      colorText: Colors.white,
      icon: Image.asset(
        'assets/images/logo.jpg',
        height: 50.h,
      ),
    );
  }

  void requestsNotiifction(String state2) {
    print('te');
    HomeState homeState = Get.find<HomeLogic>().state;
    HomeLogic logic = Get.find();
    logic.getPage();
    Get.snackbar(
      'Message'.tr,
      '${'Your Request is now'.tr} $state2'.tr,
      backgroundColor: Colors.black.withOpacity(0.3),
      barBlur: 40.sp,
      duration: Duration(seconds: 10),
      onTap: (snack) {
        print(snack.barBlur);

        homeState.cureentScreen.value = 4;
        Get.back();
        // homeState.isDrawerOpen
        //     ? logic.closeDrawer()
        //     : logic.openDrawer();
      },
      colorText: Colors.white,
      icon: Image.asset(
        'assets/images/logo.jpg',
        height: 50.h,
      ),
    );
  }

  void adsNotiifction(String state2) {
    print('te');
    HomeState homeState = Get.find<HomeLogic>().state;
    HomeLogic logic = Get.find();
    Get.snackbar(
      'Message'.tr,
      '${'Your Ads is now'.tr} $state2'.tr,
      backgroundColor: Colors.black.withOpacity(0.3),
      barBlur: 40.sp,
      duration: Duration(seconds: 10),
      onTap: (snack) {
        print(snack.barBlur);

        homeState.cureentScreen.value = 1;
        Get.back();
        // homeState.isDrawerOpen
        //     ? logic.closeDrawer()
        //     : logic.openDrawer();
      },
      colorText: Colors.white,
      icon: Image.asset(
        'assets/images/logo.jpg',
        height: 50.h,
      ),
    );
  }

  mySnack({required String title, required String body, required var onTap}) {
    return Get.snackbar(
      title.tr,
      body.tr,
      backgroundColor: Colors.black.withOpacity(0.3),
      barBlur: 40.sp,
      duration: Duration(seconds: 6),
      onTap: onTap,
      colorText: Colors.white,
      icon: Image.asset(
        'assets/images/logo.jpg',
        height: 50.h,
      ),
    );
  }
}
