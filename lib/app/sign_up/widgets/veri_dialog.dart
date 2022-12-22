import 'package:ejarkom/app/sign_up/sign_up_logic.dart';
import 'package:ejarkom/app/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationDialog extends StatelessWidget {
  VerificationDialog({Key? key}) : super(key: key);
  final SignUpLogic logic = Get.find<SignUpLogic>();
  final SignUpState state = Get.find<SignUpLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close),
          ),
          Text(
            'Email Verification'.tr,
            style: Get.textTheme.bodyText1!.copyWith(
              fontSize: 30.sp,
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: Get.width,
        // height: 150.h,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Enter the code sent to".tr,
                style: Get.textTheme.bodyText1!.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            // SizedBox(height: 10.h),
            Center(
              child: Text(
                state.email.text,
                style: Get.textTheme.bodyText1!.copyWith(
                  fontSize: 35.sp,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            PinCodeTextField(
              appContext: context,
              length: 6,
              textStyle: Get.textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 30.sp,
              ),
              obscureText: false,
              cursorColor: Get.theme.primaryColor,
              // controller: state.pin,
              keyboardType: TextInputType.number,
              onChanged: (v) {
                // code.value = v;
              },
              onCompleted: (v) {
                if (int.parse(v) == state.pinCode) {
                  Get.back();
                  logic.signUpLogic();

                  // c.signupApi(name.text, phone.text, email.text, pass.text);
                } else {
                  // state.pin.clear();
                  Get.snackbar("Error".tr, "The code is incorrect".tr);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
