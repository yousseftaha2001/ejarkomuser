import 'package:ejarkom/app/home/view.dart';
import 'package:ejarkom/app/start_point/view.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

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




  changeLoginState() => state.loginState.value = !state.loginState.value;

  void loginButton() async {
    if (state.email.text.isNotEmpty && state.password.text.isNotEmpty) {
      changeLoginState();
      var result = await AuthManger.login(
        email: state.email.text.trim(),
        password: state.password.text.trim(),
        fire: state.firebaseToken,
      );
      result.fold(
        (l) {
          Get.snackbar('Error'.tr, l.toString());
          changeLoginState();
        },
        (r) {
          MyDataBase.insertData(
            token: r.token!,
            id: r.user!.id!.toString(),
            pass: state.password.text,
            email: r.user!.email!,
            name: r.user!.name!,
            phone: r.user!.phone!,
          );
          changeLoginState();
          Get.offAll(() => HomePage());
        },
      );
    } else {
      Get.snackbar('Error'.tr, 'please complete your data'.tr);
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
}
