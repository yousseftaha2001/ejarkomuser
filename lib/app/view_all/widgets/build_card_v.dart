import 'package:ejarkom/app/build/build_logic.dart';
import 'package:ejarkom/app/build/build_view.dart';
import 'package:ejarkom/app/main/models/PageOneModel.dart';
import 'package:ejarkom/app/view_all/view_all_logic.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/apis.dart';

class BuildingWidgetV extends StatefulWidget {
  final BuildAds ads;

  BuildingWidgetV({
    Key? key,
    required this.ads,
  }) : super(key: key);

  @override
  State<BuildingWidgetV> createState() => _BuildingWidgetVState();
}

class _BuildingWidgetVState extends State<BuildingWidgetV> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<ViewAllLogic>();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.put(BuildLogic(id: widget.ads.id.toString()));
        Get.to(() => BuildView());
      },
      child: Material(
        elevation: 3.sp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Container(
          // color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
          width: Get.width.w,
          height: 350.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  width: Get.width / 3,
                  height: 250.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    image: DecorationImage(
                      image: NetworkImage('$photoAPI${widget.ads.getPhoto()}'),
                      // image: NetworkImage(
                      //     'https://images.pexels.com/photos/1662159/pexels-photo-1662159.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Container(
                  // width: Get.width / 2.5,
                  child: Padding(
                    padding:  EdgeInsets.only(right: 30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3.h),
                        Row(
                          children: [
                            Text(
                            isEnglish() ? widget.ads.nameE!:widget.ads.nameA!,
                              style: Get.textTheme.bodyText1!.copyWith(
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 45.sp,
                              ),
                            ),
                            // const Spacer(),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        SizedBox(
                          // width: 400.h,
                          child: Text(
                           isEnglish() ?  widget.ads.descE!:widget.ads.descA!,
                            style: Get.textTheme.bodyText1!.copyWith(
                              fontSize: 35.sp,
                              color: Get.theme.primaryColor,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                         isEnglish() ? widget.ads.addressE!:widget.ads.addressA!,
                          style: Get.textTheme.bodyText1!.copyWith(
                            fontSize: 35.sp,
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
                                      size: 50.sp,
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      widget.ads.numRoom!.toString(),
                                      style: Get.textTheme.bodyText1!.copyWith(
                                        color: Get.theme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.bathroom_outlined,
                                      color: Get.theme.primaryColor,
                                       size: 50.sp,
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      widget.ads.numBathroom!.toString(),
                                      style: Get.textTheme.bodyText1!.copyWith(
                                        color: Get.theme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                       fontSize: 35.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              '${widget.ads.cost}\$',
                              style: Get.textTheme.bodyText1!.copyWith(
                                color: Colors.amber,
                                fontSize: 35.sp,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
