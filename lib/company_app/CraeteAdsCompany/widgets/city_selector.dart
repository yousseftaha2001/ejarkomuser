import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/company_app/CraeteAdsCompany/controller.dart';
import 'package:ejarkom/company_app/CraeteAdsCompany/state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/Ads/models/GetCityModel.dart';

class CitySelector extends StatelessWidget {
  CitySelector({Key? key}) : super(key: key);
  final CraeteadscompanyController logic = Get.find<CraeteadscompanyController>();
  final CraeteadscompanyState state = Get.find<CraeteadscompanyController>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CraeteadscompanyController>(
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
                            state.cities[index]!.nameE!,
                          ),
                        );
                      },
                    ),
                    customItemsHeights:
                        List.generate(state.cities.length, (index) => 100.sp),
                    value: state.selectedCity,
                    onChanged: (value) {
                      logic.changeSelectedCity(value!);
                    },
                    style: Get.textTheme.bodyText1,
                    buttonHeight: 100.h,
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
