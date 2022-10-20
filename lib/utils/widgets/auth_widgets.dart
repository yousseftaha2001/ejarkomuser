import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DataInput extends StatelessWidget {
  DataInput(
      {Key? key,
      required this.icon,
      required this.controller,
      required this.hint,
      this.type,
      this.obs})
      : super(key: key);
  final TextEditingController controller;
  final String hint;
  final Icon icon;
  bool? obs;
  int? type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        inputFormatters: type == 1
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9--]')),
              ]
            : null,
        controller: controller,
        readOnly: type == 1,
        enabled: type != 1,
        style: const TextStyle(color: Colors.black),
        cursorColor: Get.theme.primaryColor,
        obscureText: obs ?? false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon,
          label: Text(hint.tr),
          hintText: hint.tr,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide: BorderSide(color: Get.theme.primaryColor),
          ),
        ),
      ),
    );
  }
}
