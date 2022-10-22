import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpState {
  SignUpState() {
    email = TextEditingController();
    password = TextEditingController();
    fullName = TextEditingController();

    rePassword = TextEditingController();
    phone = TextEditingController();
  }

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController fullName;
  late TextEditingController phone;
  late TextEditingController rePassword;
  int pinCode = 0;
  late String firebaseToken;
  RxBool sendMailState = false.obs;
  RxBool tryToSignUp = false.obs;
}
