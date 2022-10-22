import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.png'),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 40.sp,
                      )),
                  SvgPicture.asset('assets/images/mainlogo.svg'),
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
                    icon: Icon(Icons.phone),
                    controller: state.phone,
                    hint: 'Phone'.tr,
                  ),
                  SizedBox(height: 30.h),
                  DataInput(
                    icon: Icon(Icons.lock_open),
                    controller: state.password,
                    hint: 'Password'.tr,
                    obs: true,
                  ),
                  SizedBox(height: 30.h),
                  DataInput(
                    icon: Icon(Icons.lock_open),
                    controller: state.rePassword,
                    hint: 're-password'.tr,
                    obs: true,
                  ),
                  SizedBox(height: 100.h),
                  Obx(
                    () {
                      return state.sendMailState.value
                          ? MyIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                logic.sendMail();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Get.theme.primaryColor,
                                fixedSize: Size(Get.width.w, 45.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                              ),
                              child: Text(
                                'Sign up'.tr,
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
            ),
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
