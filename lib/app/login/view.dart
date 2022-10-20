import 'package:ejarkom/app/sign_up/sign_up_view.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  SvgPicture.asset('assets/images/mainlogo.svg'),
                  Text(
                    'Login to your account'.tr,
                    style: Get.textTheme.bodyText1!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 80.h),
                  DataInput(
                    icon: Icon(Icons.email_outlined),
                    controller: state.email,
                    hint: 'E-Mail'.tr,
                  ),
                  SizedBox(height: 30.h),
                  DataInput(
                    icon: Icon(Icons.lock_open_outlined),
                    controller: state.password,
                    hint: 'Password'.tr,
                  ),
                  SizedBox(height: 140.h),
                  Obx(
                    () {
                      return state.loginState.value
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                logic.loginButton();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Get.theme.primaryColor,
                                fixedSize: Size(Get.width.w, 45.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                              ),
                              child: Text(
                                'Login'.tr,
                                style: Get.textTheme.bodyText1!.copyWith(
                                  color: Colors.white,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                    },
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'OR',
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontSize: 30.sp,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.redAccent,
                          size: 40.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'If you do not have an account,',
                        style: Get.textTheme.bodyText1!.copyWith(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignUpPage());
                        },
                        child: Text(
                          'Sign up',
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: Colors.orange,
                            fontSize: 20.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
