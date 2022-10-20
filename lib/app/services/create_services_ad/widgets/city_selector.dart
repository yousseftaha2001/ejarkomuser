import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_logic.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CitySelectorServices extends StatelessWidget {
  CitySelectorServices({Key? key}) : super(key: key);
  final CreateServicesAdLogic logic = Get.find<CreateServicesAdLogic>();
  final CreateServicesAdState state = Get.find<CreateServicesAdLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateServicesAdLogic>(
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
