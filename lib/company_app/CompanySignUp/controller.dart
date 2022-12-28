import 'dart:io';
import 'dart:typed_data';

import 'package:ejarkom/company_app/CompanySignUp/widgets/compnay_sign_up_steper.dart';
import 'package:ejarkom/company_app/CompanySignUp/widgets/dialogs.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/apis.dart';
import '../../utils/method.dart';
import '../../utils/widgets/my_indicator_dialog.dart';
import 'index.dart';

class CompanysignupController extends GetxController {
  CompanysignupController();

  final state = CompanysignupState();

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
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

  void getImage3() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
    if (Platform.isIOS) {
        print(result.files.first.path);
      Uint8List uploadedfile = result.files.single.bytes!;
      state.photo3.value = uploadedfile;
    }else{
        // print(result.files.first.);
        File file=File(result.files.first.path!);
      Uint8List uploadedfile =await file.readAsBytes();
      state.photo3.value = uploadedfile;
    }
      update(['photo3']);
    } else {
      // state.photo.clear();
      // update(['photo']);
    }
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
   String nextButtonText() {
    if (state.currentStep.value == 0) {
      return 'Next'.tr;
    } else if (state.currentStep.value == 1) {
      if (state.phoneVeriModel == null ||
          state.selectedSendingOption.value == state.sendingOptions[0]) {
        return 'Send'.tr;
      } else {
        return 'resend';
      }
    } else {
      return 'Next'.tr;
    }
  }

  void getFireBaseToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    print(token);
    if (token == null) {
      state.firebaseToken = '';
    } else {
      state.firebaseToken = token;
    }
    // state.firebaseToken = token!;
  }

  void changeSend() => state.sendMailState.value = !state.sendMailState.value;
  Future<void> sendMail() async {
    // var result = collectData();
    if (state.email.isNotEmpty &&
        state.password.value.length > 6 &&
        state.address.value.isNotEmpty &&
        state.phone.value.isNotEmpty &&
        state.photo.value!.isNotEmpty &&
        state.photo2.value!.isNotEmpty) {
      changeSend();
      var mailResult =
          await AuthManger.sendEmail(email: state.email.value.trim());
      mailResult.fold(
        (l) {
          print(l.toString());
          // Get.snackbar('Error',
          //     l.toString() == '' ? 'No Internet Connection'.tr : l.toString());
          mySnackBar(
              title: 'Error',
              body: l.toString() == ''
                  ? 'No Internet Connection'.tr
                  : l.toString());
        },
        (r) async {
          state.pinCode = r;
          // await Get.dialog(
          //   VerificationDialog(),
          //   barrierDismissible: false,
          // );
          Get.to(() => SignUpSteperCompany());
        },
      );
      changeSend();
    } else {
      if (state.password.value.length < 6) {
        // Get.snackbar('Some thing want wrong'.tr, 'Weak Password'.tr);
        mySnackBar(title: 'Some thing want wrong'.tr, body: 'Weak Password'.tr);
      } else {
        // Get.snackbar(
        //     'Some thing want wrong'.tr, 'please complete your data'.tr);
        mySnackBar(
            title: 'Some thing want wrong'.tr,
            body: 'please complete your data'.tr);
      }
    }
  }

  void stepOne() {
    if (state.emailCode.text == state.pinCode.toString()) {
      state.currentStep.value = state.currentStep.value + 1;
    } else {
      mySnackBar(title: 'Error', body: 'The Code is not Correct');
    }
  }

  void stepThree() {
    if (state.selectedSendingOption.value == state.sendingOptions[0]) {
      if (state.phoneCode.text == state.whatsVerModel!.num.toString()) {
        print('Done');
        // signUpLogic();
        loginMethod();
      } else {
        mySnackBar(title: 'Error', body: 'The Code is not Correct');
      }
    } else {
      if (state.phoneCode.text == state.phoneVeriModel!.num.toString()) {
        print('Done');
        // signUpLogic();
        loginMethod();
      } else {
        mySnackBar(title: 'Error', body: 'The Code is not Correct');
      }
    }
  }
   void loginMethod() async {
     changeSend();
     Get.dialog(MyIndicatorDialog(),barrierDismissible: false);
    var result = await AuthManger.postRequestHelperNoToken(
        api: reqCompanyAPI,
        data: {
          'email': state.email.value,
          'name': state.name.value,
          'phone': state.phone.value,
          'password': state.password.value,
          'address': state.address.value,
        },
        photo: state.photo.value,
        photo3: state.photo3.value,
        photo2: state.photo2.value);
    result.fold(
      (l) {
         Get.back();
        Get.dialog(
          ActionDialog(
            title: l.toString(),
            icon: Icon(
              Icons.error_outline,
              size: 40.sp,
            ),
          ),
        );
      },
      (r) {
        Get.back();
        Get.back();
        Get.back();
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
      changeSend();
  }

  void stepTwo() async {
    if (state.timeIsOpen.value) {
      print('heessse');
    } else {
      if (state.selectedSendingOption.value.isNotEmpty) {
        if (state.selectedSendingOption.value == state.sendingOptions[0]) {
          Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
          var phoneSending =
              await AuthManger.sendWhats(phone: state.phone.value.trim());
          phoneSending.fold(
            (l) {
              mySnackBar(title: 'Error'.tr, body: l.toString());
              Get.back();
            },
            (r) {
              state.whatsVerModel = r;
              print(state.whatsVerModel!.num);
              Get.back();
              state.currentStep.value = state.currentStep.value + 1;
            },
          );
        } else {
          if (state.phoneVeriModel != null) {
            if (!state.timeIsOpen.value) {
              Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
              var phoneSending =
                  await AuthManger.sendSms(phone: state.phone.value.trim());
              phoneSending.fold(
                (l) {
                  mySnackBar(title: 'Error'.tr, body: l.toString());
                  Get.back();
                },
                (r) {
                  state.phoneVeriModel = r;

                  state.timeIsOpen.value = true;
                  Get.back();
                  state.currentStep.value = state.currentStep.value + 1;
                },
              );
            } else {
              mySnackBar(
                  title: 'Error'.tr,
                  body:
                      'Pleas await until ${dateParser(state.phoneVeriModel!.tryAgain!.toString())}');
            }
          } else {
            Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
            var phoneSending =
                await AuthManger.sendSms(phone: state.phone.value.trim());
            phoneSending.fold(
              (l) {
                mySnackBar(title: 'Error'.tr, body: l.toString());
                Get.back();
              },
              (r) {
                state.phoneVeriModel = r;
                print(state.phoneVeriModel!.tryAgain);
                Get.back();
                state.currentStep.value = state.currentStep.value + 1;
              },
            );
          }
        }
      }
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    getFireBaseToken();
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
