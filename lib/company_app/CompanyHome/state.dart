import 'package:ejarkom/company_app/CompanyData/models/profile_request_model.dart';
import 'package:ejarkom/company_app/CompanyPacks/index.dart';
import 'package:ejarkom/company_app/MyAdsCompany/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/http_manager/profile_http.dart';
import '../CompanyData/view.dart';

class CompanyhomeState {
  // title
  
  // profileHttp = ProfileHttp();
  //   userData = DataUser();
  // }
  RxBool logoutState = false.obs;
  RxInt cureentScreen = 0.obs;
  ProfileRequestModel? profile;

  List<Widget> screens = [
    MyadscompanyPage(),
    CompanydataPage(),
  
    CompanypacksPage(),
    // MainPage(), //0
    // AdsView(),
    // AllPacksView(),
    // MyDataViewView(),
    // ViewAllRequests(),

    // ViewAllMyServices(),
    // MyChecksView(),
    // AllBuildsRequestsView(),
    // ProfileView(),
    // PdfViewPage(title: 'Help'),
    // PdfViewPage(title: 'privacy policy'),
  ];
  double xOffset = 0;
  double yOffset = 0;

   ProfileHttp profileHttp=ProfileHttp();
  // late DataUser userData;
  RxBool gettingState = false.obs;

  bool isDrawerOpen = false;
}
