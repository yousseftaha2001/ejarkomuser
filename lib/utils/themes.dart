import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

//Anubis@#1212
class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xff102129),
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: Color(0xffffc818),
          primary: const Color(0xff102129),
        ),
    backgroundColor: const Color(0xffFFFFFF),
    highlightColor: Colors.black87,
    // focusColor: const Color(0xff04D9F1),
    indicatorColor: Color(0xff102129),

    hintColor: const Color(0xffCED2DB),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Color(0xff4A4B4D),
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(
          color: Colors.black87,
          fontSize: 20.sp,
          fontWeight: FontWeight.normal,
          fontFamily: 'AM'),
      labelMedium: TextStyle(
          color: Colors.black87,
          fontSize: 3.sp,
          fontWeight: FontWeight.normal,
          fontFamily: 'AM'),
    ),
    // colorScheme: ColorScheme.fromSwatch().copyWith(
    //   secondary:  Colors.white,
    //   primary: Colors.white,
    // ),
  );
}
