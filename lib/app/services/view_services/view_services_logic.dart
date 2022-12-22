import 'dart:io';

import 'package:ejarkom/app/services/models/service_section_model/ads_serve.dart';
import 'package:ejarkom/app/services/view_services/models/one_services/one_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'view_services_state.dart';

/// @description:
/// @author
/// @date: 2022-10-22 03:07:05
class ViewServicesLogic extends GetxController {
  final state = ViewServicesState();

  late String id;
  ViewServicesLogic({required this.id});

  void changeGetState() => state.getState.value = !state.getState.value;

  void getServcies() async {
    changeGetState();
    var result = await state.servicesHttp.getOneSer(id: id);
    result.fold(
      (l) {
        // state.serviceAds = ServiceAds(id: -1);
        print('here');
        state.serve = OneServices();
        print(l);
        changeGetState();
      },
      (r) {
        print('her2e');

        state.serve = r;

        changeGetState();
      },
    );
  }

  void changeH() {
    if (state.containerH.value == Get.height * 0.9.h) {
      state.containerH.value = Get.height * 0.5.h;
      state.containerIsOpened = false.obs;
    } else {
      state.containerH.value = Get.height * 0.9.h;
      state.containerIsOpened = true.obs;
    }
  }

  void launchWhatsApp({
    required String phone,
    required String message,
  }) async {
    Uri url() {
      if (Platform.isAndroid) {
        return Uri.parse("https://wa.me/$phone/?text=${Uri.parse(message)}");
      } else {
        return Uri.parse(
            "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}");
      }
    }

    if (await canLaunchUrl(url())) {
      await launchUrl(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri _phoneUri = Uri(scheme: "tel", path: contactNumber);
    try {
      if (await canLaunch(_phoneUri.toString()))
        await launch(_phoneUri.toString());
    } catch (error) {
      throw ("Cannot dial");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getServcies();
  }
}
