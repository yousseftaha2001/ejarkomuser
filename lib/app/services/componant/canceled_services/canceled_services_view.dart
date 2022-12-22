/// Generated by Flutter GetX Starter on 2022-10-16 04:50
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'canceled_services_logic.dart';
import 'canceled_services_state.dart';

class CanceledServicesView extends StatefulWidget {
  @override
  _CanceledServicesViewState createState() => _CanceledServicesViewState();
}

class _CanceledServicesViewState extends State<CanceledServicesView> {
  final CanceledServicesLogic logic = Get.put(CanceledServicesLogic());
  final CanceledServicesState state = Get.find<CanceledServicesLogic>().state;

  @override
  void dispose() {
    Get.delete<CanceledServicesLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: state.gettingState.value
            ? MyIndicator()
            : state.services.isEmpty
                ? Text(
                    'No Services Yet.'.tr,
                    style: Get.textTheme.bodyText1,
                  )
                : GetBuilder<CanceledServicesLogic>(builder: (logic) {
                    return state.services.isEmpty
                        ? Text(
                            'No Services Yet.'.tr,
                            style: Get.textTheme.bodyText1,
                          )
                        : ListView.separated(
                            itemCount: state.services.length,
                            itemBuilder: (context, index) {
                              return Card(
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
                                          '$photoAPI${state.services[index].getPhoto()}'),
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                color: Get.theme.primaryColor,
                                                size: 60.sp,
                                              ),
                                              SizedBox(width: 6.w),
                                              Text(
                                                state.services[index].phone
                                                    .toString(),
                                                style: Get.textTheme.bodyText1!
                                                    .copyWith(
                                                  color: Get.theme.primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 35.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.whatsapp,
                                                color: Get.theme.primaryColor,
                                                size: 60.sp,
                                              ),
                                              SizedBox(width: 6.w),
                                              Text(
                                                state.services[index].whats
                                                    .toString(),
                                                style: Get.textTheme.bodyText1!
                                                    .copyWith(
                                                  color: Get.theme.primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 35.sp,
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
                                            isEnglish()? state.services[index].nameE!:state.services[index].nameA!,
                                            style: Get.textTheme.bodyText1!
                                                .copyWith(
                                              color: Get.theme.primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30.sp,
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                      SizedBox(height: 3.h),
                                      Text(
                                        isEnglish()? state.services[index].textE!:state.services[index].textA!,
                                        style:
                                            Get.textTheme.bodyText1!.copyWith(
                                          fontSize: 30.sp,
                                          color: Get.theme.primaryColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                      SizedBox(height: 3.h),
                                      Text(
                                        isEnglish()? state.services[index].cityE!:state.services[index].cityA!,
                                        style:
                                            Get.textTheme.bodyText1!.copyWith(
                                          fontSize: 30.sp,
                                          color: Get.theme.primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 3.h),
                                      // Spacer(),

                                      SizedBox(height: 10.h),
                                      
                                    ],
                                  ),
                                ),
                              ],
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
  }
}
