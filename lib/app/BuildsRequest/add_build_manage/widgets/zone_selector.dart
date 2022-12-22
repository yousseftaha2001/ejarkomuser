import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_logic.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_state.dart';
import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:ejarkom/app/Ads/models/Zone.dart';
import 'package:ejarkom/app/BuildsRequest/add_build_manage/add_build_manage_logic.dart';
import 'package:ejarkom/app/BuildsRequest/add_build_manage/add_build_manage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ZoneSelectorM extends StatelessWidget {
  ZoneSelectorM({Key? key}) : super(key: key);
  final AddBuildManageLogic logic = Get.find<AddBuildManageLogic>();
  final AddBuildManageState state = Get.find<AddBuildManageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddBuildManageLogic>(
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
                        fontSize: 80.sp,
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
                          ),
                        );
                      },
                    ),
                    customItemsHeights:
                        List.generate(state.zones.length, (index) => 80.sp),
                    value: state.selectedZone,
                    onChanged: (value) {
                      logic.changeSelectedZone(value!);
                    },
                    style: Get.textTheme.bodyText1,
                    buttonHeight: 80.h,
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
