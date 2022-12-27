// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ejarkom/app/login/ForgetPasswordMod/models/find_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ejarkom/app/sign_up/models/phone_veri_model.dart';
import 'package:ejarkom/app/sign_up/models/whats_ver_model.dart';

class ForgetPasswordState {
  late TextEditingController email;
  late TextEditingController newPassword;
  late TextEditingController code;
  PhoneVeriModel? phoneVeriModel;
  WhatsVerModel? whatsVerModel;
  RxBool timeIsOpen = false.obs;
  RxInt currentStep = 0.obs;
  FindUserModel? findUserModel;
  RxBool changePass = false.obs;
  List<String> sendingOptions = ['Whatsapp'.tr, 'Phone'.tr, 'E-mail'.tr];
  RxString selectedSendingOption = ''.obs;
  int pinCode = 0;
  ForgetPasswordState() {
    email = TextEditingController();
    code = TextEditingController();
    newPassword = TextEditingController();
  }
}
