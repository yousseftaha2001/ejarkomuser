import 'package:ejarkom/company_app/AdsViewCompany/requests_view.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/method.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class AdsviewcompanyPage extends GetView<AdsviewcompanyController> {
  const AdsviewcompanyPage({Key? key}) : super(key: key);

  // 主视图

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdsviewcompanyController>(
      builder: (_) {
        return Obx(() {
          return controller.state.pageState.value != 3
              ? const MyIndicator()
              : controller.state.pageState.value == 2
                  ? Center(
                      child: Text(
                        controller.state.localError!.error,
                      ),
                    )
                  : Scaffold(
                      body: SafeArea(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: Get.height,
                              child: PageView.builder(
                                itemBuilder: (context, index) {
                                  return Image.network(
                                    '$photoAPI${controller.state.ads!.getAllPhoto()[controller.state.currentImages.value]}',
                                    fit: BoxFit.cover,
                                    height: Get.height,
                                    // scale: 1,
                                  );
                                },
                                itemCount:
                                    controller.state.ads!.getAllPhoto().length,
                                controller: controller.state.pageControlle,
                                onPageChanged: (index) {
                                  controller.state.currentImages.value = index;
                                  controller.state.currentIndex.value = index;
                                },
                              ),
                            ),
                            Positioned(
                              left: 10.w,
                              top: 30.h,
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 50.sp,
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 40.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Obx(
                                    () => AnimatedSmoothIndicator(
                                      activeIndex:
                                          controller.state.currentIndex.value,
                                      count: controller.state.ads!
                                          .getAllPhoto()
                                          .length,
                                      effect: ExpandingDotsEffect(
                                        activeDotColor: Get.theme.primaryColor,
                                        dotHeight: 15.h,
                                        dotWidth: 15.h,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Obx(
                                    () {
                                      return AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        height:
                                            controller.state.containerH.value,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff102129),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.sp),
                                            topRight: Radius.circular(30.sp),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20.w,
                                            vertical: 10.h,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                    onPressed: controller.state
                                                                .ads!.video !=
                                                            null
                                                        ? () {
                                                            controller.lan();
                                                          }
                                                        : null,
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.youtube,
                                                      // color: Colors.white,
                                                      size: 60.sp,
                                                    ),
                                                    disabledColor: Colors.grey,
                                                    color: Colors.white,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .changeContMode();
                                                    },
                                                    icon: Obx(() {
                                                      return Icon(
                                                        controller
                                                                    .state
                                                                    .containerIsOpened
                                                                    .value ==
                                                                3
                                                            ? Icons
                                                                .arrow_circle_up
                                                            : Icons
                                                                .arrow_drop_down_circle,
                                                        color: Colors.white,
                                                        size: 60.sp,
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5.h),
                                              controller.state.containerIsOpened
                                                          .value ==
                                                      3
                                                  ? Container()
                                                  : Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              isEnglish()
                                                                  ? controller
                                                                      .state
                                                                      .ads!
                                                                      .nameE!
                                                                  : controller
                                                                      .state
                                                                      .ads!
                                                                      .nameA!,
                                                              style: Get
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 45.sp,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Text(
                                                          '${controller.state.ads!.cost!} ${'JOD'.tr} ',
                                                          style: Get.textTheme
                                                              .bodyText1!
                                                              .copyWith(
                                                            color: Colors.amber,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                              controller.state.containerIsOpened
                                                          .value ==
                                                      3
                                                  ? Container()
                                                  : SizedBox(height: 7.h),
                                              controller.state.containerIsOpened
                                                          .value ==
                                                      3
                                                  ? Container()
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          isEnglish()
                                                              ? controller
                                                                  .state
                                                                  .ads!
                                                                  .addressE!
                                                              : controller
                                                                  .state
                                                                  .ads!
                                                                  .addressA!,
                                                          style: Get.textTheme
                                                              .bodyText1!
                                                              .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 35.sp,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                              controller.state.containerIsOpened
                                                          .value ==
                                                      3
                                                  ? Container()
                                                  : SizedBox(height: 15.h),
                                              controller.state.containerIsOpened
                                                          .value ==
                                                      3
                                                  ? Container()
                                                  : Row(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .meeting_room_outlined,
                                                              color:
                                                                  Colors.white,
                                                              size: 65.sp,
                                                            ),
                                                            SizedBox(
                                                                width: 6.w),
                                                            Text(
                                                              controller.state
                                                                  .ads!.numRoom!
                                                                  .toString(),
                                                              style: Get
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 35.sp,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(width: 30.w),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .bathroom_outlined,
                                                              color:
                                                                  Colors.white,
                                                              size: 65.sp,
                                                            ),
                                                            SizedBox(
                                                                width: 6.w),
                                                            Text(
                                                              controller
                                                                  .state
                                                                  .ads!
                                                                  .numBathroom!
                                                                  .toString(),
                                                              style: Get
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 35.sp,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        controller.state.ads!
                                                                    .userId!
                                                                    .toString() ==
                                                                MyDataBase
                                                                    .getId()
                                                            ? Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .remove_red_eye_sharp,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 65.sp,
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          6.w),
                                                                  Text(
                                                                    controller
                                                                        .state
                                                                        .ads!
                                                                        .numView!
                                                                        .toString(),
                                                                    style: Get
                                                                        .textTheme
                                                                        .bodyText1!
                                                                        .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          35.sp,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            : Container(),
                                                      ],
                                                    ),
                                              SizedBox(height: 10.h),
                                              controller.state.containerIsOpened
                                                          .value ==
                                                      3
                                                  ? Container()
                                                  : Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Obx(() {
                                                          return SizedBox(
                                                            height: controller
                                                                        .state
                                                                        .containerIsOpened
                                                                        .value ==
                                                                    2
                                                                ? Get.height *
                                                                    0.5.h
                                                                : 60.h,
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Text(
                                                                isEnglish()
                                                                    ? controller
                                                                        .state
                                                                        .ads!
                                                                        .descE!
                                                                    : controller
                                                                        .state
                                                                        .ads!
                                                                        .descA!,
                                                                maxLines: controller
                                                                            .state
                                                                            .containerIsOpened
                                                                            .value ==
                                                                        2
                                                                    ? null
                                                                    : 2,
                                                                softWrap: controller
                                                                        .state
                                                                        .containerIsOpened
                                                                        .value ==
                                                                    2,
                                                                overflow: controller
                                                                            .state
                                                                            .containerIsOpened
                                                                            .value ==
                                                                        2
                                                                    ? null
                                                                    : TextOverflow
                                                                        .ellipsis,
                                                                style: Get
                                                                    .textTheme
                                                                    .bodyText1!
                                                                    .copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      35.sp,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {
                                                                controller
                                                                    .changeH();
                                                              },
                                                              child: Text(
                                                                controller
                                                                            .state
                                                                            .containerIsOpened
                                                                            .value ==
                                                                        2
                                                                    ? 'show less'
                                                                        .tr
                                                                    : 'show more'
                                                                        .tr,
                                                                style: Get
                                                                    .textTheme
                                                                    .bodyText1!
                                                                    .copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      30.sp,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Spacer(),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Get.to(()=>AdsRequestsViewCompany());
                                                  // Get.put(
                                                  //   AdsRequestsLogic(
                                                  //     id: state.viewModel!
                                                  //         .data!.id!
                                                  //         .toString(),
                                                  //   ),
                                                  // );
                                                  // Get.to(() =>
                                                  //     AdsRequestsView());
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(
                                                      Get.width / 1.5, 40.h),
                                                  backgroundColor: Colors.white,
                                                ),
                                                child: Text(
                                                  'Requests'.tr,
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Get.theme.primaryColor,
                                                    fontSize: 50.sp,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
        });
      },
    );
  }
}
