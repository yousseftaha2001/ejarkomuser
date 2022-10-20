import 'package:ejarkom/app/requests/models/AllRequestsModel.dart';
import 'package:ejarkom/app/requests/models/requests/ad.dart';
import 'package:ejarkom/utils/http_manager/requests_http.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class WaitingRequestsState {
  WaitingRequestsState() {
    requestsHttp = RequestsHttp();
    ads = [];
  }
  RxBool gettingState = false.obs;
  late RequestsHttp requestsHttp;
  late List<RequestAd> ads;
}
