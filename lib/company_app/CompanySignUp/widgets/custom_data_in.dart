import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class CustomDataInput extends StatefulWidget {
  late String title;
  late bool obs;
  Icon? icon;
  late bool enabled;
  late var onChanged;
  var keyBoard;
  TextEditingController? controller;
  var formaters;
   bool? eyes;
  // int maxl;
  int? maxLines;

  @override
  State<CustomDataInput> createState() => _CustomDataInputState();

  CustomDataInput(
      {super.key,
      required this.title,
      required this.obs,
      this.icon,
      required this.onChanged,
      required this.enabled,
        this.eyes,
      this.controller,
      this.keyBoard,
      this.formaters,
      this.maxLines});
}

class _CustomDataInputState extends State<CustomDataInput> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      keyboardType: widget.keyBoard,
      inputFormatters: widget.formaters,
      controller: widget.controller,
      style: Get.textTheme.bodyText1!.copyWith(
        color: Get.theme.primaryColor,
        fontSize: 30.sp,
      ),
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.sp),
        ),
        hintText: widget.title.tr,
        prefixIcon: widget.icon == null
            ? Container(
                height: 0,
                width: 0,
              )
            : Align(
                child: widget.icon,
                widthFactor: 1.0,
                heightFactor: 1.0,
              ),
        suffixIcon: widget.eyes!=null?
            Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: GestureDetector(
                  child: Icon(Icons.remove_red_eye),
                  onTap: () {
                    setState(() {
                      widget.obs=!widget.obs;
                    });
                  },
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
      ),
      obscureText: widget.obs,
      validator: (String? text) {
        if (text!.length > 4) {
          return null;
        } else {
          return 'please enter a valid ${widget.title}';
        }
      },
    );
  }
}