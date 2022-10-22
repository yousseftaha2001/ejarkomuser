import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../complete_data/complete_data_view.dart';

class DataDialog extends StatelessWidget {
  const DataDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 40.sp,
          ),
          SizedBox(height: 30.h),
          Text(
            'Your data is not complete'.tr,
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            onPressed: () {
              Get.to(() => CompleteDataView());
            },
            child: Text(
              'complete Data'.tr,
            ),
          )
        ],
      ),
    );
  }
}
