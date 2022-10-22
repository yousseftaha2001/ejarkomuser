import 'package:ejarkom/app/Ads/create_ads/create_ads_view.dart';
import 'package:ejarkom/app/main/main_logic.dart';
import 'package:ejarkom/app/main/models/PageOneModel.dart';
import 'package:ejarkom/app/main/widgets/build_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainCategory extends StatelessWidget {
  final Ads ads;

  MainCategory({Key? key, required this.ads}) : super(key: key);
  final mainLogic = Get.find<MainLogic>();

  @override
  Widget build(BuildContext context) {
    return ads.items!.isNotEmpty
        ? Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => CreateAdsView());
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(180.w, 30.h),
                    primary: Colors.amber,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'create ADS'.tr,
                        style: Get.textTheme.bodyText1!.copyWith(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(Icons.add)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Text(
                      ads.nameE!,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Get.to(() => AllBuildingsPage(id: ads.id.toString()));
                        mainLogic.gotoAll(ads.id!.toString());
                      },
                      child: Text(
                        'View all'.tr,
                        style: Get.textTheme.bodyText1!.copyWith(
                          fontSize: 20.sp,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 310.h,
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: ads.items!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      child: BuildingWidget(
                        ads: ads.items![index],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : Container();
  }
}
