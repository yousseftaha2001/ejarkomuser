import 'package:ejarkom/utils/langs/lang_sorage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  String appLang = 'en';

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    appLang = await LanguageStorage.getLanguage();
    if (appLang != '') {
      Get.updateLocale(Locale(appLang));
      update();
    } else {
      Get.updateLocale(Locale('en', 'US'));
      update();
    }
  }

  void changeLang({required String langCode}) async {
    if (langCode == appLang) {
      return;
    }
    if (langCode == 'en') {
      appLang = 'en';
      LanguageStorage.storeLang(lang: appLang);
      Get.updateLocale(Locale('en', 'US'));
    } else {
      appLang = 'ar';
      LanguageStorage.storeLang(lang: appLang);
      Get.updateLocale(Locale('ar', 'EG'));
    }
    update();
  }
}
