import 'package:ejarkom/company_app/CompanyData/index.dart';
import 'package:ejarkom/company_app/CompanySignUp/widgets/custom_data_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/widgets/my_indicator.dart';

class AddDataCompany extends StatelessWidget {
  AddDataCompany({super.key});
  final controller = Get.find<CompanydataController>();
  final state = Get.find<CompanydataController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios,color: Get.theme.primaryColor,),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<CompanydataController>(
                  id: 'photo1',
                  builder: (c) {
                    return SizedBox(
                      width: 200.h,
                      height: 200.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.sp),
                        child: state.photo.value!.isNotEmpty
                            ? Image.memory(
                                state.photo.value!,
                              )
                            : Image.network(
                                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                              ),
                      ),
                    );
                  },
                ),
                TextButton(
                  onPressed: state.addState.value
                      ? null
                      : () {
                          controller.getImage1();
                        },
                  child: Text(
                    'Add Company Id'.tr,
                    style: Get.textTheme.button!.copyWith(
                      fontSize: 35.sp,
                      color: Get.theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<CompanydataController>(
                  id: 'photo2',
                  builder: (c) {
                    return SizedBox(
                       width: 200.h,
                      height: 200.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.sp),
                        child: state.photo2.value!.isNotEmpty
                            ? Image.memory(
                                state.photo2.value!,
                              )
                            : Image.network(
                                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                              ),
                      ),
                    );
                  },
                ),
                TextButton(
                  onPressed: state.addState.value
                      ? null
                      : () {
                          controller.getImage2();
                        },
                  child: Text(
                    'Add Owner Id'.tr,
                    style: Get.textTheme.button!.copyWith(
                       fontSize: 35.sp,
                      color: Get.theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            CustomDataInput(
              title: 'Address'.tr,
              maxLines: 1,
              enabled: !state.addState.value,
              obs: false,
              icon: Icon(Icons.location_pin),
              onChanged: (String? value) {
                // print(value);
                state.address.value = value!;
              },
            ),
            SizedBox(height: 120.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Obx(() {
                return state.addState.value
                    ? MyIndicator()
                    : ElevatedButton(
                        onPressed: state.photo.value!.isEmpty ||
                                state.photo2.value!.isEmpty ||
                                state.address.isEmpty
                            ? null
                            : () {
                                // controller.sendMail();
                                controller.uploadData();
                              },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width / 2, 50.h),
                        ),
                        child: Text(
                          'Send New Data'.tr,
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}
