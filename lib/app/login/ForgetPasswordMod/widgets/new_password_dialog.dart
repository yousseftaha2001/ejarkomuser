import 'package:ejarkom/app/login/ForgetPasswordMod/index.dart';
import 'package:ejarkom/app/login/ForgetPasswordMod/state.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewPasswordDialog extends StatelessWidget {
   NewPasswordDialog({super.key});
  final ForgetpasswordmodController logic = Get.find<ForgetpasswordmodController>();
  final ForgetPasswordState state = Get.find<ForgetpasswordmodController>().state;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
              // state.email.clear();
              state.newPassword.clear();
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
            controller: state.newPassword,
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
                        logic.completeForger();
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