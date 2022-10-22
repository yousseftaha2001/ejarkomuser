import 'package:ejarkom/utils/my_database.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../utils/apis.dart';
import 'view_services_logic.dart';
import 'view_services_state.dart';

/// @description:
/// @author
/// @date: 2022-10-22 03:07:05
class ViewServicesPage extends StatefulWidget {
  ViewServicesPage({Key? key}) : super(key: key);

  @override
  State<ViewServicesPage> createState() => _ViewServicesPageState();
}

class _ViewServicesPageState extends State<ViewServicesPage> {
  final ViewServicesLogic logic = Get.find<ViewServicesLogic>();

  final ViewServicesState state = Get.find<ViewServicesLogic>().state;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<ViewServicesLogic>();
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
                      height: Get.height * 0.9.h,
                      child: PageView.builder(
                        itemBuilder: (context, index) {
                          return Image.network(
                            '$photoAPI${state.serve.data!.getAllPhoto()[state.currentImages.value]}',
                            fit: BoxFit.cover,
                            height: Get.height.h * 0.9.h,
                          );
                        },
                        itemCount: state.serve.data!.getAllPhoto().length,
                        controller: state.pageController,
                        onPageChanged: (index) {
                          state.currentImages.value = index;
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
                            radius: 22.sp,
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 25.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Obx(
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
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.serve.data!.nameE!,
                                            style: Get.textTheme.bodyText1!
                                                .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      // Text(
                                      //   '${state.serve!.cost!}\$',
                                      //   style:
                                      //       Get.textTheme.bodyText1!.copyWith(
                                      //     color: Colors.amber,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  SizedBox(height: 7.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        state.serve.data!.cityE!,
                                        style:
                                            Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15.h),
                                  Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              logic.launchWhatsApp(
                                                phone: '+201033953634',
                                                message: 'hello',
                                              );
                                            },
                                            icon: const Icon(
                                              FontAwesomeIcons.whatsapp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 1.w),
                                          Text(
                                            state.serve.data!.whats!.toString(),
                                            style: Get.textTheme.bodyText1!
                                                .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.w),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              logic.launchPhoneDialer(
                                                  '+20${state.serve.data!.phone!}');
                                            },
                                            icon: Icon(
                                              Icons.phone,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 1.w),
                                          Text(
                                            state.serve.data!.phone!.toString(),
                                            style: Get.textTheme.bodyText1!
                                                .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Spacer(),
                                      state.serve.data!.userId!.toString() ==
                                              MyDataBase.getId()
                                          ? Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.w),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.remove_red_eye_sharp,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Text(
                                                    state.serve.data!.numView!
                                                        .toString(),
                                                    style: Get
                                                        .textTheme.bodyText1!
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                  SizedBox(height: 15.h),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(() {
                                        return SizedBox(
                                          height: state.containerIsOpened.value
                                              ? Get.height * 0.7.h.h
                                              : 60.h,
                                          child: SingleChildScrollView(
                                            child: Text(
                                              state.serve.data!.textE!,
                                              maxLines:
                                                  state.containerIsOpened.value
                                                      ? null
                                                      : 2,
                                              softWrap:
                                                  state.containerIsOpened.value,
                                              overflow:
                                                  state.containerIsOpened.value
                                                      ? null
                                                      : TextOverflow.ellipsis,
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 17.sp,
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
                                              state.containerIsOpened.value
                                                  ? 'show less'
                                                  : 'show more',
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  // state.serve!.userId!.toString() ==
                                  //         MyDataBase.getId()
                                  //     ? ElevatedButton(
                                  //         onPressed: () {
                                  //           // Get.put(
                                  //           //   AdsRequestsLogic(
                                  //           //     id: state.serve!.id!
                                  //           //         .toString(),
                                  //           //   ),
                                  //           // );
                                  //           // Get.to(() => AdsRequestsView());
                                  //         },
                                  //         style: ElevatedButton.styleFrom(
                                  //           fixedSize:
                                  //               Size(Get.width / 3.w, 40.h),
                                  //           backgroundColor: Colors.white,
                                  //         ),
                                  //         child: Text(
                                  //           'Requests'.tr,
                                  //           style: Get.textTheme.bodyText1!
                                  //               .copyWith(
                                  //             fontWeight: FontWeight.bold,
                                  //             color: Get.theme.primaryColor,
                                  //           ),
                                  //         ),
                                  //       )
                                  //     : ElevatedButton(
                                  //         onPressed: () {
                                  //           logic.rentMethod();
                                  //         },
                                  //         style: ElevatedButton.styleFrom(
                                  //           primary: Colors.white,
                                  //           elevation: 5,
                                  //           shadowColor: Colors.white,
                                  //           minimumSize:
                                  //               Size(Get.width.w, 50.h),
                                  //           shape: RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(8.sp),
                                  //           ),
                                  //         ),
                                  //         child: Text(
                                  //           'Rent'.tr,
                                  //           style: Get.textTheme.bodyText1!
                                  //               .copyWith(
                                  //             color: Get.theme.primaryColor,
                                  //             fontSize: 22.sp,
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //         ),
                                  //       ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
