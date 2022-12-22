import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ErrorD extends StatelessWidget {
  ErrorD({Key? key, required this.error}) : super(key: key);
  late List<String> error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
            ),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error, size: 30.sp),
          SizedBox(height: 20.h),
          Column(
            children: List.generate(
              error.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Text(
                  error[index],
                  style: Get.textTheme.bodyText1!,
                  
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
