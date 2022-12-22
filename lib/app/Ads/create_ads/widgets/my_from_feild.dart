import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyCustomFormField extends StatelessWidget {
  MyCustomFormField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.validator,
    required this.formK,
    this.max,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final Icon icon;
  var validator;
  int? max;
  GlobalKey formK;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      key: key,
      controller: controller,
      maxLines:null ,
      
      style: TextStyle(color: Get.theme.primaryColor),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon,
          hintText: hint.tr,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: BorderSide(color: Get.theme.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: BorderSide(color: Get.theme.primaryColor),
          ),
          errorStyle: Get.textTheme.bodyText1!.copyWith(
            fontSize: 14.sp,
          )),
    );
  }
}
