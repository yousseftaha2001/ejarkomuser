import 'dart:io';
import 'dart:typed_data';

import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../app/Ads/models/GetBuildTypeModel.dart';
import '../../app/Ads/models/GetCityModel.dart';
import '../../app/Ads/models/GetZoneModel.dart';
import '../../app/Ads/models/Zone.dart';
import 'index.dart';

class CraeteadscompanyController extends GetxController {
  CraeteadscompanyController();

  final state = CraeteadscompanyState();
  void changeSelectedCostType(String newValue) {
    state.costType.value = newValue;
    update(['c']);
  }

  void changeSelectedCity(City newValue) {
    state.selectedCity = newValue;
    update(['ci']);
    state.selectedZone = null;
    getZones(state.selectedCity!.id!.toString());
  }

  void changeSelectedZone(Zone newValue) {
    state.selectedZone = newValue;
    update(['z']);
  }

  void changeSelectedType(TypeBuild newValue) {
    state.selectedBuildType = newValue;
    update(['b']);
  }

  void changeGettingCities() =>
      state.gettingCities.value = !state.gettingCities.value;

  void changeGettingZones() =>
      state.gettingZones.value = !state.gettingZones.value;

  void changeGettingBuilds() =>
      state.gettingBuildTypes.value = !state.gettingBuildTypes.value;

  void changeCreateState() =>
      state.createAdsState.value = !state.createAdsState.value;

  void getImages() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      // List<File> files = result.paths.map((path) => File(path!)).toList();
      if (Platform.isIOS) {
        for (int i = 0; i < result.files.length; i++) {
          if (state.photos.length < 5) {
            state.photos.add(result.files[i].bytes!);
          } else {}
        }
      } else {
        for (int i = 0; i < result.files.length; i++) {
          if (state.photos.length < 5) {
            File file = File(result.files[i].path!);
            Uint8List uploadedfile = await file.readAsBytes();
            state.photos.add(uploadedfile);
          } else {}
        }
      }
      update(['photo']);
    } else {
      // User canceled the picker
    }
  }

  void deleteImage(int index) {
    // state.images.removeAt(index);
    state.photos.removeAt(index);
    update(['photo']);
  }

  void getCities() async {
    changeGettingCities();
    var result = await AuthManger.getRequestHelper(api: getCityAPICompany);
    result.fold(
      (l) {
        state.cities = [];
        update(['ci']);
        Get.snackbar('Error', '${l.error}');
      },
      (r) {
        GetCityModel cityRequetsModel = GetCityModel.fromJson(r);
        state.cities = cityRequetsModel.cities!;
        update(['ci']);
      },
    );
    changeGettingCities();
  }

  void getTypes() async {
    changeGettingBuilds();
    var result = await AuthManger.getRequestHelper(api: getBuildTypeAPI);
    result.fold(
      (l) {
        state.typeBuilds = [];
        update(['b']);
        Get.snackbar('Error', '${l.error}');
      },
      (r) {
        GetBuildTypeModel cityRequetsModel = GetBuildTypeModel.fromJson(r);
        state.typeBuilds = cityRequetsModel.typeBuild!;
        update(['b']);
      },
    );
    changeGettingBuilds();
  }

  void getZones(String id) async {
    changeGettingZones();
    var result = await AuthManger.getRequestHelper(api: '$getZoneAPI$id');
    result.fold(
      (l) {
        state.zones = [];
        update(['z']);
        Get.snackbar('Error', '${l.error}');
      },
      (r) {
        GetZoneModel cityRequetsModel = GetZoneModel.fromJson(r);
        state.zones = cityRequetsModel.zones!;
        update(['z']);
      },
    );
    changeGettingZones();
  }

  bool checkData() =>
      state.costType.value.isEmpty ||
      state.cost.value.isEmpty ||
    
      
      state.photos.isEmpty;
  bool checkDataA() =>
      state.nameA.value.isEmpty ||
      state.desA.value.isEmpty ||
      state.addressA.value.isEmpty ||
      state.costType.value.isEmpty ||
      state.cost.value.isEmpty ||
     
    
      state.photos.isEmpty;
  bool checkDataE() =>
      state.nameE.value.isEmpty ||
      state.desE.value.isEmpty ||
      state.addressE.value.isEmpty ||
      state.costType.value.isEmpty ||
      state.cost.value.isEmpty ||
     
      
      state.photos.isEmpty;

  void addAdd() async {
    changeCreateState();
    var result = await AuthManger.postRequestHelper(
      api: createAdAPICompany,
      data: {
        'name_A':
            state.langOption.value == 0 ? state.nameE.value : state.nameA.value,
        'name_E':
            state.langOption.value == 1 ? state.nameA.value : state.nameE.value,
        'video': state.video.value,
        'desc_E':
            state.langOption.value == 1 ? state.desA.value : state.desE.value,
        'desc_A':
            state.langOption.value == 0 ? state.desE.value : state.desA.value,
        'cost': state.cost.value,
        'cost_type': state.costType.value,
        'address_E': state.langOption.value == 1
            ? state.addressA.value
            : state.addressE.value,
        'address_A': state.langOption.value == 0
            ? state.addressE.value
            : state.addressA.value,
        'zone_id': state.selectedZone!.id!.toString(),
        'type_build': state.selectedBuildType!.id!.toString(),
        'num_room': state.numOfRoom.value==''?'0':state.numOfRoom.value,
        'num_bathroom': state.numOfBathRoom.value==''?"0":state.numOfBathRoom.value,
        'furnished': state.furnished.value.toString(),
      },
      photos: state.photos,
      // video: state.video.value,
    );
    result.fold(
      (l) {
        printInfo(info: l.error);
        changeCreateState();
        QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          text: l.error,
          width: Get.width / 4,
          confirmBtnColor: Get.theme.primaryColor,
          borderRadius: 10.sp,
          // cancelBtnText: Get.theme.primaryColor,
        );
      },
      (r) {
        // MyAdsController mainCoursesController = Get.find();
        // mainCoursesController.getAds();
        changeCreateState();
        Get.back();
        QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.success,
          width: Get.width / 4,
          borderRadius: 10.sp,
          title: 'Ads has Been Added',
          confirmBtnColor: Get.theme.primaryColor,
        );
      },
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCities();
    getTypes();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
