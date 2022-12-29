import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class ForgetpasswordmodPage extends GetView<ForgetpasswordmodController> {
  ForgetpasswordmodPage({Key? key}) : super(key: key);
  // final state=Get.find<ForgetpasswordmodController>().state;

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ForgetpasswordmodPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetpasswordmodController>(
      init: ForgetpasswordmodController(),
      id: "forgetpasswordmod",
      builder: (_) {
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              'Change Password'.tr,
              style: Get.textTheme.bodyText1!.copyWith(
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();

                controller.state.selectedSendingOption.value = '';
                controller.state.phoneVeriModel = null;
                controller.state.currentStep.value = 0;
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
                                    if (controller.state.currentStep.value ==
                                        0) {
                                      if (Get.isSnackbarOpen) {
                                        Get.back();
                                        controller.stepOne();
                                      } else {
                                        controller.stepOne();
                                      }
                                    }
                                    if (controller.state.currentStep.value ==
                                        1) {
                                      if (Get.isSnackbarOpen) {
                                        Get.back();
                                        controller.state.selectedSendingOption
                                                    .value ==
                                                controller
                                                    .state.sendingOptions[1]
                                            ? controller.state.timeIsOpen.value
                                                ? null
                                                : controller.stepTwo()
                                            : controller.stepTwo();
                                      } else {
                                        controller.state.selectedSendingOption
                                                    .value ==
                                                controller
                                                    .state.sendingOptions[1]
                                            ? controller.state.timeIsOpen.value
                                                ? null
                                                : controller.stepTwo()
                                            : controller.stepTwo();
                                      }
                                    }
                                    if (controller.state.currentStep.value ==
                                        2) {
                                      controller.stepThree();
                                    }
                                  },
                                  child: Text(
                                    controller.nextButtonText().tr,
                                    style: Get.textTheme.bodyText1,
                                  ),
                                ),
                                controller.state.currentStep.value > 0
                                    ? TextButton(
                                        onPressed: () {
                                          if (controller
                                                  .state.currentStep.value ==
                                              2) {
                                            controller.state.currentStep.value =
                                                controller.state.currentStep
                                                        .value -
                                                    1;
                                          } else {
                                            // controller.state.currentStep.value = 0;
                                            if (controller
                                                    .state.phoneVeriModel !=
                                                null) {
                                              controller.state.currentStep
                                                  .value = controller
                                                      .state.currentStep.value +
                                                  1;
                                            }
                                          }
                                        },
                                        child: Text(controller
                                                    .state.currentStep.value ==
                                                2
                                            ? 'Back'.tr
                                            : controller.state.phoneVeriModel ==
                                                    null
                                                ? ""
                                                : 'Next'.tr))
                                    : Container(),
                              ],
                            );
                          },
                          currentStep: controller.state.currentStep.value,
                          onStepTapped: (step) {},
                          // onStepContinue: () {
                          //   // if (controller.state.currentStep.value <
                          //   //     this._stepper().length - 1) {
                          //   //   controller.state.currentStep.value = controller.state.currentStep.value + 1;
                          //   // }else{
                          //   //   print('Here');
                          //   // }
                          //   if (controller.state.currentStep.value == 0) {
                          //     logic.stepOne();
                          //   }
                          //   if (controller.state.currentStep.value == 1) {
                          //     logic.stepTwo();
                          //   }
                          //   if (controller.state.currentStep.value == 2) {
                          //     logic.stepThree();
                          //   }
                          // },
                          // onStepCancel: () {
                          //   if (controller.state.currentStep.value > 0) {
                          //     controller.state.currentStep.value = controller.state.currentStep.value - 1;
                          //   } else {
                          //     controller.state.currentStep.value = 0;
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
      },
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
                controller.state.email.text,
                style: Get.textTheme.bodyText1!.copyWith(
                  fontSize: 35.sp,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            DataInput(
              icon: Icon(Icons.pin),
              controller: controller.state.email,
              hint: 'please enter your Phone or E-mail'.tr,
            ),
          ],
        ),
        isActive: controller.state.currentStep.value == 0,
        state: controller.state.currentStep.value > 0
            ? StepState.complete
            : StepState.editing,
      ),
      Step(
        title: Text('Verification Type'.tr),
        content: Column(
          // textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            controller.state.findUserModel == null
                ? Container()
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.state.findUserModel!.phone!
                            .replaceRange(5, 10, '******'),
                        style: Get.textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontSize: 35.sp,
                        ),
                      ),
                      Text(
                        controller.state.findUserModel!.email!
                            .replaceRange(3, 10, '******'),
                        style: Get.textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontSize: 35.sp,
                        ),
                      ),
                    ],
                  ),
            Column(
              children: List.generate(
                controller.state.sendingOptions.length,
                (index) => RadioListTile<String>(
                  value: controller.state.sendingOptions[index],
                  groupValue: controller.state.selectedSendingOption.value,
                  activeColor: Get.theme.primaryColor,
                  onChanged: (va) {
                    controller.state.selectedSendingOption.value = va!;
                  },
                  title: Text(
                    controller.state.sendingOptions[index],
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontSize: 30.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            controller.state.selectedSendingOption.value ==
                    controller.state.sendingOptions[1]
                ? Obx(() {
                    return controller.state.timeIsOpen.value
                        ? CountdownTimer(
                            onEnd: () {
                              controller.state.timeIsOpen.value = false;
                            },
                            endTime: controller.state.phoneVeriModel!.tryAgain!
                                .millisecondsSinceEpoch,
                            endWidget: Text(
                              'You can resend now'.tr,
                              style: Get.textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            widgetBuilder: (context, time) {
                              if (time == null) {
                                return Text(
                                  'You can resend now'.tr,
                                  style: Get.textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Text(
                                  'Minutes:${time.min ?? '0'} Seconds:${time.sec ?? '0'}',
                                  style: Get.textTheme.bodyText1!.copyWith(
                                      color: Colors.black, fontSize: 35.sp),
                                );
                              }
                            },
                          )
                        : Container();
                  })
                : Container(),
            // controller.state.phoneVeriModel != null
            //     ? Column(
            //         children: [
            //           Text(
            //             // ignore: unnecessary_string_interpolations
            //             '${dateParser(
            //               DateTime.now()
            //                   .subtract(Duration(
            //                       hours: controller.state.phoneVeriModel!.tryAgain!.hour,
            //                       minutes:
            //                           controller.state.phoneVeriModel!.tryAgain!.minute))
            //                   .toString(),
            //             )}',
            //             style: Get.textTheme.bodyText1,
            //           ),
            //           Text(
            //             // ignore: unnecessary_string_interpolations
            //             '${dateParser(
            //               controller.state.phoneVeriModel!.tryAgain!.toString(),
            //             )}',
            //             style: Get.textTheme.bodyText1,
            //           ),
            //         ],
            //       )
            //     : Container()
          ],
        ),
        isActive: controller.state.currentStep.value == 1,
        state: controller.state.currentStep.value > 1
            ? StepState.complete
            : StepState.editing,
      ),
      Step(
        title: Text('Code Verification'.tr),
        content: Column(
          children: <Widget>[
            Center(
              child: Text(
                "${'Enter the code sent to your'.tr} ${controller.state.selectedSendingOption.value}"
                    .tr,
                style: Get.textTheme.bodyText1!.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            controller.state.findUserModel==null?Container():Center(
              child: Text(
                controller.state.selectedSendingOption.value== 'E-mail'.tr? '${controller.state.findUserModel!.email!}':' ${controller.state.findUserModel!.phone!}',
                style: Get.textTheme.bodyText1!.copyWith(
                  fontSize: 35.sp,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            DataInput(
              icon: Icon(Icons.pin),
              controller: controller.state.code,
              hint: 'Code'.tr,
            ),
          ],
        ),
        isActive: controller.state.currentStep.value == 2,
        state: controller.state.currentStep.value > 2
            ? StepState.complete
            : StepState.editing,
      ),
    ];
    return _steps;
  }
}
