import 'package:ejarkom/app/build/build_logic.dart';
import 'package:ejarkom/app/build/build_view.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/method.dart';
import '../models/PageOneModel.dart';

class BuildingWidget extends StatelessWidget {
  final BuildAds ads;

  BuildingWidget({
    Key? key,
    required this.ads,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.put(BuildLogic(id: ads.id.toString()));
        Get.to(() => BuildView());
      },
      child: Material(
        elevation: 3.sp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Container(
          // color: Colors.black,
          width: Get.width / 2,
          height: 500.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: Get.width / 2,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    topRight: Radius.circular(10.sp),
                  ),
                  image: DecorationImage(
                    image: NetworkImage('$photoAPI${ads.getPhoto()}'),
                    // image: NetworkImage(
                    //     'https://images.pexels.com/photos/1662159/pexels-photo-1662159.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Text(
                          isEnglish() ? ads.nameE! : ads.nameA!,
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      isEnglish() ? ads.descE! : ads.descA!,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 30.sp,
                        color: Get.theme.primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      isEnglish() ? ads.addressE! : ads.addressA!,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 30.sp,
                        color: Get.theme.primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    SizedBox(height: 20.h),
                    // Spacer(),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.meeting_room_outlined,
                                  color: Get.theme.primaryColor,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  ads.numRoom!.toString(),
                                  style: Get.textTheme.bodyText1!.copyWith(
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.w),
                            Row(
                              children: [
                                Icon(
                                  Icons.bathroom_outlined,
                                  color: Get.theme.primaryColor,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  ads.numBathroom!.toString(),
                                  style: Get.textTheme.bodyText1!.copyWith(
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '${ads.cost}\$',
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: Colors.amber,
                            fontSize: 40.sp,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
