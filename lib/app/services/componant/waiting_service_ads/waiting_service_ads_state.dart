
import 'package:ejarkom/app/services/models/my_ser_model/myserve.dart';
import 'package:ejarkom/utils/http_manager/services_htt.dart';
import 'package:get/get.dart';

/// Generated by Flutter GetX Starter on 2022-10-16 04:01
class WaitingServiceAdsState {
  WaitingServiceAdsState() {
    servicesHttp = ServicesHttp();
    services = [];
  }
  late ServicesHttp servicesHttp;
  RxBool gettingState = false.obs;
  late List<Myserve> services;
}
