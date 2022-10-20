import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_logic.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_state.dart';
import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CitySelector extends StatelessWidget {
  CitySelector({Key? key}) : super(key: key);
  final CreateAdsLogic logic = Get.find<CreateAdsLogic>();
  final CreateAdsState state = Get.find<CreateAdsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAdsLogic>(
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
                        fontSize: 20.sp,
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
                        List.generate(state.cities.length, (index) => 50.sp),
                    value: state.selectedCity,
                    onChanged: (value) {
                      logic.changeSelectedCity(value!);
                    },
                    style: Get.textTheme.bodyText1,
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
