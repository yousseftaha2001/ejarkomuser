import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_logic.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_state.dart';
import 'package:ejarkom/app/Ads/models/GetBuildTypeModel.dart';
import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:ejarkom/app/Ads/models/Zone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildSelector extends StatelessWidget {
  BuildSelector({Key? key}) : super(key: key);
  final CreateAdsLogic logic = Get.find<CreateAdsLogic>();
  final CreateAdsState state = Get.find<CreateAdsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAdsLogic>(
      id: 'b',
      builder: (logic) {
        return state.typeBuilds.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<TypeBuild>(
                    isExpanded: true,
                    hint: Text(
                      'Select your building Type'.tr,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: List.generate(
                      state.typeBuilds.length,
                      (index) {
                        return DropdownMenuItem<TypeBuild>(
                          value: state.typeBuilds[index],
                          child: Text(
                            state.typeBuilds[index].nameE!,
                          ),
                        );
                      },
                    ),
                    customItemsHeights: List.generate(
                        state.typeBuilds.length, (index) => 50.sp),
                    value: state.selectedBuildType,
                    onChanged: (value) {
                      logic.changeSelectedType(value!);
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
                children: [],
              );
      },
    );
  }
}
