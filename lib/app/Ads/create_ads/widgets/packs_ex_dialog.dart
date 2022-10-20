import 'package:ejarkom/packs/all_packs/all_packs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/get.dart';

class PackageExDialog extends StatelessWidget {
  const PackageExDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You Ads Package Is Over'.tr,
            style: Get.textTheme.bodyText1,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Cancel'.tr,
                style: Get.textTheme.bodyText1!.copyWith(
                  color: Get.theme.primaryColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => AllPacksView());
              },
              child: Text(
                'Get New Package'.tr,
                style: Get.textTheme.bodyText1!.copyWith(
                  color: Get.theme.primaryColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
