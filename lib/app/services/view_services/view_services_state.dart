import 'package:ejarkom/app/services/models/service_section_model/ads_serve.dart';
import 'package:ejarkom/app/services/view_services/models/one_services/one_services.dart';
import 'package:ejarkom/utils/http_manager/services_htt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// @description:
/// @author
/// @date: 2022-10-22 03:07:05
class ViewServicesState {
  ViewServicesState() {
    servicesHttp = ServicesHttp();
    pageController = PageController();
  }
  // late ServiceAds serviceAds;
  late ServicesHttp servicesHttp;
  RxBool getState = false.obs;
  late PageController pageController;
  RxInt currentIndex = 0.obs;
  RxInt currentImages = 0.obs;
  RxDouble containerH = (Get.height * 0.5).h.obs;
  RxBool containerIsOpened = false.obs;
  late OneServices serve;
}
