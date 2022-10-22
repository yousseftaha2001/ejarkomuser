import 'dart:io';
import 'dart:typed_data';

import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:ejarkom/app/Ads/models/Zone.dart';
import 'package:ejarkom/app/services/models/service_type_model/type_serve.dart';
import 'package:ejarkom/app/services/models/services_pandles_ads_model/pandle_serve.dart';
import 'package:ejarkom/app/services/models/services_pandles_ads_model/services_pandles_ads_model.dart';
import 'package:ejarkom/utils/http_manager/create_ad_http.dart';
import 'package:ejarkom/utils/http_manager/services_htt.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

/// @description:
/// @author
/// @date: 2022-10-15 16:23:54
class CreateServicesAdState {
  CreateServicesAdState() {
    servicesHttp = ServicesHttp();
    createAdHttp = CreateAdHttp();
    pageController = PageController();
    nameE = TextEditingController();
    nameA = TextEditingController();
    descriptionE = TextEditingController();
    descriptionA = TextEditingController();
    phone = TextEditingController();
    whats = TextEditingController();
    zones = [];
    cities = [];
    typeServes = [];
  }

  late ServicesPandlesAdsModel servicesPandlesAdsModel;
  List<PandleServe> pandels = [];
  Rxn<PandleServe> selectedPandle = Rxn(PandleServe(id: 100000));
  RxBool getPandels = false.obs;
  RxBool publishState = false.obs;
  late ServicesHttp servicesHttp;
  late CreateAdHttp createAdHttp;
  late TextEditingController nameE;
  late TextEditingController nameA;
  late TextEditingController descriptionE;
  late TextEditingController descriptionA;
  late TextEditingController phone;
  late TextEditingController whats;
  late PageController pageController;
  RxInt cureentIndex = 0.obs;
  Zone? selectedZone;
  TypeServe? selectedType;
  late List<Zone> zones;
  late List<TypeServe> typeServes;
  RxBool gettingZones = false.obs;
  RxBool gettingTypes = false.obs;
  late List<City> cities;
  RxBool gettingCities = false.obs;
  City? selectedCity;
  List<File> images = [];
  List<Uint8List> photos = [];

  PageController pageControllerPhotos = PageController();
}
