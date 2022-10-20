import 'package:ejarkom/app/Ads/ads/widget/ads_requests/ads_requests_logic.dart';
import 'package:ejarkom/app/Ads/ads/widget/ads_requests/ads_requests_state.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckDialog extends StatelessWidget {
   CheckDialog({Key? key}) : super(key: key);
  final AdsRequestsLogic logic = Get.find<AdsRequestsLogic>();
  final AdsRequestsState state = Get.find<AdsRequestsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        title: Row(
          children: [
            IconButton(
              onPressed:state.checkMethodState.value?null: () {
                Get.back();
              },
              icon: Icon(Icons.close),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            state.checkMethodState.value?MyIndicator(): Text(
              'You want to check this user?'.tr,
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed:state.checkMethodState.value?null: () {
              logic.checkMethod(userId: logic.id!);
            },
            child: Text(
              'Yes',
              style: Get.textTheme.bodyText1!.copyWith(
                color: Get.theme.primaryColor,
              ),
            ),
          )
        ],
      );
    });
  }
}
