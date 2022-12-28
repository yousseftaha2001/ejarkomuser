import 'package:ejarkom/company_app/AdsViewCompany/models/ads.dart';
import 'package:ejarkom/company_app/AdsViewCompany/models/ads_request_model.dart';
import 'package:ejarkom/utils/models/local_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/Ads/models/all_ads_request/ad.dart';

class AdsviewcompanyState {
 RxInt pageState = 0.obs;

  AdCompany? ads;
  List<AdsRequest?> requests = [];
  LocalError? localError;
  RxInt currentImages = 0.obs;
   PageController pageControlle=PageController();
  RxBool actionState = false.obs;
  RxInt currentIndex = 0.obs;
    RxDouble containerH = (Get.height * 0.5).obs;
  RxInt containerIsOpened = 1.obs;
  // RxInt currentIndex = 0.obs;
}
