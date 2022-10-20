import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'canceled_list_logic.dart';
import 'canceled_list_state.dart';

/// @description:
/// @author
/// @date: 2022-10-12 18:54:28
class CanceledListPage extends StatefulWidget {
  CanceledListPage({Key? key}) : super(key: key);

  @override
  State<CanceledListPage> createState() => _CanceledListPageState();
}

class _CanceledListPageState extends State<CanceledListPage> {
  final CanceledListLogic logic = Get.put(CanceledListLogic());

  final CanceledListState state = Get.find<CanceledListLogic>().state;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<CanceledListLogic>();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: state.gettingState.value
            ? MyIndicator()
            : state.ads.isEmpty
                ? Text(
                    'No Ads Yet.'.tr,
                    style: Get.textTheme.bodyText1,
                  )
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
                                  horizontal: 15.w, vertical: 10.h),
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
