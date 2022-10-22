import 'package:ejarkom/app/main/widgets/main_cate.dart';
import 'package:ejarkom/app/main/widgets/search_bar.dart';
import 'package:ejarkom/app/main/widgets/services_card.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_view.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    return Obx(
      () => state.pageIsHere.value
          ? Center(child: MyIndicator())
          : Scaffold(
              appBar: AppBar(
                leading: LeadingButton(),
                title: Text(
                  'Home'.tr,
                  style: Get.textTheme.bodyText1!.copyWith(
                    fontSize: 20.sp,
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                          height: cons.maxHeight * 0.87,
                          // color: Colors.red,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Services'.tr,
                                        style:
                                            Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => CreateServicesAdPage());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(180.w, 30.h),
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
                                                fontSize: 16.sp,
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
                                  height: 120.h,
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
                                Column(
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
