import 'package:ejarkom/company_app/CompanyHome/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreenCompany extends StatelessWidget {
  final logic = Get.find<CompanyhomeController>();

  final state = Get.find<CompanyhomeController>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyhomeController>(
      builder: (logic) {
        return AnimatedContainer(
          transform: Matrix4.translationValues(state.xOffset, state.yOffset, 0)
            ..scale(state.isDrawerOpen ? 0.85 : 1.00)
            ..rotateZ(state.isDrawerOpen ? 0 : 0),
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: state.isDrawerOpen
                ? BorderRadius.circular(40.sp)
                : BorderRadius.circular(0.sp),
          ),
          child: ClipRRect(
            borderRadius: state.isDrawerOpen
                ? BorderRadius.circular(40.sp)
                : BorderRadius.circular(0.sp),
            child: Obx(
              () => state.screens[state.cureentScreen.value],
            ),
          ),
        );
      },
    );
  }
}
