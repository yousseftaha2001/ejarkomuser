import 'package:ejarkom/app/Ads/ads/widget/cancel_dialog/cancel_dialog_view.dart';

import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'waitting_list_logic.dart';
import 'waitting_list_state.dart';

/// @description:
/// @author
/// @date: 2022-10-12 17:47:18
class WaittingListPage extends StatefulWidget {
  WaittingListPage({Key? key}) : super(key: key);

  @override
  State<WaittingListPage> createState() => _WaittingListPageState();
}

class _WaittingListPageState extends State<WaittingListPage> {
  final WaittingListLogic logic = Get.put(WaittingListLogic());

  final WaittingListState state = Get.find<WaittingListLogic>().state;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<WaittingListLogic>();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: state.gettingState.value
            ? MyIndicator()
            : state.ads.isEmpty
                ? Text('No Ads Yet.'.tr,style: Get.theme.textTheme.bodyText1,)
                : ListView.separated(
                    itemCount: state.ads.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Container(
                              width: Get.width,
                              height: 200.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.sp),
                                  topRight: Radius.circular(10.sp),
                                ),
                                image: const DecorationImage(
                                  // image: NetworkImage('$photoAPI${imagePath}'),
                                  image: NetworkImage(
                                      'https://images.pexels.com/photos/1662159/pexels-photo-1662159.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.meeting_room_outlined,
                                            color: Get.theme.primaryColor,
                                          ),
                                          SizedBox(width: 6.w),
                                          Text(
                                            state.ads[index].numRoom!
                                                .toString(),
                                            style: Get.textTheme.bodyText1!
                                                .copyWith(
                                              color: Get.theme.primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.bathroom_outlined,
                                            color: Get.theme.primaryColor,
                                          ),
                                          SizedBox(width: 6.w),
                                          Text(
                                            state.ads[index].numBathroom!
                                                .toString(),
                                            style: Get.textTheme.bodyText1!
                                                .copyWith(
                                              color: Get.theme.primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
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
                                        state.ads[index].nameE!,
                                        style:
                                            Get.textTheme.bodyText1!.copyWith(
                                          color: Get.theme.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    state.ads[index].descE!,
                                    style: Get.textTheme.bodyText1!.copyWith(
                                      fontSize: 17.sp,
                                      color: Get.theme.primaryColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    state.ads[index].addressE!,
                                    style: Get.textTheme.bodyText1!.copyWith(
                                      fontSize: 17.sp,
                                      color: Get.theme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  // Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        '${state.ads[index].costType}',
                                        style:
                                            Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.amber,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '${state.ads[index].cost}\$',
                                        style:
                                            Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.amber,
                                          fontSize: 20.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.dialog(
                                        CancelDialogView(
                                          id: state.ads[index].id.toString(),
                                          name:
                                              state.ads[index].nameE.toString(),
                                        ),
                                        barrierDismissible: false,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(Get.width, 40.h)),
                                    child: Text(
                                      'Cancel'.tr,
                                      style: Get.textTheme.bodyText1!.copyWith(
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
                  ),
      ),
    );
  }
}
