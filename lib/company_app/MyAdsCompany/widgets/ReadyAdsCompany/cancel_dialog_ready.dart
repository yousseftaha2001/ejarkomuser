import 'package:ejarkom/company_app/MyAdsCompany/widgets/ReadyAdsCompany/controller.dart';
import 'package:ejarkom/company_app/MyAdsCompany/widgets/ReadyAdsCompany/index.dart';
import 'package:ejarkom/company_app/MyAdsCompany/widgets/WaitingAdsCompany/controller.dart';
import 'package:ejarkom/company_app/MyAdsCompany/widgets/WaitingAdsCompany/index.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CancelDialogReadyCompoany extends StatefulWidget {
  CancelDialogReadyCompoany({Key? key}) : super(key: key);

  @override
  State<CancelDialogReadyCompoany> createState() => _CancelDialogState();
}

class _CancelDialogState extends State<CancelDialogReadyCompoany> {
  ReadyadscompanyController adsController = Get.find();

  ReadyadscompanyState state = Get.find<ReadyadscompanyController>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        title: Row(
          children: [
            IconButton(
              onPressed: state.cancelState.value
                  ? null
                  : () {
                      Get.back();
                    },
              icon: const Icon(Icons.close),
            )
          ],
        ),
        content: state.cancelState.value
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  MyIndicator(),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${Get.arguments[1]!} '.tr,
                    style: Get.textTheme.bodyText1,
                  ),
                  Text(
                    'Are you sure to cancel this AD? '.tr,
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(height: 15.h),
                  ElevatedButton(
                    onPressed: () {
                      adsController.cancelAd(id: Get.arguments[0]!);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(Get.width / 5.w, 40.h)),
                    child: Text(
                      'Yes'.tr,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}