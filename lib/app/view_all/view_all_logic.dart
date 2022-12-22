/// Generated by Flutter GetX Starter on 2022-10-08 18:12
import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:ejarkom/app/build/build_logic.dart';
import 'package:ejarkom/app/build/build_view.dart';
import 'package:ejarkom/app/view_all/models/AllBuildingsModel.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:get/get.dart';

import '../Ads/models/Zone.dart';
import 'view_all_state.dart';

class ViewAllLogic extends GetxController {
  final state = ViewAllState();
  late String id;

  ViewAllLogic({required this.id});

  void changeGetState() => state.getState.value = !state.getState.value;

  void changeSearchMode() {
    // state.searchMode.value = true;
    filter();
    Get.back();
    state.searchMode.value = true;
  }

  void changeSelectedCity(City newValue) {
    state.selectedCity = newValue;
    update(['ci']);
    getZones(state.selectedCity!.id!.toString());
  }

  void closeSearch(){
    state.searchMode.value=false;
    state.selectedCity=null;
    state.selectedZone=null;
  }

  void filter() {
    state.searchedList = [];
    state.searchMode.value = true;
    update();

    for (int i = 0; i < state.allBuildingsModel!.ads!.length; i++) {
      if (state.allBuildingsModel!.ads![i].cityE ==
              state.selectedCity!.nameE! &&
          state.allBuildingsModel!.ads![i].zonesE ==
              state.selectedZone!.nameE!) {
        state.searchedList.add(state.allBuildingsModel!.ads![i]);
      }
    }
    print(state.searchedList.length);
    update();
  }

  // void getCities() async {
  //   changeGettingCities();
  //   var result = await state.createAdHttp.getAllCities();
  //   result.fold(
  //     (l) {
  //       state.cities = [];
  //       update(['ci']);
  //       Get.snackbar('Error'.tr, 'please check your internet connection'.tr);
  //     },
  //     (r) {
  //       state.cities = [];
  //       state.cities = r.cities!;
  //       print(state.cities.length);

  //       update(['ci']);
  //     },
  //   );
  //   changeGettingCities();
  // }
  void getCities() async {
    changeGettingCities();
    var result = await state.createAdHttp.getAllCities();
    result.fold(
      (l) {
        state.cities = [];
        update(['ci']);
        Get.snackbar('Error'.tr, 'please check your internet connection'.tr);
        mySnackBar(title: 'Error'.tr, body: 'please check your internet connection'.tr);
      },
      (r) {
        state.cities = r.cities!;
        print(state.cities.length);

        update(['ci']);
      },
    );
    changeGettingCities();
  }
  void getZones(String id) async {
    update(['z']);
    changeGettingZones();
    update(['z']);
    var result = await state.createAdHttp.getAllZones(id: id);
    result.fold(
      (l) {
        state.zones = [];
        update(['z']);
        Get.snackbar('Error'.tr, 'please check your internet connection'.tr);
        mySnackBar(title: 'Error'.tr, body: 'please check your internet connection'.tr);
      },
      (r) {
        print(r.zones);
        state.selectedZone=null;
        if (r.zones!.isNotEmpty) {

          state.zones = r.zones!;
          print(state.zones.length);
          // state.selectedZone = state.zones.first;
          update(['z']);
        } else {
         state.zones=[];
        }
      },
    );
    changeGettingZones();
  }

  // void getZones(String id) async {
  //   changeGettingZones();
  //   update(['z']);
  //   var result = await state.createAdHttp.getAllZones(id: id);
  //   result.fold(
  //     (l) {
  //       state.zones = [];
  //       update(['z']);
  //       Get.snackbar('Error'.tr, 'please check your internet connection'.tr);
  //     },
  //     (r) {
  //       if (r.zones!.isNotEmpty) {
  //         state.zones = r.zones!;
  //         print(state.zones.length);
  //         // state.selectedZone = state.zones.first;
  //         update(['z']);
  //       } else {
  //         update(['z']);
  //         state.zones = r.zones!;
  //         print(state.zones.length);
  //         // state.selectedZone=state.zones.first;
  //         update(['z']);
  //       }
  //     },
  //   );
  //   changeGettingZones();
  // }

  void changeGettingCities() =>
      state.gettingCities.value = !state.gettingCities.value;

  void changeGettingZones() =>
      state.gettingZones.value = !state.gettingZones.value;

  void changeSelectedZone(Zone newValue) {
    state.selectedZone = newValue;
    update(['z']);
  }

  void getAds() async {
    changeGetState();
    var result = await state.mainScreenHTTP.viewAll(id: id.toString());
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changeGetState();
  }

  void pageDone(AllBuildingsModel pageOneModel) {
    state.allBuildingsModel = pageOneModel;
  }

  void pageError(String e) {
    // Get.snackbar('Error'.tr, e.toString());
    mySnackBar(title: 'Error'.tr, body:  e.toString());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCities();

    getAds();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
