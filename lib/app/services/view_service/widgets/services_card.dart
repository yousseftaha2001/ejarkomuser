import 'package:ejarkom/app/services/models/service_section_model/ads_serve.dart';
import 'package:ejarkom/app/services/view_service/view_service_logic.dart';
import 'package:ejarkom/app/services/view_services/view_services_logic.dart';
import 'package:ejarkom/app/services/view_services/view_services_view.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ServiceCard extends StatefulWidget {
  final AdsServe ads;

  ViewServiceLogic logic = Get.find();

  ServiceCard({
    Key? key,
    required this.ads,
  }) : super(key: key);

  @override
  State<ServiceCard> createState() => _BuildingWidgetVState();
}

class _BuildingWidgetVState extends State<ServiceCard> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // Get.delete<ViewAllLogic>();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.ads.id.toString());
        Get.put(ViewServicesLogic(id: widget.ads.id.toString()));
        Get.to(() => ViewServicesPage());
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
          height: 220.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Container(
                  width: Get.width / 3.w,
                  height: 150.h,
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
              SizedBox(width: 10.w),
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
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      widget.ads.textE!,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 17.sp,
                        color: Get.theme.primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    SizedBox(height: 3.h),

                    SizedBox(height: 20.h),
                    // Spacer(),
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // widget.logic.launchWhatsApp(
                                    //   phone: '+201033953634',
                                    //   message: 'hello',
                                    // );
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.whatsapp,
                                    color: Get.theme.primaryColor,
                                  ),
                                ),
                                SizedBox(width: 1.w),
                                Text(
                                  widget.ads.whats!.toString(),
                                  style: Get.textTheme.bodyText1!.copyWith(
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 5.w),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // widget.logic.launchPhoneDialer(
                                    //     '+20${widget.ads.phone!}');
                                  },
                                  icon: Icon(
                                    Icons.phone,
                                    color: Get.theme.primaryColor,
                                  ),
                                ),
                                SizedBox(width: 1.w),
                                Text(
                                  widget.ads.phone!.toString(),
                                  style: Get.textTheme.bodyText1!.copyWith(
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
