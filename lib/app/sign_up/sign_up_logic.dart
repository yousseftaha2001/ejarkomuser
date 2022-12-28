import 'dart:io';

import 'package:ejarkom/app/home/view.dart';
import 'package:ejarkom/app/sign_up/models/signup_requets.dart';
import 'package:ejarkom/app/sign_up/widgets/steper_screen.dart';
import 'package:ejarkom/app/sign_up/widgets/veri_dialog.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:ejarkom/utils/widgets/my_indicator_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'sign_up_state.dart';

class SignUpLogic extends GetxController {
  final SignUpState state = SignUpState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFireBaseToken();
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

  void getImages({required String w}) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      if (w == 's') {
        // update(['Sphoto']);
      } else {
        state.image = files.first;
        state.photo = files.first.readAsBytesSync();
        update(['photo']);
      }
    } else {
      // User canceled the picker
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

  dynamic collectData() async {
    if (state.email.text.isEmail &&
        state.password.text.isNotEmpty &&
        state.fullName.text.isNotEmpty &&
        state.phone.text.isPhoneNumber &&
        state.rePassword.text == state.password.text &&
        state.firebaseToken.isNotEmpty) {
      // var firebaseToken = await FirebaseMessaging.instance.getToken();
      SignUpRequestModel signUpRequestModel = SignUpRequestModel(
        email: state.email.text.trim(),
        name: state.fullName.text.trim(),
        password: state.password.text.trim(),
        tokenMassage: state.firebaseToken,
        phone: state.phone.text,
      );
      return signUpRequestModel;
    } else {
      return '';
    }
  }

  void changeSend() => state.sendMailState.value = !state.sendMailState.value;
  bool checkPassword() {
    if (state.password.text.length > 6) {
      if (state.password.text == state.rePassword.text) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> sendMail() async {
    // var result = collectData();
    if (state.email.text.isNotEmpty && checkPassword()) {
      changeSend();
      var mailResult =
          await AuthManger.sendEmail(email: state.email.text.trim());
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
          Get.to(() => SignUpSteper());
        },
      );
      changeSend();
    } else {
      if (state.password.text.length < 6) {
        // Get.snackbar('Some thing want wrong'.tr, 'Weak Password'.tr);
        mySnackBar(title: 'Some thing want wrong'.tr, body: 'Weak Password'.tr);
      }
      if (state.password.text != state.rePassword.text) {
        // Get.snackbar('Some thing want wrong'.tr, 'please rewrite your password'.tr);
        mySnackBar(
            title: 'Some thing want wrong'.tr,
            body: 'please rewrite your password'.tr);
      } else {
        // Get.snackbar(
        //     'Some thing want wrong'.tr, 'please complete your data'.tr);
        mySnackBar(
            title: 'Some thing want wrong'.tr,
            body: 'please complete your data'.tr);
      }
    }
  }

  void clearData() {
    state.email.clear();
    state.fullName.clear();
    state.password.clear();
    state.rePassword.clear();
  }

  void signUpLogic() async {
    var data = await collectData();
    if (data is SignUpRequestModel) {
      changeSend();
      var requestResult =
          await AuthManger.signUp(requestModel: data, photo: state.photo);
      requestResult.fold(
        (l) {
          if (kDebugMode) {
            print(l);
          }
          changeSend();
          // Get.snackbar('Error'.tr, l.tr);
          mySnackBar(title: 'Error'.tr, body: l.tr);
        },
        (r) {
          changeSend();
          MyDataBase.insertData(
            token: r.token!,
            id: r.user!.id!.toString(),
            pass: '',
            type: '1',
            email: r.user!.email!,
            name: r.user!.name!,
            phone: r.user!.phone!,
            photo: r.user!.photo!,
          );
          // homeController.checkUser();
          // Get.back();
          if (kDebugMode) {
            print(r.token);
            // print(MainPageController.getStorageServices.readUserD());
          }
          state.tryToSignUp.value = false;
          Get.offAll(() => HomePage());

          // clearData();
        },
      );
    } else {
      // Get.snackbar('Error'.tr, 'please complete the info'.tr);
      mySnackBar(title: 'Error'.tr, body: 'please complete the info'.tr);
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
        signUpLogic();
      } else {
        mySnackBar(title: 'Error', body: 'The Code is not Correct');
      }
    } else {
      if (state.phoneCode.text == state.phoneVeriModel!.num.toString()) {
        print('Done');
        signUpLogic();
      } else {
        mySnackBar(title: 'Error', body: 'The Code is not Correct');
      }
    }
  }

  void stepTwo() async {
    if (state.timeIsOpen.value) {
      print('heessse');
    }else{
      if (state.selectedSendingOption.value.isNotEmpty) {
      if (state.selectedSendingOption.value == state.sendingOptions[0]) {
        Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
        var phoneSending =
            await AuthManger.sendWhats(phone: state.phone.text.trim());
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
                await AuthManger.sendSms(phone: state.phone.text.trim());
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
              await AuthManger.sendSms(phone: state.phone.text.trim());
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
}
