import 'dart:ui';

import 'package:ejarkom/app/main/models/PageOneModel.dart';
import 'package:ejarkom/utils/http_manager/main_screen_http.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loop_page_view/loop_page_view.dart';

class MainState {
  MainState() {
    mainScreenHTTP = MainScreenHTTP();
  }
  RxBool pageIsHere = false.obs;
  PageOneModel? pageOneModel;
  late MainScreenHTTP mainScreenHTTP;
  final LoopPageController controller = LoopPageController();
  RxInt adsIndex = 0.obs;
  List<Color> c = [
    Colors.red,
    Colors.grey,
    Colors.green,
  ];
}
