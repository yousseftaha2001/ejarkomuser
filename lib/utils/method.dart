import 'package:ejarkom/utils/langs/lang_sorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

bool isEnglish() {
  return LanguageStorage.getLanguage() == 'en';
}
String dateParser(String date) =>
    DateFormat('yyyy-MM-dd – h:mm a').format(DateTime.parse(date));

mySnackBar({required String title, required String body}) {
  return Get.snackbar(
    title,
    body,
    backgroundColor: Colors.amber,
    messageText: Text(body,style: Get.textTheme.bodyText1!.copyWith(
      fontSize: 35.sp,
      color:Get.theme.primaryColor,
    ),),
    colorText: Get.theme.primaryColor,
    duration: Duration(seconds: 3),
  );
}
