import 'package:ejarkom/app/complete_data/complete_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DataErrorDialog extends StatelessWidget {
  const DataErrorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your information is not complete yet'.tr,
            style: Get.textTheme.bodyText1!.copyWith(
              fontSize: 22.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.to(() => CompleteDataView());
            },
            child: Text('complete Info'.tr),
          )
        ],
      ),
    );
  }
}
