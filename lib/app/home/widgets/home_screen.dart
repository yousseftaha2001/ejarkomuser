import 'package:ejarkom/app/home/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final logic = Get.find<HomeLogic>();

  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
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
            child: Obx(
              () => state.screens[state.cureentScreen.value],
            ),
            borderRadius: state.isDrawerOpen
                ? BorderRadius.circular(40.sp)
                : BorderRadius.circular(0.sp),
          ),
        );
      },
    );
  }
}
