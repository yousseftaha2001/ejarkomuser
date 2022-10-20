import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpState {
  SignUpState() {
    email = TextEditingController();
    password = TextEditingController();
    fullName = TextEditingController();

    rePassword = TextEditingController();
  }

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController fullName;

  late TextEditingController rePassword;
  RxBool tryToSignUp = false.obs;
}
