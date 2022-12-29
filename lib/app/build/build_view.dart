/// Generated by Flutter GetX Starter on 2022-10-09 11:57
import 'package:ejarkom/app/Ads/ads/widget/ads_requests/ads_requests_logic.dart';
import 'package:ejarkom/app/Ads/ads/widget/ads_requests/ads_requests_view.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'build_logic.dart';
import 'build_state.dart';

class BuildView extends StatefulWidget {
  @override
  _BuildViewState createState() => _BuildViewState();
}

class _BuildViewState extends State<BuildView> {
  final BuildLogic logic = Get.find<BuildLogic>();
  final BuildState state = Get.find<BuildLogic>().state;

  @override
  void dispose() {
    Get.delete<BuildLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => state.getState.value
            ? const MyIndicator()
            : SafeArea(
                child: Stack(
                  children: [
                    SizedBox(
                      height: Get.height,
                      child: PageView.builder(
                        itemBuilder: (context, index) {
                          return Image.network(
                            '$photoAPI${state.viewModel!.data!.getAllPhoto()[state.currentImages.value]}',
                            fit: BoxFit.cover,
                            height: Get.height,
                            // scale: 1,
                          );
                        },
                        itemCount: state.viewModel!.data!.getAllPhoto().length,
                        controller: state.pageController,
                        onPageChanged: (index) {
                          state.currentImages.value = index;
                          state.currentIndex.value = index;
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
                              activeIndex: state.currentIndex.value,
                              count:
                                  state.viewModel!.data!.getAllPhoto().length,
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
                                duration: const Duration(milliseconds: 300),
                                height: state.containerH.value,
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed:
                                                state.viewModel!.data!.video !=
                                                        null
                                                    ? () {
                                                        logic.lan();
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
                                              logic.changeContMode();
                                            },
                                            icon: Obx(() {
                                              return Icon(
                                                state.containerIsOpened.value ==
                                                        3
                                                    ? Icons.arrow_circle_up
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
                                      state.containerIsOpened.value == 3
                                          ? Container()
                                          : Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      isEnglish()
                                                          ? state.viewModel!
                                                              .data!.nameE!
                                                          : state.viewModel!
                                                              .data!.nameA!,
                                                      style: Get
                                                          .textTheme.bodyText1!
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 45.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Text(
                                                  '${state.viewModel!.data!.cost!} ${'JOD'.tr} ',
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    color: Colors.amber,
                                                  ),
                                                )
                                              ],
                                            ),
                                      state.containerIsOpened.value == 3
                                          ? Container()
                                          : SizedBox(height: 7.h),
                                      state.containerIsOpened.value == 3
                                          ? Container()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  isEnglish()
                                                      ? state.viewModel!.data!
                                                          .addressE!
                                                      : state.viewModel!.data!
                                                          .addressA!,
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 35.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                      state.containerIsOpened.value == 3
                                          ? Container()
                                          : SizedBox(height: 15.h),
                                      state.containerIsOpened.value == 3
                                          ? Container()
                                          : Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              children: [
                                               state.viewModel!.data!
                                                          .numRoom!
                                                          .toString()=='0'?Container(): Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .meeting_room_outlined,
                                                      color: Colors.white,
                                                      size: 65.sp,
                                                    ),
                                                    SizedBox(width: 6.w),
                                                    Text(
                                                      state.viewModel!.data!
                                                          .numRoom!
                                                          .toString(),
                                                      style: Get
                                                          .textTheme.bodyText1!
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 35.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 30.w),
                                              state.viewModel!.data!
                                                          .numBathroom!
                                                          .toString()=='0'?Container():  Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bathroom_outlined,
                                                      color: Colors.white,
                                                      size: 65.sp,
                                                    ),
                                                    SizedBox(width: 6.w),
                                                    Text(
                                                      state.viewModel!.data!
                                                          .numBathroom!
                                                          .toString(),
                                                      style: Get
                                                          .textTheme.bodyText1!
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 35.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                state.viewModel!.data!.userId!
                                                            .toString() ==
                                                        MyDataBase.getId()
                                                    ? Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .remove_red_eye_sharp,
                                                            color: Colors.white,
                                                            size: 65.sp,
                                                          ),
                                                          SizedBox(width: 6.w),
                                                          Text(
                                                            state.viewModel!
                                                                .data!.numView!
                                                                .toString(),
                                                            style: Get.textTheme
                                                                .bodyText1!
                                                                .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 35.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                      SizedBox(height: 10.h),
                                      state.containerIsOpened.value == 3
                                          ? Container()
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Obx(() {
                                                  return SizedBox(
                                                    height:
                                                        state.containerIsOpened
                                                                    .value ==
                                                                2
                                                            ? Get.height * 0.5.h
                                                            : 60.h,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Text(
                                                        isEnglish()
                                                            ? state.viewModel!
                                                                .data!.descE!
                                                            : state.viewModel!
                                                                .data!.descA!,
                                                        maxLines:
                                                            state.containerIsOpened
                                                                        .value ==
                                                                    2
                                                                ? null
                                                                : 2,
                                                        softWrap: state
                                                                .containerIsOpened
                                                                .value ==
                                                            2,
                                                        overflow:
                                                            state.containerIsOpened
                                                                        .value ==
                                                                    2
                                                                ? null
                                                                : TextOverflow
                                                                    .ellipsis,
                                                        style: Get.textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 35.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        logic.changeH();
                                                      },
                                                      child: Text(
                                                        state.containerIsOpened
                                                                    .value ==
                                                                2
                                                            ? 'show less'.tr
                                                            : 'show more'.tr,
                                                        style: Get.textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 30.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                      state.containerIsOpened.value == 3
                                          ? Container()
                                          : const Spacer(),
                                      state.containerIsOpened.value == 3
                                          ? Container()
                                          : state.viewModel!.data!.userId!
                                                      .toString() ==
                                                  MyDataBase.getId()
                                              ? ElevatedButton(
                                                  onPressed: () {
                                                    Get.put(
                                                      AdsRequestsLogic(
                                                        id: state.viewModel!
                                                            .data!.id!
                                                            .toString(),
                                                      ),
                                                    );
                                                    Get.to(() =>
                                                        AdsRequestsView());
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    fixedSize: Size(
                                                        Get.width / 1.5, 40.h),
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                  child: Text(
                                                    'Requests'.tr,
                                                    style: Get
                                                        .textTheme.bodyText1!
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Get
                                                          .theme.primaryColor,
                                                          fontSize: 50.sp,
                                                    ),
                                                  ),
                                                )
                                              : ElevatedButton(
                                                  onPressed: () {
                                                    logic.rentMethod();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                    elevation: 5,
                                                    shadowColor: Colors.white,
                                                    minimumSize: Size(
                                                        Get.width / 1.5, 80.h),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        8.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Rent'.tr,
                                                    style: Get
                                                        .textTheme.bodyText1!
                                                        .copyWith(
                                                      color: Get
                                                          .theme.primaryColor,
                                                      fontSize: 50.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
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
      ),
    );
  }
}
