import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_logic.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_state.dart';
import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:ejarkom/app/Ads/models/Zone.dart';
import 'package:ejarkom/app/view_all/view_all_logic.dart';
import 'package:ejarkom/app/view_all/view_all_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ZoneSelectorS extends StatelessWidget {
  ZoneSelectorS({Key? key}) : super(key: key);
  final ViewAllLogic logic = Get.find<ViewAllLogic>();
  final ViewAllState state = Get.find<ViewAllLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAllLogic>(
      id: 'z',
      builder: (logic) {
        return state.zones.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<Zone>(
                    isExpanded: true,
                    hint: Text(
                      'Select Zone'.tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: List.generate(
                      state.zones.length,
                      (index) {
                        return DropdownMenuItem<Zone>(
                          value: state.zones[index],
                          child: Text(
                            state.zones[index].nameE!,
                            style: Get.textTheme.bodyText1!.copyWith(
                              fontSize: 17.sp,
                            ),
                          ),
                        );
                      },
                    ),
                    customItemsHeights:
                        List.generate(state.zones.length, (index) => 50.sp),
                    value: state.selectedZone,
                    onChanged: (value) {
                      logic.changeSelectedZone(value!);
                    },
                    style: Get.textTheme.bodyText1,
                    buttonHeight: 50.h,
                    dropdownMaxHeight: 400.h,
                    buttonWidth: Get.width,
                    itemPadding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  ),
                ),
              )
            : Row(
                children: [
                  Text(
                    'No Zones on this area yet'.tr,
                    style: Get.textTheme.bodyText1,
                    textAlign: TextAlign.start,
                  ),
                ],
              );
      },
    );
  }
}
