import 'package:ejarkom/app/build/build_logic.dart';
import 'package:ejarkom/app/build/build_view.dart';
import 'package:ejarkom/app/main/models/PageOneModel.dart';
import 'package:ejarkom/app/view_all/view_all_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          width: Get.width.w,
          height: 200.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: Get.width / 2.5.w,
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  image: const DecorationImage(
                    // image: NetworkImage('$photoAPI${imagePath}'),
                    image: NetworkImage(
                        'https://images.pexels.com/photos/1662159/pexels-photo-1662159.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Container(
                width: Get.width / 2.5.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Text(
                          widget.ads.nameE!,
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        const Spacer(),
                        // GetBuilder<FavPref>(
                        //   // init: FavPref(),
                        //   builder: (logic) {
                        //     return IconButton(
                        //       onPressed: () {
                        //         logic.addFav(id: id);
                        //       },
                        //       icon: Icon(
                        //         logic.isFaved(id)
                        //             ? FontAwesomeIcons.heartCircleCheck
                        //             : FontAwesomeIcons.heart,
                        //         color:
                        //         logic.isFaved(id) ? Colors.red : Colors.grey,
                        //       ),
                        //     );
                        //   },
                        // )
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      widget.ads.descE!,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 17.sp,
                        color: Get.theme.primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      widget.ads.addressE!,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 17.sp,
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
                                  widget.ads.numRoom!.toString(),
                                  style: Get.textTheme.bodyText1!.copyWith(
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
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
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  widget.ads.numBathroom!.toString(),
                                  style: Get.textTheme.bodyText1!.copyWith(
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
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
        ),
      ),
    );
  }
}
