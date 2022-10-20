import 'package:ejarkom/app/Ads/models/all_ads_request/ad.dart';
import 'package:ejarkom/utils/http_manager/create_ad_http.dart';
import 'package:get/state_manager.dart';

/// @description:
/// @author
/// @date: 2022-10-12 17:47:18
class WaittingListState {
  WaittingListState() {
    createAdHttp = CreateAdHttp();
    ads = [];
  }
  RxBool gettingState = false.obs;
  late CreateAdHttp createAdHttp;
  late List<Ad> ads;
}
