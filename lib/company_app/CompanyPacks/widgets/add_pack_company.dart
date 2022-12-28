import 'package:ejarkom/company_app/CompanyPacks/controller.dart';
import 'package:ejarkom/company_app/CompanyPacks/index.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddPackViewCompany extends StatelessWidget {
  final CompanypacksController logic = Get.find<CompanypacksController>();

  final CompanypacksState state = Get.find<CompanypacksController>().state;
  late String id;

  AddPackViewCompany(this.id);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
        ),
        title: Row(
          children: [
            IconButton(
              onPressed: state.addPackState.value
                  ? null
                  : () {
                      Get.back();
                    },
              icon: Icon(Icons.close),
            )
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            state.addPackState.value
                ? MyIndicator()
                : Text(
                    'Are you sure you want buy this package?'.tr,
                    style: Get.textTheme.bodyText1,
                  )
          ],
        ),
        actions: [
          ButtonBar(
            children: [
              TextButton(
                onPressed: state.addPackState.value
                    ? null
                    : () {
                        logic.buyPack(id);
                      },
                child: Text('Yes'.tr),
              ),
              TextButton(
                onPressed: state.addPackState.value
                    ? null
                    : () {
                        Get.back();
                      },
                child: Text('No'.tr),
              )
            ],
          )
        ],
      );
    });
  }
}
