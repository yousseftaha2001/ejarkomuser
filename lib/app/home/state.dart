import 'package:ejarkom/app/Ads/ads/ads_view.dart';
import 'package:ejarkom/app/complete_data/complete_data_view.dart';
import 'package:ejarkom/app/complete_data/my_data_view/my_data_view_view.dart';
import 'package:ejarkom/app/main/main_view.dart';
import 'package:ejarkom/app/my_checks/my_checks_view.dart';
import 'package:ejarkom/app/pdf_view/pdf_view_view.dart';
import 'package:ejarkom/app/profile/models/ProfileModel.dart';
import 'package:ejarkom/app/profile/profile/profile_view.dart';
import 'package:ejarkom/app/requests/view_all_requests.dart';
import 'package:ejarkom/app/services/my_services/view_all_my_services.dart';

import 'package:ejarkom/packs/all_packs/all_packs_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/http_manager/profile_http.dart';
import '../BuildsRequest/all_builds_requests/all_builds_requests_view.dart';

class HomeState {
  HomeState() {
    profileHttp = ProfileHttp();
    userData = DataUser();
  }
  RxBool logoutState = false.obs;
  RxInt cureentScreen = 0.obs;

  List<Widget> screens = [
    MainPage(), //0
    AdsView(),
    AllPacksView(),
    MyDataViewView(),
    ViewAllRequests(),

    ViewAllMyServices(),
    MyChecksView(),
    AllBuildsRequestsView(),
    ProfileView(),
    PdfViewPage(),
  ];
  double xOffset = 0;
  double yOffset = 0;

  late ProfileHttp profileHttp;
  late DataUser userData;
  RxBool gettingState = false.obs;

  bool isDrawerOpen = false;
}
