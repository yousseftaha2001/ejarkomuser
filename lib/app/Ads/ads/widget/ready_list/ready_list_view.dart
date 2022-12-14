import 'package:ejarkom/app/Ads/ads/widget/ads_requests/ads_requests_logic.dart';
import 'package:ejarkom/app/Ads/ads/widget/ads_requests/ads_requests_view.dart';
import 'package:ejarkom/app/Ads/ads/widget/cancel_dialog/cancel_dialog_view.dart';
import 'package:ejarkom/app/build/build_logic.dart';
import 'package:ejarkom/app/build/build_view.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/widgets/my_indicator.dart';
import 'ready_list_logic.dart';
import 'ready_list_state.dart';

/// @description:
/// @author
/// @date: 2022-10-12 18:48:43
class ReadyListPage extends StatefulWidget {
  ReadyListPage({Key? key}) : super(key: key);

  @override
  State<ReadyListPage> createState() => _ReadyListPageState();
}

class _ReadyListPageState extends State<ReadyListPage> {
  final ReadyListLogic logic = Get.put(ReadyListLogic());

  final ReadyListState state = Get.find<ReadyListLogic>().state;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<ReadyListLogic>();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: state.gettingState.value
            ? MyIndicator()
            : GetBuilder<ReadyListLogic>(
                assignId: true,
                builder: (logic) {
                  return state.ads.isEmpty
                      ? Text(
                          'No Ads Yet.'.tr,
                          style: Get.textTheme.bodyText1,
                        )
                      : ListView.separated(
                          itemCount: state.ads.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.put(
                                  BuildLogic(
                                    id: state.ads[index].id!.toString(),
                                  ),
                                );
                                Get.to(() => BuildView());
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
                                          // image: NetworkImage('$photoAPI${imagePath}'),
                                          image: NetworkImage(
                                              '$photoAPI${state.ads[index].getPhoto()}'),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.meeting_room_outlined,
                                                    color:
                                                        Get.theme.primaryColor,
                                                        size: 60.sp,
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Text(
                                                    state.ads[index].numRoom!
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
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.bathroom_outlined,
                                                    color:
                                                        Get.theme.primaryColor,
                                                        size: 60.sp,
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Text(
                                                    state
                                                        .ads[index].numBathroom!
                                                        .toString(),
                                                    style: Get
                                                        .textTheme.bodyText1!
                                                        .copyWith(
                                                      color: Get
                                                          .theme.primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      // fontSize: 20.sp,
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
                                                 isEnglish()? state.ads[index].nameE!:state.ads[index].nameE!,
                                                style: Get.textTheme.bodyText1!
                                                    .copyWith(
                                                  color: Get.theme.primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40.sp,
                                                ),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                          SizedBox(height: 3.h),
                                          Text(
                                            isEnglish()? state.ads[index].descE!:state.ads[index].descA!,
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
                                            isEnglish()? state.ads[index].addressE!:state.ads[index].addressA!,
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
                                                '${state.ads[index].costType}',
                                                style: Get.textTheme.bodyText1!
                                                    .copyWith(
                                                  color: Colors.amber,
                                                    fontSize: 35.sp,
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '${state.ads[index].id}\$',
                                                style: Get.textTheme.bodyText1!
                                                    .copyWith(
                                                  color: Colors.amber,
                                                  fontSize: 40.sp,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Get.dialog(
                                                    CancelDialogView(
                                                      id: state.ads[index].id
                                                          .toString(),
                                                      name: state
                                                          .ads[index].nameE
                                                          .toString(),
                                                    ),
                                                    barrierDismissible: false,
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    fixedSize: Size(
                                                        Get.width / 3.w, 40.h)),
                                                child: Text(
                                                  'Cancel'.tr,
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Get.put(
                                                    AdsRequestsLogic(
                                                      id: state.ads[index].id!
                                                          .toString(),
                                                    ),
                                                  );
                                                  Get.to(
                                                      () => AdsRequestsView());
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    fixedSize: Size(
                                                        Get.width / 3.w, 40.h)),
                                                child: Text(
                                                  'Show'.tr,
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              thickness: 0.7.sp,
                              color: Get.theme.primaryColor,
                              endIndent: 50.w,
                              indent: 50.w,
                            );
                          },
                        );
                },
              ),
      ),
    );
  }
}
