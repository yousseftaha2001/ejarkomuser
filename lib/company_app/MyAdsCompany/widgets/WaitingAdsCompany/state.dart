import 'package:get/get.dart';

import '../../../../app/Ads/models/all_ads_request/ad.dart';
import '../../../../utils/http_manager/create_ad_http.dart';

class WaitingadscompanyState {
  // title

   RxBool gettingState = false.obs;
   CreateAdHttp createAdHttp=CreateAdHttp();
   List<Ad> ads=[];
   RxBool cancelState = false.obs;
}
