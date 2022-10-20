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
            children: [
              Row(
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
                      'show all'.tr,
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
