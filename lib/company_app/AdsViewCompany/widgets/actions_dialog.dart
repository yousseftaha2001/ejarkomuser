import 'package:ejarkom/company_app/AdsViewCompany/index.dart';
import 'package:ejarkom/company_app/AdsViewCompany/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/widgets/my_indicator.dart';

class MyActionDialogCompany extends StatelessWidget {
  MyActionDialogCompany({Key? key, required this.type, required this.id})
      : super(key: key);
  AdsviewcompanyState state = Get.find<AdsviewcompanyController>().state;
  AdsviewcompanyController controller = Get.find();
  late String type;
  late String id;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        title: Row(
          children: [
            IconButton(
              onPressed: state.actionState.value
                  ? null
                  : () {
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
            state.actionState.value
                ? MyIndicator()
                : Text(
                    '$type this user?'.tr,
                    style: Get.textTheme.bodyText1,
                  ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: state.actionState.value
                ? null
                : () {
                    // controller.actionDialog(type: type, id: id);
                   
                    controller.actionDialog(type: type, id: id);
                    
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
