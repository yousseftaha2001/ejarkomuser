import 'package:ejarkom/app/sign_up/widgets/steper_screen.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/langs/lang_controller.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
//padding= number/mockupwideth*width
// text=wideth/mWidth
import 'sign_up_logic.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final logic = Get.put(SignUpLogic());
  final state = Get.find<SignUpLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        // reverse: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              SizedBox(
                height: Get.height,
                child: Image.asset(
                  'assets/images/back.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 50.sp,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        // GetBuilder<LanguageController>(
                        //   init: LanguageController(),
                        //   builder: (controller) {
                        //     return Padding(
                        //       padding: EdgeInsets.symmetric(horizontal: 10.w),
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           controller.appLang == 'ar'
                        //               ? controller.changeLang(langCode: 'en')
                        //               : controller.changeLang(langCode: 'ar');
                        //         },
                        //         child: Center(child: Icon(Icons.language)),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ],
                    ),

                    // SizedBox(height: 60.h),
                    Image.asset(
                      'assets/images/logo.jpg',
                      height: 200.h,
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40.sp),
                          child: SizedBox(
                            height: 200.h,
                            width: 200.h,
                            child: GetBuilder<SignUpLogic>(
                              id: 'photo',
                              builder: (controller) {
                                return state.photo != null
                                    ? Image.file(
                                        state.image!,
                                        fit: BoxFit.contain,
                                      )
                                    : Image.asset(
                                        'assets/images/3135715.png',
                                      );
                              },
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            logic.getImages(w: 'i');
                          },
                          child: Text('Add Photo'.tr),
                        )
                      ],
                    ),
                    SizedBox(height: 50.h),
                    DataInput(
                      icon: Icon(Icons.email_outlined),
                      controller: state.email,
                      hint: 'E-Mail'.tr,
                    ),
                    SizedBox(height: 30.h),
                    DataInput(
                      icon: Icon(Icons.drive_file_rename_outline),
                      controller: state.fullName,
                      hint: 'Full Name'.tr,
                    ),
                    
                    SizedBox(height: 30.h),
                    DataInput(
                      icon: Icon(Icons.lock_open),
                      controller: state.password,
                      hint: 'Password'.tr,
                      obs: true,
                      maxL: 1,
                    ),
                    SizedBox(height: 30.h),
                    DataInput(
                      icon: Icon(Icons.lock_open),
                      controller: state.rePassword,
                      hint: 're-password'.tr,
                      maxL: 1,
                      obs: true,
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Container(
                          height: 100.h,

                          // width: 60.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '+962',
                                style: Get.textTheme.bodyText1!.copyWith(
                                  fontSize: 35.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Flexible(
                          child: DataInput(
                            icon: Icon(Icons.phone),
                            controller: state.phone,
                            hint: 'Phone'.tr,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100.h),
                    // Spacer(),
                    Obx(
                      () {
                        return state.sendMailState.value
                            ? MyIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  logic.sendMail();
                                  // Get.to(()=>SignUpSteper());
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Get.theme.primaryColor,
                                  fixedSize: Size(Get.width, 110.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                ),
                                child: Text(
                                  'Sign up'.tr,
                                  style: Get.textTheme.bodyText1!.copyWith(
                                    color: Colors.white,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<SignUpLogic>();
    super.dispose();
  }
}
