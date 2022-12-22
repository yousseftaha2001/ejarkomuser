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
      this.keyboardType,
      this.maxL,
      this.type,
      this.onC,
      this.obs})
      : super(key: key);
  final TextEditingController controller;
  final String hint;
  var keyboardType;
  final Widget icon;
  final onC;
  bool? obs;
  int? maxL;
  int? type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:keyboardType?? TextInputType.emailAddress,
      onChanged: onC,
      inputFormatters: type == 1
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9--]')),
            ]
          : null,
      controller: controller,
      readOnly: type == 1,
      maxLines: maxL,
      enabled: type != 1,
      style: const TextStyle(color: Colors.black),
      cursorColor: Get.theme.primaryColor,
      obscureText: obs ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: icon,
        label: Text(hint.tr),
        // hintText: hint.tr,
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
    );
  }
}
