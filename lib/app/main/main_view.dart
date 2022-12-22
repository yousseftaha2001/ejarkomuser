import 'package:ejarkom/app/Ads/create_ads/create_ads_view.dart';
import 'package:ejarkom/app/main/widgets/main_cate.dart';
import 'package:ejarkom/app/main/widgets/services_card.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_view.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loop_page_view/loop_page_view.dart';

import '../../utils/langs/lang_controller.dart';
import '../../utils/widgets/leading_button.dart';
import 'main_logic.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final logic = Get.put(MainLogic());
  final state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    // return Center(child: MyIndicator());
    return Obx(
      () => state.pageIsHere.value
          ? const Center(child: MyIndicator())
          : Scaffold(
              appBar: AppBar(
                leading: const LeadingButton(),
                title: Text(
                  'Home'.tr,
                  style: Get.textTheme.bodyText1!.copyWith(
                    fontSize: 40.sp,
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  GetBuilder<LanguageController>(
                    init: LanguageController(),
                    builder: (controller) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: GestureDetector(
                          onTap: () {
                            controller.appLang == 'ar'
                                ? controller.changeLang(langCode: 'en')
                                : controller.changeLang(langCode: 'ar');
                            // mySnackBar(title: 'Error', body: 'body');
                          },
                          child: const Center(
                            child: Icon(
                              Icons.language,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/images/newb.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, cons) {
                    return Column(
                      children: [
                        // Container(
                        //   height: cons.maxHeight * 0.13,
                        //   color: Colors.transparent,
                        //   child: Column(
                        //     children: [
                        //       SizedBox(height: 60.h),
                        //       SearchBar(),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: cons.maxHeight,
                          // color: Colors.red,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                state.pageOneModel!.ads1!.isNotEmpty
                                    ? SizedBox(
                                        height: 200.h,
                                        child: LoopPageView.builder(
                                          controller: state.controller,
                                          itemCount:
                                              state.pageOneModel!.ads!.length,
                                          onPageChanged: (int? val) {
                                            state.adsIndex.value = val!;
                                          },
                                          itemBuilder: (_, index) {
                                            return Card(
                                              child: Image.network(
                                                '$photoAPI${state.pageOneModel!.ads1![index]}',
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : Container(),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Get.width / 90.w,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Services'.tr,
                                        style:
                                            Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.sp,
                                        ),
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => CreateServicesAdPage());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize:
                                              Size(Get.width / 2, 40.h),
                                          primary:
                                              Get.theme.colorScheme.secondary,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'create Service'.tr,
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                fontSize: 30.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Icon(Icons.add)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                SizedBox(
                                  height: 250.h,
                                  width: Get.width,
                                  // color: Colors.black,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        state.pageOneModel!.services!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 30.w),
                                        child: ServicesContainer(index: index),
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => CreateAdsView());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize:  Size(Get.width / 2, 40.h),
                                          primary: Colors.amber,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'create ADS'.tr,
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                fontSize: 30.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Icon(Icons.add)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                    state.pageOneModel!.ads!.length,
                                    (index) => MainCategory(
                                      ads: state.pageOneModel!.ads![index],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    Get.delete<MainLogic>();
    super.dispose();
  }
}
