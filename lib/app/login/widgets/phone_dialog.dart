import 'package:ejarkom/app/login/logic.dart';
import 'package:ejarkom/app/login/state.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneDialog extends StatelessWidget {
  const PhoneDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginLogic logic = Get.find<LoginLogic>();
    final LoginState state = Get.find<LoginLogic>().state;
    return AlertDialog(
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
              state.phone2.clear();
              // state.passwordF.clear();
            },
            icon: Icon(Icons.close),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 100.h,

                // width: 60.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10.sp)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '+962',
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 35.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Flexible(
                child: DataInput(
                  icon: Icon(Icons.phone),
                  controller: state.phone2,
                  hint: 'Phone'.tr,
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),
           ElevatedButton(
                      onPressed: () {
                        // logic.uploadSec();
                        //  logic.sendMail();
                        // logic.changePass();
                        // logic.changePassword();
                        logic.nextPhone();
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
                        'Next'.tr,
                        style: Get.textTheme.bodyText1!.copyWith(
                          fontSize: 35.sp,
                          color: Colors.white,
                        ),
                      ),
                    )
        ],
      ),
    );
  }
}
