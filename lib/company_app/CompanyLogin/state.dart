import 'package:ejarkom/app/sign_up/models/phone_veri_model.dart';
import 'package:ejarkom/app/sign_up/models/whats_ver_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyloginState {
  // title
TextEditingController email = TextEditingController();
  TextEditingController phone2 = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController emailS = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordF = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController phoneCode = TextEditingController();
  // TextEditingController wh = TextEditingController();
   PhoneVeriModel? phoneVeriModel;
  WhatsVerModel? whatsVerModel;
  RxString googleI='0'.obs;

  RxBool loginState = false.obs;
  RxBool changePass = false.obs;
  RxBool timeIsOpen = false.obs;
  RxInt currentStep = 1.obs;
  int pinCode = 0;
  List<String> sendingOptions = ['Whatsapp', 'Phone','E-Mail'];
  RxString selectedSendingOption = ''.obs;
    List<String> sendingOptions2 = ['Whatsapp'.tr, 'Phone'.tr];
  RxBool phoneCodeState = false.obs;
  RxString selectedSendingOption2 = ''.obs;
   PhoneVeriModel? phoneVeriModel2;
  WhatsVerModel? whatsVerModel2;
  late String firebaseToken;

}
