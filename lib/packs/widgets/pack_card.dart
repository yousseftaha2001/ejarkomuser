import 'package:ejarkom/packs/add_pack/add_pack_view.dart';
import 'package:ejarkom/packs/models/AllPacksModel.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PackWidget extends StatelessWidget {
  PackWidget({
    Key? key,
    required this.photo,
    required this.package,
  }) : super(key: key);
  final String photo;
  late PandleAds package;

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
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 20.w),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(photo,),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                isEnglish()?  package.nameE!:package.nameA!,
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
                    '${'Number of Ads:'.tr}${package.numAds}',
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
                  '${package.cost!} ${'JOD'.tr} ',
                  style: Get.textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Get.theme.primaryColor,
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 450.w,
                  height: 100.h,
                  child: Text(
                    isEnglish()? package.textE!:package.textA!,
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColor,
                      fontSize: 30.sp,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            Spacer(),
            OutlinedButton(
              onPressed: () {
                // logic.addPackMethod(id: package.id!.toString());
                Get.dialog(
                  AddPackView(package.id.toString()),
                  barrierDismissible: false,
                );
              },
              child: Text('Buy'.tr),
            ),
            // SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
