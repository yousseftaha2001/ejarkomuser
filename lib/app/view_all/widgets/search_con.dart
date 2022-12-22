import 'package:ejarkom/app/view_all/view_all_logic.dart';
import 'package:ejarkom/app/view_all/view_all_state.dart';
import 'package:ejarkom/app/view_all/widgets/city_selector.dart';
import 'package:ejarkom/app/view_all/widgets/zone_selector.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchCont extends StatelessWidget {
  SearchCont({Key? key}) : super(key: key);
  final ViewAllLogic logic = Get.find<ViewAllLogic>();

  final ViewAllState state = Get.find<ViewAllLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 700.h,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.sp),
            topRight: Radius.circular(10.sp),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  logic.state.selectedZone = null;
                  logic.state.selectedCity = null;
                  Get.back();
                },
                icon: Icon(Icons.close),
              ),
              Column(
                children: [
                  CitySelectorS(),
                  SizedBox(height: 10.h),
                  GetBuilder<ViewAllLogic>(
                    id: 'z',
                    builder: (logic) {
                      return logic.state.selectedCity != null
                          ? Obx(() => logic.state.gettingZones.value
                              ? SizedBox(child: const MyIndicator(),height: 350.h)
                              : ZoneSelectorS())
                          : Container();
                    },
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Spacer(),
              Center(
                child: GetBuilder<ViewAllLogic>(
                  id: 'z',
                  builder: (logic) {
                    return ElevatedButton(
                      onPressed: logic.state.selectedZone == null
                          ? null
                          : () {
                              logic.changeSearchMode();
                              // Get.back();
                            },
                      child: Text(
                        'Filter'.tr,
                        style: Get.theme.textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
