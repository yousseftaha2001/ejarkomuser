import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ActionDialog extends StatelessWidget {
  // ErrorDialog({Key? key}) : super(key: key);
  late String title;
  late Icon icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(height: 15.h),
          Text(
            title,
            style: Get.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  ActionDialog({
    required this.title,
    required this.icon,
  });
}

class ErrorM extends StatelessWidget {
  const ErrorM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
