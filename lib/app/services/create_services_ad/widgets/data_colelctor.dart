import 'package:ejarkom/app/services/create_services_ad/create_services_ad_logic.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_state.dart';
import 'package:ejarkom/app/services/create_services_ad/widgets/city_selector.dart';
import 'package:ejarkom/app/services/create_services_ad/widgets/type_selector.dart';
import 'package:ejarkom/app/services/create_services_ad/widgets/zones_selector.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DataCollector extends StatelessWidget {
  DataCollector({Key? key}) : super(key: key);
  final CreateServicesAdLogic logic = Get.find<CreateServicesAdLogic>();

  final CreateServicesAdState state = Get.find<CreateServicesAdLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 500.h,
            color: Colors.white.withOpacity(0.5),
            child: GetBuilder<CreateServicesAdLogic>(
              id: 'photo',
              builder: (logic) {
                return state.images.isNotEmpty
                    ? Stack(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 360.h,
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
                                      state.cureentIndex.value = value;
                                    },
                                    controller: state.pageControllerPhotos,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Obx(
                                  () => AnimatedSmoothIndicator(
                                    activeIndex: state.cureentIndex.value,
                                    count: state.photos.length,
                                    effect: JumpingDotEffect(
                                      activeDotColor: Get.theme.primaryColor,
                                      dotHeight: 10.h,
                                      dotWidth: 10.h,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 360.h,
                            left: 350.w,
                            child: IconButton(
                              onPressed: () {
                                logic.getImages();
                              },
                              icon: const Icon(
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
                            icon: const Icon(Icons.add),
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
          Obx(
            () => state.gettingCities.value
                ? const MyIndicator()
                : CitySelectorServices(),
          ),
          SizedBox(height: 30.h),
          GetBuilder<CreateServicesAdLogic>(
            id: 'z',
            builder: (logic) {
              return state.selectedCity != null
                  ? Obx(() => state.gettingZones.value
                      ? const MyIndicator()
                      : ZoneSelectorSerivces())
                  : Container();
            },
          ),
          SizedBox(height: 30.h),
          Obx(
            () => state.gettingTypes.value
                ? const MyIndicator()
                : TypeSelectorServices(),
          ),
          // const Spacer(),
          SizedBox(height: 100.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // IconButton(
              //   onPressed: () {
              //     state.pageController.animateToPage(
              //       0,
              //       duration: Duration(milliseconds: 200),
              //       curve: Curves.easeOut,
              //     );
              //   },
              //   icon: Icon(
              //     Icons.arrow_back_ios_new,
              //     size: 50.sp,
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  state.pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 25.sp,
                    ),
                    Text(
                      'Back'.tr,
                    ),
                  ],
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     logic.checkData();
              //   },
              //   icon: Icon(
              //     Icons.arrow_forward_ios,
              //     size: 50.sp,
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  logic.checkData();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
                child: Row(
                  children: [
                    Text(
                      'Next'.tr,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 25.sp,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
