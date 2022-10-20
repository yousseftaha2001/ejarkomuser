import 'package:ejarkom/app/home/view.dart';
import 'package:ejarkom/app/sign_up/models/signup_requets.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'sign_up_state.dart';

class SignUpLogic extends GetxController {
  final SignUpState state = SignUpState();

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

  dynamic collectData() async {
    if (state.email.text.isEmail &&
        state.password.text.isNotEmpty &&
        state.fullName.text.isNotEmpty &&
        state.rePassword.text == state.password.text) {
      // var firebaseToken = await FirebaseMessaging.instance.getToken();
      SignUpRequestModel signUpRequestModel = SignUpRequestModel(
          email: state.email.text.trim(),
          name: state.fullName.text.trim(),
          password: state.password.text.trim(),
          tokenMassage: 'fire',
          phone: "1212");
      return signUpRequestModel;
    } else {
      return '';
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
      state.tryToSignUp.value = true;
      var requestResult = await AuthManger.signUp(requestModel: data);
      requestResult.fold(
        (l) {
          if (kDebugMode) {
            print(l);
          }
          state.tryToSignUp.value = false;
          Get.snackbar('Error'.tr, l);
        },
        (r) {
          state.tryToSignUp.value = false;
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
