import 'dart:io';
import 'dart:typed_data';

import 'package:ejarkom/company_app/CompanyData/models/my_data_request.dart';
import 'package:ejarkom/company_app/CompanyData/models/profile_request_model.dart';
import 'package:ejarkom/company_app/CompanySignUp/widgets/dialogs.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class CompanydataController extends GetxController {
  CompanydataController();

  final state = CompanydataState();
  void changePageState({required int newState}) =>
      state.pageState.value = newState;
  void changePageStateD({required int newState}) =>
      state.pageStateD.value = newState;

  void changeLoginState() => state.addState.value = !state.addState.value;

  void getPage() async {
    changePageState(newState: 1);
    var result = await AuthManger.getRequestHelper(api: profileCompanyAPI);
    result.fold(
      (l) {
        state.error = l.error;
        changePageState(newState: 2);
      },
      (r) {
        // AdsRequestModel adsRequestModel = AdsRequestModel.fromJson(r);
        state.profile = ProfileRequestModel.fromJson(r);
        changePageState(newState: 3);
      },
    );
  }

  void getImage1() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
       if (Platform.isIOS) {
        print(result.files.first.path);
      Uint8List uploadedfile = result.files.single.bytes!;
      state.photo.value = uploadedfile;
    }else{
        // print(result.files.first.);
        File file=File(result.files.first.path!);
      Uint8List uploadedfile =await file.readAsBytes();
      state.photo.value = uploadedfile;
    }
      update(['photo1']);
    } else {
      // state.photo.clear();
      // update(['photo']);
    }
  }

  void uploadData() async {
    changeLoginState();
    var result = await AuthManger.postRequestHelper(
        api: addDataCompanyAPI,
        data: {
          'address': state.address.value,
        },
        photo1: state.photo.value,
        photo2: state.photo2.value);
    result.fold(
      (l) {
        Get.dialog(
          ActionDialog(
            title: l.error.toString(),
            icon: Icon(
              Icons.error_outline,
              size: 40.sp,
            ),
          ),
        );
      },
      (r) {
        getData();
        Get.back();
        state.photo.value!.clear();
        state.photo2.value!.clear();
        // Get.back();
        Get.dialog(
          ActionDialog(
            title: 'Done your Request has been Sent',
            icon: Icon(
              Icons.check,
              size: 40.sp,
            ),
          ),
        );
      },
    );
    changeLoginState();
  }

  void getImage2() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      if (Platform.isIOS) {
        print(result.files.first.path);
      Uint8List uploadedfile = result.files.single.bytes!;
      state.photo2.value = uploadedfile;
    }else{
        // print(result.files.first.);
        File file=File(result.files.first.path!);
      Uint8List uploadedfile =await file.readAsBytes();
      state.photo2.value = uploadedfile;
    }
      update(['photo2']);
    } else {
      // state.photo.clear();
      // update(['photo']);
    }
  }

  void getData() async {
    changePageStateD(newState: 1);
    var result = await AuthManger.getRequestHelper(api: myDataCompanyAPI);
    result.fold(
      (l) {
        state.error = l.error;
        changePageStateD(newState: 2);
      },
      (r) {
        // AdsRequestModel adsRequestModel = AdsRequestModel.fromJson(r);
        state.myDataRequest = MyDataRequest.fromJson(r);
        changePageStateD(newState: 3);
      },
    );
    update();
  }

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
     getPage();
    getData();
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
