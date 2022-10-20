import 'package:ejarkom/app/services/create_services_ad/create_services_ad_logic.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_state.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompleteDialog extends StatelessWidget {
  CompleteDialog({Key? key}) : super(key: key);
  final CreateServicesAdLogic logic = Get.find<CreateServicesAdLogic>();

  final CreateServicesAdState state = Get.find<CreateServicesAdLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            state.publishState.value
                ? MyIndicator()
                : Text(
                    'Start yo publish this service AD?'.tr,
                    style: Get.theme.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: state.publishState.value
                ? null
                : () {
                    logic.publishAd();
                  },
            child: Text('Yes'.tr),
          ),
          ElevatedButton(
            onPressed: state.publishState.value
                ? null
                : () {
                    Get.back();
                  },
            child: Text('No'.tr),
          )
        ],
      );
    });
  }
}
