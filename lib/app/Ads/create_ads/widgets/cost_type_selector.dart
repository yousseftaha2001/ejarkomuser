import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_logic.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CostTypeSelector extends StatelessWidget {
  CostTypeSelector({Key? key}) : super(key: key);
  final CreateAdsLogic logic = Get.find<CreateAdsLogic>();
  final CreateAdsState state = Get.find<CreateAdsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAdsLogic>(
      id: 'c',
      builder: (logic) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(
                'Select Cost Type'.tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: List.generate(
                state.costTypes.length,
                (index) {
                  return DropdownMenuItem<String>(
                    value: state.costTypes[index].tr,
                    child: Text(
                      state.costTypes[index].tr,
                    ),
                  );
                },
              ),
              customItemsHeights:
                  List.generate(state.costTypes.length, (index) => 50.sp),
              value: state.selectedCostType,
              onChanged: (value) {
                logic.changeSelectedCostType(value!);
              },
              style: Get.textTheme.bodyText1,
              buttonHeight: 50.h,
              dropdownMaxHeight: 400.h,
              buttonWidth: Get.width,
              itemPadding: EdgeInsets.symmetric(horizontal: 8.0.w),
            ),
          ),
        );
      },
    );
  }
}
