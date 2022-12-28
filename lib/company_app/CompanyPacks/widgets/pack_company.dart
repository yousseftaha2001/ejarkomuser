import 'package:ejarkom/company_app/CompanyPacks/models/packs_request_model.dart';
import 'package:ejarkom/company_app/CompanyPacks/widgets/add_pack_company.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PackWidgetCompany extends StatelessWidget {
  PackWidgetCompany({
    Key? key,
    required this.photo,
    required this.package,
  }) : super(key: key);
  final String photo;
  late PandleAd package;

  @override
  Widget build(BuildContext context) {
    printInfo(info: 'll');
    return Container(
      width: 300.w,
      // height: 150.h,
      decoration: BoxDecoration(
        // color: Colors.black,
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
                    child: Image.asset(photo, width: 60.w),
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
                 isEnglish()? package.nameE!:package.nameA!,
                  style: Get.textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.sp,
                    color: Get.theme.primaryColor,
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 180.w,
                  child: Text(
                    '${'Number of Ads '.tr}${package.numAds}',
                    softWrap: true,
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 30.sp,
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
                    '${isEnglish()? package.textE!:package.textA!}',
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColor,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                // logic.addPackMethod(id: package.id!.toString());
                Get.dialog(
                  AddPackViewCompany(package.id.toString()),
                  barrierDismissible: false,
                );
              },
              child: Text('Buy'.tr),
            )
          ],
        ),
      ),
    );
  }
}
