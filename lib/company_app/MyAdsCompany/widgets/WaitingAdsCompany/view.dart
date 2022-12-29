import 'package:ejarkom/company_app/MyAdsCompany/widgets/cancdel_dialog_waiting.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/method.dart';
import '../../../AdsViewCompany/bindings.dart';
import '../../../AdsViewCompany/view.dart';
import 'index.dart';

class WaitingadscompanyPage extends GetView<WaitingadscompanyController> {
  const WaitingadscompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WaitingadscompanyController>(
      init: WaitingadscompanyController(),
      builder: (_) {
        return Obx(
          () => Center(
            child: controller.state.gettingState.value
                ? MyIndicator()
                : GetBuilder<WaitingadscompanyController>(builder: (logic) {
                    return controller.state.ads.isEmpty
                        ? Text(
                            'No Ads Yet.'.tr,
                            style: Get.theme.textTheme.bodyText1,
                          )
                        : ListView.separated(
                            itemCount: controller.state.ads.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => AdsviewcompanyPage(),
                                    binding: AdsviewcompanyBinding(
                                      controller.state.ads[index].id.toString(),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: Get.width,
                                        height: 400.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.sp),
                                            topRight: Radius.circular(10.sp),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '$photoAPI${controller.state.ads[index].getPhoto()}'),
                                            // image: NetworkImage(
                                            //     'https://images.pexels.com/photos/1662159/pexels-photo-1662159.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.w,
                                          vertical: 10.h,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                controller.state.ads[index]
                                                            .numRoom!
                                                            .toString() ==
                                                        '0'
                                                    ?  Container(): Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .meeting_room_outlined,
                                                      color: Get
                                                          .theme.primaryColor,
                                                      size: 60.sp,
                                                    ),
                                                    SizedBox(width: 6.w),
                                                    Text(
                                                      controller.state
                                                          .ads[index].numRoom!
                                                          .toString(),
                                                      style: Get
                                                          .textTheme.bodyText1!
                                                          .copyWith(
                                                        color: Get
                                                            .theme.primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 35.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                controller.state.ads[index]
                                                            .numBathroom!
                                                            .toString() ==
                                                        '0'
                                                    ? Container()
                                                    : Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .bathroom_outlined,
                                                            color: Get.theme
                                                                .primaryColor,
                                                            size: 60.sp,
                                                          ),
                                                          SizedBox(width: 6.w),
                                                          Text(
                                                            controller
                                                                .state
                                                                .ads[index]
                                                                .numBathroom!
                                                                .toString(),
                                                            style: Get.textTheme
                                                                .bodyText1!
                                                                .copyWith(
                                                              color: Get.theme
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 30.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                              ],
                                            ),
                                            SizedBox(height: 3.h),
                                            Row(
                                              children: [
                                                Text(
                                                  isEnglish()
                                                      ? controller.state
                                                          .ads[index].nameE!
                                                      : controller.state
                                                          .ads[index].nameA!,
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    color:
                                                        Get.theme.primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 40.sp,
                                                  ),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                            SizedBox(height: 3.h),
                                            Text(
                                              isEnglish()
                                                  ? controller
                                                      .state.ads[index].descE!
                                                  : controller
                                                      .state.ads[index].descA!,
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                fontSize: 35.sp,
                                                color: Get.theme.primaryColor,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                            ),
                                            SizedBox(height: 3.h),
                                            Text(
                                              isEnglish()
                                                  ? controller.state.ads[index]
                                                      .addressE!
                                                  : controller.state.ads[index]
                                                      .addressA!,
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                fontSize: 35.sp,
                                                color: Get.theme.primaryColor,
                                              ),
                                            ),
                                            SizedBox(height: 3.h),
                                            // Spacer(),
                                            Row(
                                              children: [
                                                Text(
                                                  '${controller.state.ads[index].costType}',
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    color: Colors.amber,
                                                    fontSize: 35.sp,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  '${controller.state.ads[index].cost} ${'JOD'.tr}',
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    color: Colors.amber,
                                                    fontSize: 40.sp,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            ElevatedButton(
                                              onPressed: () {
                                                Get.dialog(
                                                  CancelDialogCompoany(),
                                                  barrierDismissible: false,
                                                  arguments: [
                                                    controller
                                                        .state.ads[index].id
                                                        .toString(),
                                                    isEnglish()
                                                        ? controller.state
                                                            .ads[index].nameE
                                                        : controller.state
                                                            .ads[index].nameA,
                                                  ],
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize:
                                                      Size(Get.width, 40.h)),
                                              child: Text(
                                                'Cancel'.tr,
                                                style: Get.textTheme.bodyText1!
                                                    .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                thickness: 0.7.sp,
                                color: Get.theme.primaryColor,
                                endIndent: 50.w,
                                indent: 50.w,
                              );
                            },
                          );
                  }),
          ),
        );
      },
    );
  }
}
