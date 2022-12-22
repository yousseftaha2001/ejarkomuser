import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_logic.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_state.dart';
import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:ejarkom/app/BuildsRequest/add_build_manage/add_build_manage_logic.dart';
import 'package:ejarkom/app/BuildsRequest/add_build_manage/add_build_manage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CitySelectorM extends StatelessWidget {
  CitySelectorM({Key? key}) : super(key: key);
  final AddBuildManageLogic logic = Get.find<AddBuildManageLogic>();
  final AddBuildManageState state = Get.find<AddBuildManageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddBuildManageLogic>(
      id: 'ci',
      builder: (logic) {
        return state.cities.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<City>(
                    isExpanded: true,
                    hint: Text(
                      'Select City'.tr,
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: List.generate(
                      state.cities.length,
                      (index) {
                        return DropdownMenuItem<City>(
                          value: state.cities[index],
                          child: Text(
                            state.cities[index].nameE!,
                          ),
                        );
                      },
                    ),
                    customItemsHeights:
                        List.generate(state.cities.length, (index) => 80.sp),
                    value: state.selectedCity,
                    onChanged: (value) {
                      logic.changeSelectedCity(value!);
                    },
                    style: Get.textTheme.bodyText1,
                    buttonHeight: 80.h,
                    dropdownMaxHeight: 400.h,
                    buttonWidth: Get.width,
                    itemPadding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
