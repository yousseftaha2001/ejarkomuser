import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ejarkom/app/Ads/ads/widget/ads_requests/ads_requests_logic.dart';
import 'package:ejarkom/app/Ads/ads/widget/ads_requests/ads_requests_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class MyActionDialog extends StatelessWidget {
   MyActionDialog({Key? key,required this.type}) : super(key: key);
  final AdsRequestsLogic logic = Get.find<AdsRequestsLogic>();
  final AdsRequestsState state = Get.find<AdsRequestsLogic>().state;
  late String type;


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        title: Row(
          children: [
            IconButton(
              onPressed:state.actionState.value?null: () {
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
            state.actionState.value?MyIndicator(): Text(
              '$type this user?'.tr,
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed:state.actionState.value?null: () {
              logic.actionDialog(type: type);
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
