import 'package:ejarkom/app/login/logic.dart';
import 'package:ejarkom/app/login/state.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPasswordDialog extends StatelessWidget {
  ForgetPasswordDialog({Key? key}) : super(key: key);
  final LoginLogic logic = Get.find<LoginLogic>();
  final LoginState state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
              state.email.clear();
              state.passwordF.clear();
            },
            icon: Icon(Icons.close),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Change Password'.tr,
            style: Get.textTheme.bodyText1!.copyWith(
              fontSize: 35.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 40.h),
          DataInput(
            icon: Icon(
                state.selectedSendingOption.value == state.sendingOptions[2]
                    ? Icons.email_outlined
                    : Icons.phone),
            controller: state.email,
            hint: state.selectedSendingOption.value.tr,
          ),
          SizedBox(height: 15.h),
          DataInput(
            controller: state.passwordF,
            obs: true,
            hint: 'New Password'.tr,
            maxL: 1,
            icon: const Icon(Icons.lock),
          ),
          SizedBox(height: 30.h),
          Obx(
            () {
              return state.changePass.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        // logic.uploadSec();
                        //  logic.sendMail();
                        logic.changePass();
                        // logic.changePassword();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Get.theme.primaryColor,
                        fixedSize: Size(400.w, 50.h),
                        elevation: 7.sp,
                        shadowColor: Get.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      child: Text(
                        'Change Password'.tr,
                        style: Get.textTheme.bodyText1!.copyWith(
                          fontSize: 35.sp,
                          color: Colors.white,
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
