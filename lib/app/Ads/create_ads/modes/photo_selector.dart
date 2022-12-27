import 'package:ejarkom/app/Ads/create_ads/create_ads_logic.dart';
import 'package:ejarkom/app/Ads/create_ads/create_ads_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PhotosSelector extends StatefulWidget {
  PhotosSelector({Key? key}) : super(key: key);

  @override
  State<PhotosSelector> createState() => _PhotosSelectorState();
}

class _PhotosSelectorState extends State<PhotosSelector> {
  final CreateAdsLogic logic = Get.find<CreateAdsLogic>();

  final CreateAdsState state = Get.find<CreateAdsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            height: 500.h,
              color: Colors.white.withOpacity(0.7),
            // decoration: BoxDecoration(
            //   color: Colors.transparent,
            //   border: Border.all(color: Colors.grey),
            //   borderRadius: BorderRadius.circular(8.sp),
            // ),
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
                                  height: 400.h,
                                  width: Get.width,
                                  child: PageView.builder(
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Image.file(
                                            state.images[index],
                                            height: 500.h,
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
                                      activeDotColor: Get.theme.primaryColor,
                                      dotHeight: 20.h,
                                      dotWidth: 20.h,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 420.h,
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
          // Spacer(),
          // SizedBox(height: 400.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.arrow_back_ios),
              // ),
              IconButton(
                onPressed: () {
                  logic.changePageStat(1);
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          )
        ],
      ),
    );
  }
}
