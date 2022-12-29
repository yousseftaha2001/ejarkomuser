import 'dart:io';
import 'dart:typed_data';

import 'package:ejarkom/app/sign_up/models/phone_veri_model.dart';
import 'package:ejarkom/app/sign_up/models/whats_ver_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'models/whats_ver_model.dart';

class SignUpState {
  SignUpState() {
    email = TextEditingController();
    password = TextEditingController();
    fullName = TextEditingController();

    rePassword = TextEditingController();
    // timer=Timer(set, clear, delay, callback);
    phone = TextEditingController();
    phoneCode = TextEditingController();
    emailCode = TextEditingController();
  }

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController fullName;
  late TextEditingController phone;
  late TextEditingController emailCode;
  late TextEditingController phoneCode;
  late TextEditingController rePassword;
   PhoneController phoneController=PhoneController(PhoneNumber(isoCode: IsoCode.JO, nsn: ''));
  // late Timer timer;
  PhoneVeriModel? phoneVeriModel;
  WhatsVerModel? whatsVerModel;
  RxBool timeIsOpen = false.obs;
  Uint8List? photo;
  File? image;
  int pinCode = 0;
  RxBool sendMailState = false.obs;
  late String firebaseToken;
  RxInt currentStep = 0.obs;

  RxBool tryToSignUp = false.obs;
  List<String> sendingOptions = ['Whatsapp'.tr, 'Phone'.tr];
  RxBool phoneCodeState = false.obs;
  RxString selectedSendingOption = ''.obs;
}
