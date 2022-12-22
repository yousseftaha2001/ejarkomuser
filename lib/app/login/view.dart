import 'package:ejarkom/app/login/ForgetPasswordMod/view.dart';
import 'package:ejarkom/app/login/widgets/forget_password.dart';
import 'package:ejarkom/app/login/widgets/selection_dialog.dart';
import 'package:ejarkom/app/sign_up/sign_up_view.dart';
import 'package:ejarkom/utils/langs/lang_controller.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.h),

                Image.asset(
                  'assets/images/logo.jpg',
                  height: 300.sp,
                ),
                Text(
                  'Login to your account'.tr,
                  style: Get.textTheme.bodyText1!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 150.h),
                DataInput(
                  icon: const Icon(Icons.email_outlined),
                  controller: state.email,
                  hint: 'E-Mail'.tr,
                ),
                SizedBox(height: 50.h),
                DataInput(
                  icon: const Icon(Icons.lock_open_outlined),
                  controller: state.password,
                  hint: 'Password'.tr,
                  maxL: 1,
                  obs: true,
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Get.dialog(
                        //   SendingTypeDialgo(),
                        //   barrierDismissible: false,
                        // );
                        Get.to(() => ForgetpasswordmodPage());
                      },
                      child: Text(
                        'Forget Password?'.tr,
                        style: Get.textTheme.button!.copyWith(
                          fontSize: 30.sp,
                        ),
                      ),
                    )
                  ],
                ),
                // SizedBox(height: 100.h),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Obx(
                        () {
                          return state.loginState.value
                              ? const MyIndicator()
                              : ElevatedButton(
                                  onPressed: () {
                                    logic.loginButton();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Get.theme.primaryColor,
                                    fixedSize: Size(Get.width, 110.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.sp),
                                    ),
                                  ),
                                  child: Text(
                                    'Login'.tr,
                                    style: Get.textTheme.bodyText1!.copyWith(
                                      color: Colors.white,
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                        },
                      ),

                      // SizedBox(
                      //   height: 110.h,
                      //   width: Get.width,
                      //   child: SignInButton(
                      //     Buttons.Google,
                      //     text: "Sign up with Google",

                      //     onPressed: () {},
                      //   ),
                      // ),
                      Divider(),
                      Obx(
                        () => state.googleI.value == '1'
                            ? ElevatedButton(
                                onPressed: () {
                                  // logic.loginButton();
                                  logic.googleSignIn();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  fixedSize: Size(Get.width, 110.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                ),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.google,
                                      color: Get.theme.primaryColor,
                                    ), // <-- Use 'Image.asset(...)' here
                                    SizedBox(width: 12.w),
                                    Text(
                                      'Sign in with Google',
                                      style: Get.textTheme.bodyText1!.copyWith(
                                        color: Get.theme.primaryColor,
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Center(),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     print('h');
                      //   },
                      //   child: Container(
                      //     height: 110.h,
                      //     width: Get.width,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10.sp),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.black12,
                      //         )
                      //       ]

                      //     ),
                      //     child: Center(
                      //       child: Padding(
                      //         padding: EdgeInsets.all(6),
                      //         child: Wrap(
                      //           crossAxisAlignment: WrapCrossAlignment.center,
                      //           children: [
                      //             Icon(FontAwesomeIcons
                      //                 .google), // <-- Use 'Image.asset(...)' here
                      //             SizedBox(width: 12.w),
                      //             Text(
                      //               'Sign in with Google',
                      //               style: Get.textTheme.bodyText1!.copyWith(
                      //                 color: Get.theme.primaryColor,
                      //                 fontSize: 40.sp,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 30.h),
                      // Text(
                      //   'OR',
                      //   style: Get.textTheme.bodyText1!.copyWith(
                      //     fontSize: 30.sp,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {},
                      //       icon: Icon(
                      //         FontAwesomeIcons.google,
                      //         color: Colors.redAccent,
                      //         size: 40.sp,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 70.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'If you do not have an account,'.tr,
                            style: Get.textTheme.bodyText1!.copyWith(
                              color: Colors.grey,
                              fontSize: 30.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => SignUpPage());
                            },
                            child: Text(
                              'Sign up'.tr,
                              style: Get.textTheme.bodyText1!.copyWith(
                                color: Colors.orange,
                                fontSize: 30.sp,
                              ),
                            ),
                          )
                        ],
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
}
