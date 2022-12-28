import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/company_app/CraeteAdsCompany/controller.dart';
import 'package:ejarkom/company_app/CraeteAdsCompany/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/Ads/models/GetBuildTypeModel.dart';

class BuildSelector extends StatelessWidget {
  BuildSelector({Key? key}) : super(key: key);
  final CraeteadscompanyController logic = Get.find<CraeteadscompanyController>();
  final CraeteadscompanyState state = Get.find<CraeteadscompanyController>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CraeteadscompanyController>(
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
                        fontSize: 30.sp,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: List.generate(
                      state.typeBuilds.length,
                      (index) {
                        return DropdownMenuItem<TypeBuild>(
                          value: state.typeBuilds[index],
                          child: Text(
                            state.typeBuilds[index]!.nameE!,
                          ),
                        );
                      },
                    ),
                    customItemsHeights: List.generate(
                        state.typeBuilds.length, (index) => 100.sp),
                    value: state.selectedBuildType,
                    onChanged: (value) {
                      logic.changeSelectedType(value!);
                    },
                    style: Get.textTheme.bodyText1,
                    buttonHeight: 100.h,
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
