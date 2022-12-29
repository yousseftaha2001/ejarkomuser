import 'package:ejarkom/company_app/CraeteAdsCompany/widgets/build_type_selector.dart';
import 'package:ejarkom/company_app/CraeteAdsCompany/widgets/city_selector.dart';
import 'package:ejarkom/company_app/CraeteAdsCompany/widgets/cost_types_selector.dart';
import 'package:ejarkom/company_app/CraeteAdsCompany/widgets/zone_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/widgets/my_indicator.dart';
import '../CompanySignUp/widgets/custom_data_in.dart';
import 'index.dart';

class CraeteadscompanyPage extends GetView<CraeteadscompanyController> {
  const CraeteadscompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CraeteadscompanyController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "New AD".tr,
              style: Get.textTheme.bodyText1,
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Get.theme.primaryColor,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              // width: Get.width / 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 600.h,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.sp)),
                      child: GetBuilder<CraeteadscompanyController>(
                        id: 'photo',
                        builder: (logic) {
                          return controller.state.photos.isNotEmpty
                              ? Stack(
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 500.h,
                                            // width: Get.width / 3,
                                            child: PageView.builder(
                                              itemBuilder: (context, index) {
                                                return Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Image.memory(
                                                      controller
                                                          .state.photos[index],
                                                      height: 500.h,
                                                    ),
                                                    Positioned(
                                                      top: 10.h,
                                                      left: 20.w,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          logic.deleteImage(
                                                              index);
                                                        },
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                              itemCount: controller
                                                  .state.photos.length,
                                              onPageChanged: (value) {
                                                controller.state.currentIndex
                                                    .value = value;
                                              },
                                              controller: controller
                                                  .state.pageController,
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Obx(
                                            () => AnimatedSmoothIndicator(
                                              activeIndex: controller
                                                  .state.currentIndex.value,
                                              count: controller
                                                  .state.photos.length,
                                              effect: JumpingDotEffect(
                                                activeDotColor:
                                                    Get.theme.primaryColor,
                                                dotHeight: 20.h,
                                                dotWidth: 20.h,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 500.h,
                                      left: 650.w,
                                      child: IconButton(
                                        onPressed: () {
                                          logic.getImages();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        logic.getImages();
                                      },
                                    ),
                                    Text(
                                      'one image at least and five at most'.tr,
                                      style: Get.textTheme.bodyText1,
                                    )
                                  ],
                                );
                        },
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Obx(
                      () => Column(
                        children: [
                          CheckboxListTile(
                            value: controller.state.langOption.value == 0,
                            onChanged: (bool? newV) =>
                                controller.state.langOption.value = 0,
                            activeColor: Get.theme.primaryColor,
                            title: Text(
                              'English'.tr,
                              style: Get.textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 35.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          CheckboxListTile(
                            value: controller.state.langOption.value == 1,
                            onChanged: (bool? newV) =>
                                controller.state.langOption.value = 1,
                            activeColor: Get.theme.primaryColor,
                            title: Text(
                              'Arabic'.tr,
                              style: Get.textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 35.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          CheckboxListTile(
                            value: controller.state.langOption.value == 2,
                            onChanged: (bool? newV) =>
                                controller.state.langOption.value = 2,
                            activeColor: Get.theme.primaryColor,
                            title: Text(
                              'Both'.tr,
                              style: Get.textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 35.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return Column(
                        children: [
                          SizedBox(height: 25.h),
                          controller.state.langOption.value != 0
                              ? CustomDataInput(
                                  title: 'Name In Arabic'.tr,
                                  obs: false,
                                  // icon: const Icon(Icons.title),
                                  onChanged: (String? name) {
                                    controller.state.nameA.value = name!;
                                  },
                                  enabled:
                                      !controller.state.createAdsState.value,
                                )
                              : Container(),
                          SizedBox(
                              height: controller.state.langOption.value != 0
                                  ? 25.h
                                  : 0),
                          controller.state.langOption.value != 1
                              ? CustomDataInput(
                                  title: 'Name In English'.tr,
                                  obs: false,
                                  // icon: const Icon(Icons.title),
                                  onChanged: (String? name) {
                                    controller.state.nameE.value = name!;
                                  },
                                  enabled:
                                      !controller.state.createAdsState.value,
                                )
                              : Container(),
                          SizedBox(
                              height: controller.state.langOption.value != 1
                                  ? 25.h
                                  : 0),
                          controller.state.langOption.value != 0
                              ? CustomDataInput(
                                  title: 'Address In Arabic'.tr,
                                  obs: false,
                                  // icon: const Icon(Icons.title),
                                  onChanged: (String? name) {
                                    controller.state.addressA.value = name!;
                                  },
                                  enabled:
                                      !controller.state.createAdsState.value,
                                )
                              : Container(),
                          SizedBox(
                              height: controller.state.langOption.value != 0
                                  ? 25.h
                                  : 0),
                          controller.state.langOption.value != 1
                              ? CustomDataInput(
                                  title: 'Address In English'.tr,
                                  obs: false,
                                  // icon: const Icon(Icons.title),
                                  onChanged: (String? name) {
                                    controller.state.addressE.value = name!;
                                  },
                                  enabled:
                                      !controller.state.createAdsState.value,
                                )
                              : Container(),
                        ],
                      );
                    }),
                    SizedBox(
                        height:
                            controller.state.langOption.value != 1 ? 25.h : 0),
                    CustomDataInput(
                      title: 'Amount'.tr,
                      obs: false,
                       keyBoard: TextInputType.number,
                      formaters: <TextInputFormatter>[
                        // WhitelistingTextInputFormatter.digitsOnly
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                      ],
                      // // icon: const Icon(Icons.title),
                      onChanged: (String? name) {
                        controller.state.cost.value = name!;
                      },
                      enabled: !controller.state.createAdsState.value,
                    ),
                    // SizedBox(height: 25.h),
                    SizedBox(height: 25.h),
                    CostTypeSelector(),
                    SizedBox(height: 25.h),
                    Obx(() => controller.state.gettingBuildTypes.value
                        ? MyIndicator()
                        : BuildSelector()),
                    SizedBox(height: 25.h),
                    Obx(() => controller.state.gettingCities.value
                        ? MyIndicator()
                        : CitySelector()),
                    SizedBox(height: 25.h),
                    GetBuilder<CraeteadscompanyController>(
                      id: 'z',
                      builder: (logic) {
                        return controller.state.selectedCity != null
                            ? Obx(() => controller.state.gettingZones.value
                                ? const MyIndicator()
                                : ZoneSelector())
                            : Container();
                      },
                    ),
                    // SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            color: Colors.black,
                            height: 1.h,
                            width: Get.width / 3),
                        Text(
                          'Options'.tr,
                          style: Get.textTheme.bodyText1,
                        ),
                        Container(
                            color: Colors.black,
                            height: 1.h,
                            width: Get.width / 3),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    CustomDataInput(
                      title: 'Number Of bathroom'.tr,
                      obs: false,
                       keyBoard: TextInputType.number,
                      formaters: <TextInputFormatter>[
                        // WhitelistingTextInputFormatter.digitsOnly
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      // // icon: const Icon(Icons.title),
                      onChanged: (String? name) {
                        controller.state.numOfBathRoom.value = name!;
                      },
                      enabled: !controller.state.createAdsState.value,
                    ),
                    SizedBox(height: 25.h),
                    CustomDataInput(
                      title: 'Number Of Rooms'.tr,
                      obs: false,
                      keyBoard: TextInputType.number,
                      formaters: <TextInputFormatter>[
                        // WhitelistingTextInputFormatter.digitsOnly
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      // // icon: const Icon(Icons.title),
                      onChanged: (String? name) {
                        controller.state.numOfRoom.value = name!;
                      },
                      enabled: !controller.state.createAdsState.value,
                    ),
                    SizedBox(height: 25.h),

                    CustomDataInput(
                      title: 'Video'.tr,
                      obs: false,
                      // // icon: const Icon(Icons.title),
                      onChanged: (String? name) {
                        controller.state.video.value = name!;
                      },
                      enabled: !controller.state.createAdsState.value,
                    ),
                    Obx(() {
                      return CheckboxListTile(
                        onChanged: (bool? value) {
                          controller.state.furnished.value = value!;
                        },
                        value: controller.state.furnished.value,
                        activeColor: Get.theme.primaryColor,
                        title: Text(
                          'Furnished'.tr,
                          style: Get.textTheme.bodyText1,
                        ),
                      );
                    }),
                    //  SizedBox(height: 25.h),
                    Obx(() {
                      return Column(
                        children: [
                          SizedBox(
                              height: controller.state.langOption.value != 1
                                  ? 25.h
                                  : 25.h),
                          controller.state.langOption.value != 0
                              ? CustomDataInput(
                                  title: 'Description In Arabic'.tr,
                                  obs: false,
                                  maxLines: 5,
                                  // icon: const Icon(Icons.title),
                                  onChanged: (String? name) {
                                    controller.state.desA.value = name!;
                                  },
                                  enabled:
                                      !controller.state.createAdsState.value,
                                )
                              : Container(),
                          SizedBox(
                              height: controller.state.langOption.value != 0
                                  ? 25.h
                                  : 0),
                          controller.state.langOption.value != 1
                              ? CustomDataInput(
                                  title: 'Description In English'.tr,
                                  obs: false,
                                  maxLines: 5,
                                  // icon: const Icon(Icons.title),
                                  onChanged: (String? name) {
                                    controller.state.desE.value = name!;
                                  },
                                  enabled:
                                      !controller.state.createAdsState.value,
                                )
                              : Container(),
                        ],
                      );
                    }),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //         color: Colors.grey, height: 1.h, width: Get.width / 8),
                    //     Container(
                    //         color: Colors.grey, height: 1.h, width: Get.width / 16),
                    //     Text(''.tr),
                    //     Container(
                    //         color: Colors.grey, height: 1.h, width: Get.width / 8),
                    //   ],
                    // ),
                    Divider(color: Colors.black),
                    SizedBox(height: 30.h),
                    Obx(
                      () {
                        return controller.state.createAdsState.value
                            ? const MyIndicator()
                            : ElevatedButton(
                                onPressed: controller.checkData()
                                    ? null
                                    : () {
                                        // controller.addCourse();
                                        controller.addAdd();
                                      },
                                style: ElevatedButton.styleFrom(
                                  primary: Get.theme.primaryColor,
                                  fixedSize: Size(Get.width / 2, 60.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                ),
                                child: Text(
                                  'Create Ad'.tr,
                                  style: Get.textTheme.button!.copyWith(
                                    color: Colors.white
                                  ),
                                ),
                              );
                      },
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
