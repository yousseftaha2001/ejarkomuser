import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/app/Ads/models/Zone.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_logic.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_state.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ZoneSelectorSerivces extends StatelessWidget {
  ZoneSelectorSerivces({Key? key}) : super(key: key);
  final CreateServicesAdLogic logic = Get.find<CreateServicesAdLogic>();
  final CreateServicesAdState state = Get.find<CreateServicesAdLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateServicesAdLogic>(
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
                        fontSize: 40.sp,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: List.generate(
                      state.zones.length,
                      (index) {
                        return DropdownMenuItem<Zone>(
                          value: state.zones[index],
                          child: Text(
                            isEnglish()
                                ? state.zones[index].nameE!
                                : state.zones[index].nameA!,
                                style: Get.textTheme.bodyText1!.copyWith(
                                  fontSize: 40.sp,
                                ),
                          ),
                        );
                      },
                    ),
                    customItemsHeights:
                        List.generate(state.zones.length, (index) => 90.sp),
                    value: state.selectedZone,
                    onChanged: (value) {
                      logic.changeSelectedZone(value!);
                    },
                    style: Get.textTheme.bodyText1,
                    buttonHeight: 90.h,
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
