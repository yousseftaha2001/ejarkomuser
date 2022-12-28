import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/company_app/CraeteAdsCompany/controller.dart';
import 'package:ejarkom/company_app/CraeteAdsCompany/state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/Ads/models/Zone.dart';

class ZoneSelector extends StatelessWidget {
  ZoneSelector({Key? key}) : super(key: key);
  final CraeteadscompanyController logic = Get.find<CraeteadscompanyController>();
  final CraeteadscompanyState state = Get.find<CraeteadscompanyController>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CraeteadscompanyController>(
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
                        fontSize: 30.sp,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: List.generate(
                      state.zones.length,
                      (index) {
                        return DropdownMenuItem<Zone>(
                          value: state.zones[index],
                          child: Text(
                            state.zones[index]!.nameE!,
                          ),
                        );
                      },
                    ),
                    customItemsHeights:
                        List.generate(state.zones.length, (index) => 100.sp),
                    value: state.selectedZone,
                    onChanged: (value) {
                      logic.changeSelectedZone(value!);
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
