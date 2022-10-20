import 'package:ejarkom/app/services/create_services_ad/create_services_ad_logic.dart';
import 'package:ejarkom/app/services/models/services_pandles_ads_model/pandle_serve.dart';
import 'package:ejarkom/packs/models/AllPacksModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PandleCard extends StatelessWidget {
  PandleCard({
    Key? key,
    required this.photo,
    required this.package,
  }) : super(key: key);
  final String photo;
  late PandleServe package;
  final CreateServicesAdLogic logic = Get.find<CreateServicesAdLogic>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(color: Colors.black12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(photo, width: 40.w),
                  ),
                ),
              ),
            ),
            SizedBox(width: 2.5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  package.nameE!,
                  style: Get.textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Get.theme.primaryColor,
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 180.w,
                  child: Text(
                    'Number of Days:${package.days}',
                    softWrap: true,
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.sp,
                      color: Get.theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  '${package.cost!} \$ ',
                  style: Get.textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Get.theme.primaryColor,
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    '${package.textE!} \$ ',
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColor,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            Obx(() {
              return Checkbox(
                value: logic.state.selectedPandle.value!.id == package.id,
                onChanged: (bool? vale) {
                  logic.state.selectedPandle.value = package;
                },
                activeColor: Get.theme.primaryColor,
              );
            })
          ],
        ),
      ),
    );
  }
}
