import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_logic.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_state.dart';
import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:ejarkom/app/view_all/view_all_logic.dart';
import 'package:ejarkom/app/view_all/view_all_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CitySelectorS extends StatelessWidget {
  CitySelectorS({Key? key}) : super(key: key);
  // final ViewAllLogic logic = Get.find<ViewAllLogic>();
  final ViewAllState state = Get.find<ViewAllLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAllLogic>(
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
                        fontSize: 18.sp,
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
                            style: Get.textTheme.bodyText1!.copyWith(
                             color: Colors.black,
                              fontSize: 17.sp,
                            ),
                          ),
                        );
                      },
                    ),
                    customItemsHeights:
                        List.generate(state.cities.length, (index) => 50.sp),
                    value: state.selectedCity,
                    onChanged: (value) {
                      logic.changeSelectedCity(value!);
                    },

                    style: Get.textTheme.bodyText1!.copyWith(
                      color: Colors.white30,
                      fontSize: 15.sp,
                    ),
                    iconEnabledColor: Get.theme.primaryColor,
                    buttonHeight: 50.h,
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
