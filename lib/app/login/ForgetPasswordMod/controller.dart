import 'package:ejarkom/app/login/ForgetPasswordMod/models/find_user_model.dart';
import 'package:ejarkom/app/login/ForgetPasswordMod/state.dart';
import 'package:ejarkom/app/login/ForgetPasswordMod/widgets/new_password_dialog.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:ejarkom/utils/widgets/my_indicator_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/method.dart';

class ForgetpasswordmodController extends GetxController {
  ForgetpasswordmodController();
  final state = ForgetPasswordState();

  _initData() {
    update(["forgetpasswordmod"]);
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
  Future<void> completeForger() async {
    changePassState();
    var signUpResult = await AuthManger.forgetPassword(
      email: state.email.text,
      pass: state.newPassword.text,
    );
    signUpResult.fold(
      (l) {
        // Get.snackbar('Error'.tr, l.toString());
         changePassState();
         Get.back();
        mySnackBar(title: 'Error'.tr, body: l.toString());
        
       
      },
      (r) async {
        // await MyDataBase.insertToken(token: r.token!);

        changePassState();
        Get.back();
        Get.back();
        // Get.snackbar('Done'.tr, 'Password has been changed'.tr);
        mySnackBar(title: 'Done'.tr, body: 'Password has been changed'.tr);
        // setData();

        // Get.back();
      },
    );
  }
  changePassState() => state.changePass.value = !state.changePass.value;


  void stepOne() async {
    if (Get.isSnackbarOpen) {
       Get.back();
    }else{
      if (state.email.text.isNotEmpty) {
      Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
      var result = await AuthManger.findUser(phone: state.email.text);
      result.fold(
        (l) {
          Get.back();
          mySnackBar(title: 'Error'.tr, body: 'User Not Found'.tr);
        },
        (r) {
          state.findUserModel = FindUserModel.fromJson(r);
          print(state.findUserModel!.phone);
          Get.back();
          state.currentStep.value = 1;
        },
      );
    }
    }
  }
  void stepTwo() async {
   if (Get.isSnackbarOpen) {
      Get.back();
   }else{
     if (state.selectedSendingOption.isNotEmpty) {
     if (state.selectedSendingOption.value == state.sendingOptions[2]) {
         await sendMail();
         
        } else if (state.selectedSendingOption.value ==
            state.sendingOptions[0]) {
        await  sendWahts();
          // state.currentStep.value=2;
        } else {
          //whats;
        await  sendPhone();
          // state.currentStep.value=2;
        }
    }
   }
  }

  Future<void> sendMail() async {
    // var result = collectData();
   if(Get.isSnackbarOpen){
    Get.back();
   }else{
     if (state.email.text.isEmail) {
      // changePassState();
      Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
      var mailResult =
          await AuthManger.sendEmail(email: state.email.text.trim());
      mailResult.fold(
        (l) {
          print(l.toString());
          Get.back();

          mySnackBar(
              title: 'Error'.tr,
              body: l.toString() == ''
                  ? 'No Internet Connection'.tr
                  : l.toString().tr);
        },
        (r) async {
          state.pinCode = r;
          Get.back();
          state.currentStep.value=2;
          // await Get.dialog(
          //   VerificationDialogLogin(),
          //   barrierDismissible: false,
          // );
        },
      );
      // changePassState();
    } else {
      // Get.snackbar('Some thing want wrong'.tr, 'please complete your data'.tr);
      mySnackBar(
          title: 'Some thing want wrong'.tr,
          body: 'please complete your data'.tr);
    }
   }
  }

  Future<void> sendWahts() async {
    Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
    var mailResult = await AuthManger.sendWhats(phone: state.findUserModel!.phone!);
    mailResult.fold(
      (l) {
        print(l.toString());
        Get.back();
        mySnackBar(
            title: 'Error'.tr,
            body: l.toString() == ''
                ? 'No Internet Connection'.tr
                : l.toString().tr);
      },
      (r) async {
        state.pinCode = r.num!;

        Get.back();
        state.currentStep.value=2;
      },
    );
  }

  Future<void> sendPhone() async {
    // var result = collectData();
    Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
    var mailResult = await AuthManger.sendSms(phone: state.findUserModel!.phone!);
    mailResult.fold(
      (l) {
        print(l.toString());
        Get.back();
        mySnackBar(
          title: 'Error'.tr,
          body: l.toString() == ''
              ? 'No Internet Connection'.tr
              : l.toString().tr,
        );
      },
      (r) async {
        state.pinCode = r.num!;
        state.phoneVeriModel = r;
        state.timeIsOpen.value = true;
        
        Get.back();
        state.currentStep.value=2;
      },
    );
  }
  Future<void> resendPhone() async {
    // var result = collectData();
  //  changePassState();
  Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
      var mailResult = await AuthManger.sendSms(phone: state.email.text.trim());
      mailResult.fold(
        (l) {
          print(l.toString());
  Get.back();
          mySnackBar(
              title: 'Error'.tr,
              body: l.toString() == ''
                  ? 'No Internet Connection'.tr
                  : l.toString().tr);
        },
        (r) async {
          state.pinCode = r.num!;
          state.phoneVeriModel = r;
          state.timeIsOpen.value = true;
            Get.back();
          mySnackBar(title: 'Done'.tr, body: 'The Code Has Been Send'.tr);
          // await Get.dialog(
          //   VerificationDialogLogin(),
          //   barrierDismissible: false,
          // );
        },
      );
      // changePassState();
  }

  void stepThree()async{
    if (state.pinCode.toString()==state.code.text) {
      print('done');
      Get.dialog(NewPasswordDialog(),barrierDismissible: false);
    }
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
