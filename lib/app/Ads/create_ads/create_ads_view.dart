/// Generated by Flutter GetX Starter on 2022-10-09 19:24
import 'package:dropdown_button2/dropdown_button2.dart';
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

import 'create_ads_logic.dart';
import 'create_ads_state.dart';

class CreateAdsView extends StatefulWidget {
  @override
  _CreateAdsViewState createState() => _CreateAdsViewState();
}

class _CreateAdsViewState extends State<CreateAdsView> {
  final CreateAdsLogic logic = Get.put(CreateAdsLogic());
  final CreateAdsState state = Get.find<CreateAdsLogic>().state;

  @override
  void dispose() {
    Get.delete<CreateAdsLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'New AD'.tr,
          style: Get.textTheme.bodyText1!.copyWith(
            fontSize: 20.sp,
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/newb.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Container(
                  width: Get.width,
                  height: 300.h,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.sp)),
                  child: GetBuilder<CreateAdsLogic>(
                    id: 'photo',
                    builder: (logic) {
                      return state.images.isNotEmpty
                          ? Stack(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 260.h,
                                        width: Get.width,
                                        child: PageView.builder(
                                          itemBuilder: (context, index) {
                                            return Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                Image.file(
                                                  state.images[index],
                                                ),
                                                Positioned(
                                                  top: 10.h,
                                                  left: 20.w,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      logic.deleteImage(index);
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
                                          itemCount: state.images.length,
                                          onPageChanged: (value) {
                                            state.currentIndex.value = value;
                                          },
                                          controller: state.pageController,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Obx(
                                        () => AnimatedSmoothIndicator(
                                          activeIndex: state.currentIndex.value,
                                          count: state.photos.length,
                                          effect: JumpingDotEffect(
                                            activeDotColor:
                                                Get.theme.primaryColor,
                                            dotHeight: 10.h,
                                            dotWidth: 10.h,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 250.h,
                                  left: 350.w,
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
                SizedBox(height: 30.h),
                Form(
                  key: state.formKey,
                  child: Column(
                    children: [
                      MyCustomFormField(
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
                      ),
                      SizedBox(height: 20.h),
                      MyCustomFormField(
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
                      ),
                      SizedBox(height: 20.h),
                      MyCustomFormField(
                        controller: state.descriptionE,
                        hint: 'Description In English'.tr,
                        formK: state.formKey,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter Description In English'.tr;
                          } else {
                            return null;
                          }
                        },
                        icon: Icon(Icons.description_outlined),
                      ),
                      SizedBox(height: 20.h),
                      MyCustomFormField(
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
                      ),
                      SizedBox(height: 20.h),
                      MyCustomFormField(
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
                      ),
                      SizedBox(height: 20.h),
                      MyCustomFormField(
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
                      ),
                      SizedBox(height: 20.h),
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
                      Obx(() => state.gettingBuildTypes.value
                          ? MyIndicator()
                          : BuildSelector()),
                      SizedBox(height: 20.h),
                      Obx(() => state.gettingCities.value
                          ? MyIndicator()
                          : CitySelector()),
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
                      SizedBox(height: 20.h),
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
                                    fixedSize: Size(Get.width.w, 45.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.sp),
                                    ),
                                  ),
                                  child: Text(
                                    'Create AD'.tr,
                                    style: Get.textTheme.bodyText1!.copyWith(
                                      color: Colors.white,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (state.costTypes.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }
}
