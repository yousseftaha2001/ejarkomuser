import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState {
  LoginState() {}

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool loginState = false.obs;

  late String firebaseToken;
}
