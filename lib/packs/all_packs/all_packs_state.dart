import 'package:ejarkom/packs/models/AllPacksModel.dart';
import 'package:ejarkom/utils/http_manager/packs_http.dart';
import 'package:get/get.dart';

/// Generated by Flutter GetX Starter on 2022-10-11 23:49
class AllPacksState {
  AllPacksState() {
    packsHttp = PacksHttp();
  }
  RxBool pageIsHere = false.obs;
  RxBool addPackState = false.obs;
  List<PandleAds> pandles = [];
  late PacksHttp packsHttp;
}
