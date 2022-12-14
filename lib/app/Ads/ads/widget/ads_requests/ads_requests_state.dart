import 'package:ejarkom/app/Ads/models/MyAdsRequestsModel.dart';
import 'package:ejarkom/utils/http_manager/create_ad_http.dart';
import 'package:get/get.dart';

/// Generated by Flutter GetX Starter on 2022-10-17 03:08
class AdsRequestsState {
  AdsRequestsState() {
    createAdHttp = CreateAdHttp();
    requests = [];
  }
  RxBool gettingState = false.obs;
  RxBool checkMethodState = false.obs;
  RxBool actionState = false.obs;
  late CreateAdHttp createAdHttp;
  late List<Request> requests;
}
