import 'package:ejarkom/app/Ads/models/all_ads_request/ad.dart';
import 'package:ejarkom/utils/http_manager/create_ad_http.dart';
import 'package:get/get.dart';

/// @description:
/// @author
/// @date: 2022-10-12 18:18:48
class DoneListState {
  DoneListState() {
    createAdHttp = CreateAdHttp();
    ads = [];
  }
  RxBool gettingState = false.obs;
  late CreateAdHttp createAdHttp;
  late List<Ad> ads;
}
