import 'package:ejarkom/app/login/logic.dart';
import 'package:ejarkom/app/sign_up/sign_up_logic.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginSteper extends StatelessWidget {
  LoginSteper({super.key});
  final logic = Get.find<LoginLogic>();
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Complete Signup'.tr,
          style: Get.textTheme.bodyText1!.copyWith(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
            // state.emailCode.clear();
            state.phoneCode.clear();
            state.selectedSendingOption2.value = '';
            state.currentStep.value = 0;
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            child: Image.asset(
              'assets/images/back.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: Obx(
                  () {
                    return Stepper(
                      steps: _stepper(),
                      type: StepperType.vertical,
                      controlsBuilder: (context, details) {
                        return Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                if (state.currentStep.value == 0) {
                                  // logic.stepOne();
                                }
                                if (state.currentStep.value == 1) {
                                  state.selectedSendingOption2.value ==
                                          state.sendingOptions2[1]
                                      ? state.timeIsOpen.value
                                          ? null
                                          : logic.stepTwo()
                                      : logic.stepTwo();
                                }
                                if (state.currentStep.value == 2) {
                                  logic.stepThree();
                                }
                              },
                              child: Text(
                                logic.nextButtonText().tr,
                                style: Get.textTheme.bodyText1,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  if (state.currentStep.value == 2) {
                                    state.currentStep.value =
                                        state.currentStep.value - 1;
                                  } else {
                                    // state.currentStep.value = 0;
                                  }
                                },
                                child: Text('Cancel')),
                          ],
                        );
                      },
                      currentStep: state.currentStep.value,
                      onStepTapped: (step) {},
                      // onStepContinue: () {
                      //   // if (state.currentStep.value <
                      //   //     this._stepper().length - 1) {
                      //   //   state.currentStep.value = state.currentStep.value + 1;
                      //   // }else{
                      //   //   print('Here');
                      //   // }
                      //   if (state.currentStep.value == 0) {
                      //     logic.stepOne();
                      //   }
                      //   if (state.currentStep.value == 1) {
                      //     logic.stepTwo();
                      //   }
                      //   if (state.currentStep.value == 2) {
                      //     logic.stepThree();
                      //   }
                      // },
                      // onStepCancel: () {
                      //   if (state.currentStep.value > 0) {
                      //     state.currentStep.value = state.currentStep.value - 1;
                      //   } else {
                      //     state.currentStep.value = 0;
                      //   }
                      // },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Step> _stepper() {
    List<Step> _steps = [
       Step(
        title: Text('Email Verification'.tr),
        content: Column(
          children: <Widget>[
            Center(
              child: Text(
                "Enter the code sent to".tr,
                style: Get.textTheme.bodyText1!.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Center(
              child: Text(
                state.email.text,
                style: Get.textTheme.bodyText1!.copyWith(
                  fontSize: 35.sp,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            DataInput(
              icon: Icon(Icons.pin),
              controller: state.email,
              hint: 'Code'.tr,
            ),
          ],
        ),
        isActive: state.currentStep.value == 0,
        state: state.currentStep.value > 0
            ? StepState.complete
            : StepState.editing,
      ),
      Step(
        title: Text('Phone Verification Type'.tr),
        content: Column(
          children: <Widget>[
            Column(
              children: List.generate(
                state.sendingOptions2.length,
                (index) => RadioListTile<String>(
                  value: state.sendingOptions2[index],
                  groupValue: state.selectedSendingOption2.value,
                  activeColor: Get.theme.primaryColor,
                  onChanged: (va) {
                    state.selectedSendingOption2.value = va!;
                  },
                  title: Text(
                    state.sendingOptions2[index],
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontSize: 30.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            state.selectedSendingOption2.value == state.sendingOptions2[1]
                ? Obx(() {
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
                                return const Center();
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
                  })
                : Container(),
            // state.phoneVeriModel != null
            //     ? Column(
            //         children: [
            //           Text(
            //             // ignore: unnecessary_string_interpolations
            //             '${dateParser(
            //               DateTime.now()
            //                   .subtract(Duration(
            //                       hours: state.phoneVeriModel!.tryAgain!.hour,
            //                       minutes:
            //                           state.phoneVeriModel!.tryAgain!.minute))
            //                   .toString(),
            //             )}',
            //             style: Get.textTheme.bodyText1,
            //           ),
            //           Text(
            //             // ignore: unnecessary_string_interpolations
            //             '${dateParser(
            //               state.phoneVeriModel!.tryAgain!.toString(),
            //             )}',
            //             style: Get.textTheme.bodyText1,
            //           ),
            //         ],
            //       )
            //     : Container()
          ],
        ),
        isActive: state.currentStep.value == 1,
        state: state.currentStep.value > 1
            ? StepState.complete
            : StepState.editing,
      ),
      Step(
        title: Text('Phone Verification'.tr),
        content: Column(
          children: <Widget>[
            Center(
              child: Text(
                "${'Enter the code sent to your'.tr} ${state.selectedSendingOption2.value}"
                    .tr,
                style: Get.textTheme.bodyText1!.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Center(
              child: Text(
                state.phone2.text,
                style: Get.textTheme.bodyText1!.copyWith(
                  fontSize: 35.sp,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            DataInput(
              icon: Icon(Icons.pin),
              controller: state.phoneCode,
              hint: 'Code'.tr,
            ),
          ],
        ),
        isActive: state.currentStep.value == 2,
        state: state.currentStep.value > 2
            ? StepState.complete
            : StepState.editing,
      ),
    ];
    return _steps;
  }
}
