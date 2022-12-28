import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/Ads/models/GetBuildTypeModel.dart';
import '../../app/Ads/models/GetCityModel.dart';
import '../../app/Ads/models/Zone.dart';

class CraeteadscompanyState {
RxString nameA = ''.obs;
  RxString nameE = ''.obs;
  RxString desA = ''.obs;
  RxString desE = ''.obs;
  RxString cost = ''.obs;
  RxString costType = 'Monthly'.tr.obs;
  RxString addressE = ''.obs;
  RxString addressA = ''.obs;
  RxString video = ''.obs;
  RxInt langOption=0.obs;

  RxString numOfRoom = ''.obs;
  RxString numOfBathRoom = ''.obs;
  // RxString city=''.obs;

  City? selectedCity;
  Zone? selectedZone;
  TypeBuild? selectedBuildType;

  late List<City?> cities = [];
  late List<Zone?> zones = [];
  List<TypeBuild?> typeBuilds = [];
  List<Uint8List> photos = [];
  // Rxn<Uint8List> video = Rxn(Uint8List(0));

  RxBool createAdsState = false.obs;
  RxInt currentIndex = 0.obs;

  RxBool gettingCities = false.obs;
  RxBool gettingZones = false.obs;
  RxBool gettingBuildTypes = false.obs;
  RxBool furnished=false.obs;
  PageController pageController = PageController();

  List<String> costTypes = [
    'Daily'.tr,
    'Weekly'.tr,
    'Monthly'.tr,
    'Quarterly'.tr,
    'half a year'.tr,
    'Annually'.tr,  
  ];
}
