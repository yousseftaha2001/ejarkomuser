import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/sign_up/models/phone_veri_model.dart';
import '../../app/sign_up/models/whats_ver_model.dart';

class CompanysignupState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;
     RxString email = ''.obs;
  RxString name = ''.obs;

  RxString phone = ''.obs;
  RxString password = ''.obs;
  // RxString hours = ''.obs;
  Rxn<Uint8List> photo = Rxn(Uint8List(0));
  Rxn<Uint8List> photo2 = Rxn(Uint8List(0));
  Rxn<Uint8List> photo3 = Rxn(Uint8List(0));
     TextEditingController emailCode=TextEditingController();
   TextEditingController phoneCode=TextEditingController();
  RxString address = ''.obs;
  // late Timer timer;
  PhoneVeriModel? phoneVeriModel;
  WhatsVerModel? whatsVerModel;
  RxBool timeIsOpen = false.obs;
  // Uint8List? photo;
  File? image;
  RxBool loginState = false.obs;
  int pinCode = 0;
  RxBool sendMailState = false.obs;
  late String firebaseToken;
  RxInt currentStep = 0.obs;

  RxBool tryToSignUp = false.obs;
  List<String> sendingOptions = ['Whatsapp'.tr, 'Phone'.tr];
  RxBool phoneCodeState = false.obs;
  RxString selectedSendingOption = ''.obs;
}
