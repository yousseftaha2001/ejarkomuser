import 'dart:io';

import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:ejarkom/app/Ads/models/Zone.dart';
import 'package:ejarkom/app/complete_data/error_dialog.dart';
import 'package:ejarkom/app/services/models/service_type_model/type_serve.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_services_ad_state.dart';
import 'widgets/complete_dialog.dart';

/// @description:
/// @author
/// @date: 2022-10-15 16:23:54
class CreateServicesAdLogic extends GetxController {
  final state = CreateServicesAdState();

  void changeGetState() => state.getPandels.value = !state.getPandels.value;
  void changeGetTypesState() =>
      state.gettingTypes.value = !state.gettingTypes.value;

  void changePublishState() =>
      state.publishState.value = !state.publishState.value;

  void publishAd() async {
    changePublishState();
    var result = await state.servicesHttp.createAd(
      nameE: state.nameE.text,
      nameA: state.nameA.text,
      descriptionE: state.descriptionE.text,
      descriptionA: state.descriptionA.text,
      zoneId: state.selectedZone!.id!.toString(),
      typeSer: state.selectedType!.id!.toString(),
      pandleID: state.selectedPandle.value!.id.toString(),
      whats: state.whats.text,
      phone: state.phone.text,
      photos: state.photos,
    );
    result.fold(
      (l) {
        changePublishState();
        Get.back();
        Get.snackbar('Error'.tr, l);
      },
      (r) {
        changePublishState();
        Get.back();
        Get.back();
        Get.snackbar(
          'Done',
          'Service Ad Has been published'.tr,
        );
      },
    );
  }

  void getPandels() async {
    changeGetState();
    var result = await state.servicesHttp.getServicePandels();
    result.fold(
      (l) {
        changeGetState();
        Get.back();
        Get.snackbar('Error'.tr, l);
      },
      (r) {
        state.pandels = r.pandleServe!;
        changeGetState();
      },
    );
  }

  void getTypes() async {
    changeGetTypesState();
    var result = await state.servicesHttp.getServicesTypes();
    result.fold(
      (l) {
        changeGetTypesState();
        Get.back();
        Get.snackbar('Error'.tr, l);
      },
      (r) {
        state.typeServes = r.typeServes!;
        changeGetTypesState();
      },
    );
  }

  void getImages() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      for (int i = 0; i < files.length; i++) {
        if (state.images.length < 5) {
          state.images.add(files[i]);
          state.photos.add(files[i].readAsBytesSync());
        } else {}
      }
      update(['photo']);
    } else {
      // User canceled the picker
    }
  }

  void deleteImage(int index) {
    state.images.removeAt(index);
    state.photos.removeAt(index);
    update(['photo']);
  }

  void changeSelectedZone(Zone newValue) {
    state.selectedZone = newValue;
    update(['z']);
  }

  void getCities() async {
    changeGettingCities();
    var result = await state.createAdHttp.getAllCities();
    result.fold(
      (l) {
        state.cities = [];
        update(['ci']);
        Get.snackbar('Error'.tr, 'please check your internet connection'.tr);
      },
      (r) {
        state.cities = r.cities!;
        print(state.cities.length);

        update(['ci']);
      },
    );
    changeGettingCities();
  }

  void checkData() {
    List<String> infoError = [];
    if (state.photos.isEmpty) {
      infoError.add('Please add photos'.tr);
    }
    if (state.selectedCity == null) {
      infoError.add('Please select City'.tr);
    }
    if (state.selectedZone == null) {
      infoError.add('Please select Zone'.tr);
    }
    if (state.selectedType == null) {
      infoError.add('Please select Type'.tr);
    }
    if (infoError.isEmpty) {
      state.pageController.animateToPage(
        2,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    } else {
      Get.dialog(ErrorD(error: infoError));
    }
  }

  void checkInfo() {
    List<String> infoError = [];
    if (state.nameE.text.isEmpty) {
      infoError.add('Please enter name In English'.tr);
    }
    if (state.nameA.text.isEmpty) {
      infoError.add('Please enter name In Arabic'.tr);
    }
    if (state.descriptionE.text.isEmpty) {
      infoError.add('Please enter Description In English'.tr);
    }
    if (state.descriptionA.text.isEmpty) {
      infoError.add('Please enter Description In English'.tr);
    }
    if (state.phone.text.isEmpty) {
      infoError.add('Please enter Phone'.tr);
    }
    if (state.whats.text.isEmpty) {
      infoError.add('Please enter WhatsApp'.tr);
    }
    if (infoError.isEmpty) {
      state.pageController.animateToPage(
        1,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    } else {
      Get.dialog(ErrorD(error: infoError));
      // state.pageController.animateToPage(
      //   1,
      //   duration: Duration(milliseconds: 200),
      //   curve: Curves.easeOut,
      // );
    }
  }

  void checkPandle() {
    if (state.selectedPandle.value!.id != 100000) {
      Get.dialog(CompleteDialog(), barrierDismissible: false);
    } else {
      Get.dialog(ErrorD(error: ['please select pandle'.tr]));
    }
  }

  void changeGettingCities() =>
      state.gettingCities.value = !state.gettingCities.value;

  void changeGettingZones() =>
      state.gettingZones.value = !state.gettingZones.value;

  void changeSelectedCity(City newValue) {
    state.selectedCity = newValue;
    update(['ci']);
    getZones(state.selectedCity!.id!.toString());
  }

  void changeSelectedType(TypeServe newValue) {
    state.selectedType = newValue;
    update(['ty']);
  }

  void getZones(String id) async {
    update(['z']);
    changeGettingZones();

    var result = await state.createAdHttp.getAllZones(id: id);
    result.fold(
      (l) {
        state.zones = [];
        update(['z']);
        Get.snackbar('Error'.tr, 'please check your internet connection'.tr);
      },
      (r) {
        if (r.zones!.isNotEmpty) {
          state.zones = r.zones!;
          print(state.zones.length);
          // state.selectedZone = state.zones.first;
          update(['z']);
        } else {
          state.zones = r.zones!;
          print(state.zones.length);
          // state.selectedZone=state.zones.first;
          update(['z']);
        }
      },
    );
    changeGettingZones();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPandels();
    getCities();
    getTypes();
  }
}
