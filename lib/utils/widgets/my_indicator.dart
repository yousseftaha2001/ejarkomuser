import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


// import 'Avatart';
class MyIndicator extends StatelessWidget {
  const MyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: SpinKitSpinningLines(
    //     color: Get.theme.primaryColor,
    //     size: 50.0.sp,
    //   ),
    // );
    return Center(
      child: AvatarGlow(
        endRadius: 200.0.sp,
        glowColor: Colors.amber,
        child: Material(
          // Replace this child with your own
          elevation: 8.0,
          shape: CircleBorder(),
          
          child: CircleAvatar(
            backgroundColor: Colors.grey[100],
            radius: 100.0.sp,
            child: Image.asset(
              'assets/images/logo.jpg',
              height: 100.sp,
            ),
          ),
        ),
      ),
    );
  }
}
