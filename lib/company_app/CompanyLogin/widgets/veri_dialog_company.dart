import 'package:ejarkom/company_app/CompanyLogin/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationDialogLoginCompany extends StatelessWidget {
  VerificationDialogLoginCompany({Key? key}) : super(key: key);
  final CompanyloginController logic = Get.find<CompanyloginController>();
  final CompanyloginState state = Get.find<CompanyloginController>().state;

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
            '${state.selectedSendingOption.value} Verification'.tr,
            style: Get.textTheme.bodyText1!.copyWith(
              fontSize: 40.sp,
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
                  fontSize: 30.sp,
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
                  logic.completeForger();

                  // c.signupApi(name.text, phone.text, email.text, pass.text);
                } else {
                  // state.pin.clear();
                  Get.snackbar("Error".tr, "The code is incorrect".tr);
                }
              },
            ),
            SizedBox(height: 10.h),
            state.selectedSendingOption.value == state.sendingOptions[1]
                ? Column(
                    children: [
                      Obx(() {
                        return state.timeIsOpen.value
                            ? CountdownTimer(
                                onEnd: () {
                                  state.timeIsOpen.value = false;
                                },
                                endTime: state.phoneVeriModel!.tryAgain!
                                    .microsecondsSinceEpoch,
                                endWidget: Text(
                                  'You can resend now'.tr,
                                  style: Get.textTheme.bodyText1,
                                ),
                                widgetBuilder: (context, time) {
                                  if (time == null) {
                                    return Center();
                                  } else {
                                    return Text(
                                      'Minutes:${time.min} Seconds:${time.sec}',
                                      style: Get.textTheme.bodyText1!.copyWith(
                                          color: Colors.black, fontSize: 35.sp),
                                    );
                                  }
                                },
                              )
                            : Container();
                      }),
                      SizedBox(height: 10.h),
                      Obx(() {
                        return TextButton(
                          onPressed: state.timeIsOpen.value ? null : () {},
                          child: Text(
                            'resend'.tr,
                            // style: Get.textTheme.bodyText1!.copyWith(
                            //   color: Colors.black,
                            // ),
                          ),
                        );
                      })
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
