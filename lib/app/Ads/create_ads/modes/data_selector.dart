import 'package:ejarkom/app/Ads/create_ads/create_ads_logic.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_state.dart';
import 'package:ejarkom/app/Ads/create_ads/widgets/build_selector.dart';
import 'package:ejarkom/app/Ads/create_ads/widgets/city_selector.dart';
import 'package:ejarkom/app/Ads/create_ads/widgets/cost_type_selector.dart';
import 'package:ejarkom/app/Ads/create_ads/widgets/my_from_feild.dart';
import 'package:ejarkom/app/Ads/create_ads/widgets/zone_selector.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DataSelector extends StatefulWidget {
  DataSelector({Key? key}) : super(key: key);

  @override
  State<DataSelector> createState() => _DataSelectorState();
}

class _DataSelectorState extends State<DataSelector> {
  final CreateAdsLogic logic = Get.find<CreateAdsLogic>();

  final CreateAdsState state = Get.find<CreateAdsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCustomFormField(
          controller: state.video,
          hint: 'video link on youtube (optional)'.tr,
          formK: state.formKey,
          validator: (String? value) {
            if (value!.isEmpty) {
              return null;
            } else {
              return null;
            }
          },
          icon: Icon(Icons.video_camera_back_outlined),
        ),
        SizedBox(height: 20.h),
        MyCustomFormField(
          controller: state.cost,
          hint: 'Cost'.tr,
          formK: state.formKey,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Please enter Cost'.tr;
            } else {
              return null;
            }
          },
          icon: Icon(Icons.money),
        ),
        SizedBox(height: 20.h),
        MyCustomFormField(
          controller: state.numOfRooms,
          hint: 'Number Of Rooms'.tr,
          formK: state.formKey,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Please enter Number Of Rooms'.tr;
            } else {
              return null;
            }
          },
          icon: Icon(Icons.meeting_room),
        ),
        SizedBox(height: 20.h),
        MyCustomFormField(
          controller: state.numOfBath,
          hint: 'Number Of Baths'.tr,
          formK: state.formKey,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Please enter Baths'.tr;
            } else {
              return null;
            }
          },
          icon: Icon(Icons.bathtub_outlined),
        ),
        SizedBox(height: 20.h),
        CostTypeSelector(),
        SizedBox(height: 20.h),
        Obx(() =>
            state.gettingBuildTypes.value ? MyIndicator() : BuildSelector()),
        SizedBox(height: 20.h),
        Obx(() => state.gettingCities.value ? MyIndicator() : CitySelector()),
        SizedBox(height: 20.h),
        GetBuilder<CreateAdsLogic>(
          id: 'z',
          builder: (logic) {
            return state.selectedCity != null
                ? Obx(() => state.gettingZones.value
                    ? const MyIndicator()
                    : ZoneSelector())
                : Container();
          },
        ),
        SizedBox(height: 90.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return IconButton(
                onPressed: state.createAdsState.value
                    ? null
                    : () {
                        logic.changePageStat(1);
                      },
                icon: Icon(Icons.arrow_back_ios),
              );
            }),
            // Spacer(),
            Obx(
              () {
                return state.createAdsState.value
                    ? const MyIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          logic.createAD();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Get.theme.primaryColor,
                          fixedSize: Size(Get.width / 2, 60.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                        ),
                        child: Text(
                          'Create AD'.tr,
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
        //  Row(
        //   children: [
        //     IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios),),
        //     IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios),),
        //   ],
        // )
      ],
    );
  }
}
