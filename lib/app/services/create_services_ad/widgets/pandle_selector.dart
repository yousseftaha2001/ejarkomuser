import 'package:ejarkom/app/services/create_services_ad/create_services_ad_logic.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_state.dart';
import 'package:ejarkom/app/services/create_services_ad/widgets/pandel_card.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PandelSelector extends StatelessWidget {
  PandelSelector({Key? key}) : super(key: key);
  final CreateServicesAdLogic logic = Get.find<CreateServicesAdLogic>();
  final CreateServicesAdState state = Get.find<CreateServicesAdLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return state.getPandels.value
          ? Column(
              children: [
                MyIndicator(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          state.pageController.animateToPage(
                            1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 50.sp,
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     state.pageController.animateToPage(
                      //       2,
                      //       duration: Duration(milliseconds: 200),
                      //       curve: Curves.easeOut,
                      //     );
                      //   },
                      //   icon: Icon(
                      //     Icons.arrow_forward_ios,
                      //     size: 50.sp,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            )
          : Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 30.h,
                bottom: 60.h,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: ListView.builder(
                      itemCount: state.pandels.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: PandleCard(
                            package: state.pandels[index],
                            photo: 'assets/images/pack.png',
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            state.pageController.animateToPage(
                              1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 50.sp,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            logic.checkPandle();
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 50.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
