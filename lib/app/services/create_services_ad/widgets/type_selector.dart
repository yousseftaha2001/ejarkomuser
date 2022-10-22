import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_logic.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_state.dart';
import 'package:ejarkom/app/services/models/service_type_model/type_serve.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TypeSelectorServices extends StatelessWidget {
  TypeSelectorServices({Key? key}) : super(key: key);
  final CreateServicesAdLogic logic = Get.find<CreateServicesAdLogic>();
  final CreateServicesAdState state = Get.find<CreateServicesAdLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateServicesAdLogic>(
      id: 'ty',
      builder: (logic) {
        return state.cities.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<TypeServe>(
                    isExpanded: true,
                    hint: Text(
                      'Select Service Type'.tr,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: List.generate(
                      state.typeServes.length,
                      (index) {
                        return DropdownMenuItem<TypeServe>(
                          value: state.typeServes[index],
                          child: Text(
                            state.typeServes[index].nameE!,
                          ),
                        );
                      },
                    ),
                    customItemsHeights: List.generate(
                        state.typeServes.length, (index) => 50.sp),
                    value: state.selectedType,
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
            : Container();
      },
    );
  }
}
