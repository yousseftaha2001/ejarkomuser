import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';
import '../state.dart';

class CostTypeSelector extends StatelessWidget {
  CostTypeSelector({Key? key}) : super(key: key);
  final CraeteadscompanyController logic = Get.find<CraeteadscompanyController>();
  final CraeteadscompanyState state = Get.find<CraeteadscompanyController>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CraeteadscompanyController>(
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
                  fontSize: 30.sp,
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
                  List.generate(state.costTypes.length, (index) => 100.sp),
              value: state.costType.value,
              onChanged: (value) {
                logic.changeSelectedCostType(value!);
              },
              style: Get.textTheme.bodyText1,
              buttonHeight: 100.h,
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
