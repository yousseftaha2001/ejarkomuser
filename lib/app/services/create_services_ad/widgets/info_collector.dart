import 'package:ejarkom/app/services/create_services_ad/create_services_ad_logic.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_state.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InfoCollector extends StatelessWidget {
  InfoCollector({Key? key}) : super(key: key);

  final CreateServicesAdLogic logic = Get.find<CreateServicesAdLogic>();

  final CreateServicesAdState state = Get.find<CreateServicesAdLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // reverse: true,
      // primary: true,/
      // physics: BouncingScrollPhysics(),
      child: SizedBox(
        height: Get.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                // flex: 3,
                height: 200.h,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  // height: 150.h,
                ),
              ),
              SizedBox(
                height: 100.h,
                // child: Container(color: Colors.amberAccent),

                child: Obx(
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
                              fontSize: 40.sp,
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
                              fontSize: 40.sp,
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
              ),
              SizedBox(height: 20.h),
              SizedBox(
                // flex: 20,
                // height: 950.h,
                // child: Container(
                //   color: Colors.red,
                // ),
                child: Obx(
                  () => Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.langOption.value != 1
                          ? DataInput(
                              controller: state.nameE,
                              hint: 'Name In English'.tr,
                              icon: Icon(Icons.language),
                            )
                          : Center(),
                      state.langOption.value != 1
                          ? SizedBox(height: 20.h)
                          : Center(),
                      state.langOption.value != 0
                          ? DataInput(
                              controller: state.nameA,
                              hint: 'Name In Arabic'.tr,
                              icon: Icon(Icons.language),
                            )
                          : Center(),
                      state.langOption.value != 0
                          ? SizedBox(height: 20.h)
                          : Center(),
                      state.langOption.value != 1
                          ? DataInput(
                              controller: state.descriptionE,
                              hint: 'Description In English'.tr,
                              icon: Icon(Icons.description_outlined),
                            )
                          : Center(),
                      state.langOption.value != 1
                          ? SizedBox(height: 20.h)
                          : Center(),
                      state.langOption.value != 0
                          ? DataInput(
                              controller: state.descriptionA,
                              hint: 'Description In Arabic'.tr,
                              icon: Icon(Icons.description_outlined),
                            )
                          : Center(),
                      state.langOption.value != 0
                          ? SizedBox(height: 20.h)
                          : Center(),
                      DataInput(
                        controller: state.phone,
                        hint: 'Phone'.tr,
                        icon: Icon(Icons.phone),
                      ),
                      SizedBox(height: 20.h),
                      DataInput(
                        controller: state.whats,
                        hint: 'WhatsApp'.tr,
                        icon: Icon(FontAwesomeIcons.whatsapp),
                      ),
                      SizedBox(
                          height: state.langOption.value != 2 ? 100.h : 50.h),
                          Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        logic.checkInfo();
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
                            size: 35.sp,
                          ),
                        ],
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     logic.checkInfo();
                    //   },
                    //   icon: Icon(
                    //     Icons.arrow_forward_ios,
                    //     size: 50.sp,
                    //   ),
                    // ),
                  ],
                ),
                          
                      // Spacer(),
                    ],
                  ),
                ),
              ),
              // Spacer(),

              
              // Spacer(),

              // Expanded(
              //   flex: 1,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       ElevatedButton(
              //         onPressed: () {
              //           logic.checkInfo();
              //         },
              //         style: ElevatedButton.styleFrom(
              //           primary: Colors.amber,
              //         ),
              //         child: Row(
              //           children: [
              //             Text(
              //               'Next'.tr,
              //             ),
              //             Icon(
              //               Icons.arrow_forward_ios,
              //               size: 35.sp,
              //             ),
              //           ],
              //         ),
              //       )
              //       // IconButton(
              //       //   onPressed: () {
              //       //     logic.checkInfo();
              //       //   },
              //       //   icon: Icon(
              //       //     Icons.arrow_forward_ios,
              //       //     size: 50.sp,
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
