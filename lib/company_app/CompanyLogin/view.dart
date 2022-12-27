import 'package:ejarkom/company_app/CompanySignUp/index.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../app/login/ForgetPasswordMod/view.dart';
import '../CompanySignUp/view.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class CompanyloginPage extends GetView<CompanyloginController> {
  const CompanyloginPage({Key? key}) : super(key: key);

  // 主视图
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyloginController>(
      builder: (_) {
        return   Scaffold(
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
                  controller: controller.state.email,
                  hint: 'E-Mail'.tr,
                ),
                SizedBox(height: 50.h),
                DataInput(
                  icon: const Icon(Icons.lock_open_outlined),
                  controller: controller.state.password,
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
                          return controller.state.loginState.value
                              ? const MyIndicator()
                              : ElevatedButton(
                                  onPressed: () {
                                    controller.loginButton();
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
                              Get.to(() => CompanysignupPage(),binding: CompanysignupBinding());
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
      },
    );
  }
}
