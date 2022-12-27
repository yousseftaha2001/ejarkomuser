import 'package:ejarkom/app/Ads/create_ads/create_ads_logic.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_state.dart';
import 'package:ejarkom/app/Ads/create_ads/widgets/my_from_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoSelector extends StatefulWidget {
  InfoSelector({Key? key}) : super(key: key);

  @override
  State<InfoSelector> createState() => _InfoSelectorState();
}

class _InfoSelectorState extends State<InfoSelector> {
  final CreateAdsLogic logic = Get.find<CreateAdsLogic>();

  final CreateAdsState state = Get.find<CreateAdsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Flexible(
                  child: CheckboxListTile(
                    value: state.langOption.value == 0,
                    onChanged: (bool? newV) => state.langOption.value = 0,
                    activeColor: Get.theme.primaryColor,
                    title: Text(
                      'En',
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 30.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: CheckboxListTile(
                    value: state.langOption.value == 1,
                    onChanged: (bool? newV) => state.langOption.value = 1,
                    activeColor: Get.theme.primaryColor,
                    title: Text(
                      'ع',
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 30.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: CheckboxListTile(
                    value: state.langOption.value == 2,
                    onChanged: (bool? newV) => state.langOption.value = 2,
                    activeColor: Get.theme.primaryColor,
                    title: Text(
                      'Both'.tr,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 30.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return Column(
              children: [
                state.langOption.value != 1
                    ? MyCustomFormField(
                        controller: state.nameE,
                        hint: 'Name In English'.tr,
                        formK: state.formKey,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter Name In English'.tr;
                          } else {
                            return null;
                          }
                        },
                        icon: Icon(Icons.language),
                      )
                    : Container(),
                state.langOption.value != 1 ? SizedBox(height: 20.h) : Center(),
                state.langOption.value != 0
                    ? MyCustomFormField(
                        controller: state.nameA,
                        hint: 'Name In Arabic'.tr,
                        formK: state.formKey,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter Name In Arabic'.tr;
                          } else {
                            return null;
                          }
                        },
                        icon: Icon(Icons.language),
                      )
                    : Center(),
                state.langOption.value != 0 ? SizedBox(height: 20.h) : Center(),
                state.langOption.value != 1
                    ? MyCustomFormField(
                        controller: state.descriptionE,
                        hint: 'Description In English'.tr,
                        max: 5,
                        
                        formK: state.formKey,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter Description In English'.tr;
                          } else {
                            return null;
                          }
                        },
                        icon: Icon(Icons.description_outlined),
                      )
                    : Center(),
                state.langOption.value != 1 ? SizedBox(height: 20.h) : Center(),
                state.langOption.value != 0
                    ? MyCustomFormField(
                        controller: state.descriptionA,
                        hint: 'Description In Arabic'.tr,
                        formK: state.formKey,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter Description In Arabic'.tr;
                          } else {
                            return null;
                          }
                        },
                        icon: Icon(Icons.description_outlined),
                      )
                    : Center(),
                state.langOption.value != 0 ? SizedBox(height: 20.h) : Center(),
                state.langOption.value != 1
                    ? MyCustomFormField(
                        controller: state.addressE,
                        hint: 'Address In English'.tr,
                        formK: state.formKey,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter Address In English'.tr;
                          } else {
                            return null;
                          }
                        },
                        icon: Icon(Icons.location_on_outlined),
                      )
                    : Center(),
                state.langOption.value != 1 ? SizedBox(height: 20.h) : Center(),
                state.langOption.value != 0
                    ? MyCustomFormField(
                        controller: state.addressA,
                        hint: 'Address In Arabic'.tr,
                        formK: state.formKey,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter Address In Arabic'.tr;
                          } else {
                            return null;
                          }
                        },
                        icon: Icon(Icons.location_on_outlined),
                      )
                    : Center(),
                state.langOption.value != 0 ? SizedBox(height: 20.h) : Center(),
                // state.langOption.value != 2
                //     ? SizedBox(height: 410.h)
                //     : SizedBox(height: 180.h),
              ],
            );
          }),
          SizedBox(height: 110.h),
          // Text('data',style: Get.textTheme.bodyText1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  logic.changePageStat(0);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              IconButton(
                onPressed: () {
                  logic.changePageStat(2);
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          )
          // Spacer(),


        ],
      ),
    );
  }
}
