import 'dart:convert';

import 'package:ejarkom/app/Ads/models/all_ads_request/all_ads_request.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:ejarkom/utils/push.dart';
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import 'done_list_state.dart';

/// @description:
/// @author
/// @date: 2022-10-12 18:18:48
class DoneListLogic extends GetxController {
  final state = DoneListState();
  void changePageState() =>
      state.gettingState.value = !state.gettingState.value;

  void getPage() async {
    changePageState();
    var result = await state.createAdHttp.getWaitingAds(api: getDoneAdsAPI);
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changePageState();
  }


  void updatePage()async{
    var result = await state.createAdHttp.getWaitingAds(api: getDoneAdsAPI);
    result.fold((l) => pageError(l), (r) => pageDone(r));
    update();
  }
  Future<void> newPusher() async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    try {
      await pusher.init(
          apiKey: key,
          cluster: cluster,
          onConnectionStateChange: (String? c, String? v) {},
          onError: (String? v, int? a, dynamic b) {},
          onSubscriptionSucceeded: (String? c, dynamic b) {},
          onEvent: (event) {
            // print(jsonDecode(event.data.toString()));

            if (event.eventName != 'pusher:pong') {
              var formatedData = jsonDecode(event.data);
              var id = MyDataBase.getId();
              print(event.eventName);
              // print(formatedData);


              if (formatedData['id'] == id) {
                print(event.eventName);
                if (event.eventName.contains('ads')) {
                  // infoNotiiftcaion();

                  updatePage();
                }

              }

              // print(event.data);
            }
          });
      await pusher.subscribe(channelName: 'user');
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e");
    }
  }

  void pageDone(AllAdsRequest adsRequest) {
    state.ads = adsRequest.ads!;
  }

  void pageError(String e) {
    // Get.snackbar('Error'.tr, e.toString());
    mySnackBar(title: 'Error'.tr,body: e.toString());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPage();
    newPusher();
  }
}
