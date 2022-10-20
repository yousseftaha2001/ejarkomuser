import 'package:ejarkom/app/requests/models/AllRequestsModel.dart';
import 'package:ejarkom/app/requests/models/requests/ad.dart';
import 'package:ejarkom/utils/http_manager/requests_http.dart';
import 'package:get/get.dart';

/// Generated by Flutter GetX Starter on 2022-10-14 22:28
class RejectedRequestState {
  RejectedRequestState() {
    requestsHttp = RequestsHttp();
    ads = [];
  }
  RxBool gettingState = false.obs;
  late RequestsHttp requestsHttp;
  late List<RequestAd> ads;
}
