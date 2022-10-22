import 'package:ejarkom/app/home/view.dart';
import 'package:ejarkom/app/sign_up/models/signup_requets.dart';
import 'package:ejarkom/app/sign_up/widgets/veri_dialog.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

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

  Future<void> sendMail() async {
    // var result = collectData();
    if (state.email.text.isNotEmpty && state.password.text.length > 6) {
      changeSend();
      var mailResult =
          await AuthManger.sendEmail(email: state.email.text.trim());
      mailResult.fold(
        (l) {
          print(l.toString());
          Get.snackbar('Error',
              l.toString() == '' ? 'No Internet Connection'.tr : l.toString());
        },
        (r) async {
          state.pinCode = r;
          await Get.dialog(
            VerificationDialog(),
            barrierDismissible: false,
          );
        },
      );
      changeSend();
    } else {
      if (state.password.text.length < 6) {
        Get.snackbar('Some thing want wrong'.tr, 'Weak Password'.tr);
      } else {
        Get.snackbar(
            'Some thing want wrong'.tr, 'please complete your data'.tr);
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
      var requestResult = await AuthManger.signUp(requestModel: data);
      requestResult.fold(
        (l) {
          if (kDebugMode) {
            print(l);
          }
          changeSend();
          Get.snackbar('Error'.tr, l);
        },
        (r) {
          changeSend();
          MyDataBase.insertData(
            token: r.token!,
            id: r.user!.id!.toString(),
            pass: '',
            email: r.user!.email!,
            name: r.user!.name!,
            phone: r.user!.phone!,
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
      Get.snackbar('Error'.tr, 'please complete the info'.tr);
    }
  }
}
