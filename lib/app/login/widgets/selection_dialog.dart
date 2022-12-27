import 'package:ejarkom/app/login/logic.dart';
import 'package:ejarkom/app/login/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SendingTypeDialgo extends StatelessWidget {
  SendingTypeDialgo({super.key});
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
            'Sending Code to?'.tr,
            style: Get.textTheme.bodyText1!.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20.h),
          Obx(
            () => Column(
              children: List.generate(
                state.sendingOptions.length,
                (index) => RadioListTile<String>(
                  value: state.sendingOptions[index],
                  groupValue: state.selectedSendingOption.value,
                  activeColor: Get.theme.primaryColor,
                  onChanged: (va) {
                    state.selectedSendingOption.value = va!;
                  },
                  title: Text(
                    state.sendingOptions[index],
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontSize: 35.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            logic.nextButton();
          },
          child: Text(
            'Next'.tr,
            style: Get.textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
