import 'dart:typed_data';

import 'package:ejarkom/company_app/CompanyData/models/profile_request_model.dart';
import 'package:get/get.dart';

import 'models/my_data_request.dart';

class CompanydataState {
  String? error;
  String? errorD;
  RxInt pageState = 0.obs;
  RxInt pageStateD = 0.obs;
  ProfileRequestModel? profile;
  MyDataRequest? myDataRequest;
  RxBool addState = false.obs;
  Rxn<Uint8List> photo = Rxn(Uint8List(0));
  Rxn<Uint8List> photo2 = Rxn(Uint8List(0));
  RxString address = ''.obs;
}
