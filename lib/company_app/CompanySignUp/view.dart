import 'package:ejarkom/company_app/CompanySignUp/widgets/custom_data_in.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class CompanysignupPage extends GetView<CompanysignupController> {
  const CompanysignupPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanysignupController>(
      builder: (_) {
        return Scaffold(
          // resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            // reverse: true,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: Get.height,
                    child: Image.asset(
                      'assets/images/back.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.h),
                        Row(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 50.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // SizedBox(height: 60.h),
                        Image.asset(
                          'assets/images/logo.jpg',
                          height: 200.h,
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetBuilder<CompanysignupController>(
                              id: 'photo1',
                              builder: (c) {
                                return SizedBox(
                                  width: 120.h,
                                  height: 120.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.sp),
                                    child:
                                        controller.state.photo.value!.isNotEmpty
                                            ? Image.memory(
                                                controller.state.photo.value!,
                                              )
                                            : Image.network(
                                                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                                              ),
                                  ),
                                );
                              },
                            ),
                            TextButton(
                              onPressed: () {
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
                        SizedBox(height: 50.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetBuilder<CompanysignupController>(
                              id: 'photo2',
                              builder: (c) {
                                return SizedBox(
                                  width: 120.h,
                                  height: 120.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.sp),
                                    child: controller
                                            .state.photo2.value!.isNotEmpty
                                        ? Image.memory(
                                            controller.state.photo2.value!,
                                          )
                                        : Image.network(
                                            'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                                          ),
                                  ),
                                );
                              },
                            ),
                            TextButton(
                              onPressed: () {
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
                        SizedBox(height: 50.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetBuilder<CompanysignupController>(
                              id: 'photo3',
                              builder: (c) {
                                return SizedBox(
                                  width: 120.h,
                                  height: 120.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.sp),
                                    child: controller
                                            .state.photo3.value!.isNotEmpty
                                        ? Image.memory(
                                            controller.state.photo3.value!,
                                          )
                                        : Image.network(
                                            'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                                          ),
                                  ),
                                );
                              },
                            ),
                            TextButton(
                              onPressed: () {
                                controller.getImage3();
                                //818c580278@emailkom.live
                              },
                              child: Text(
                                'Add Company Logo'.tr,
                                style: Get.textTheme.button!.copyWith(
                                  fontSize: 35.sp,
                                  color: Get.theme.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 70.h),
                        CustomDataInput(
                          title: 'Name',
                          obs: false,
                          maxLines: 1,
                          enabled: !controller.state.loginState.value,
                          icon: Icon(Icons.admin_panel_settings),
                          onChanged: (String? value) {
                            // print(value);
                            controller.state.name.value = value!;
                          },
                        ),
                        SizedBox(height: 50.h),
                        CustomDataInput(
                          title: 'Email',
                          maxLines: 1,
                          enabled: !controller.state.loginState.value,
                          obs: false,
                          icon: Icon(Icons.email),
                          onChanged: (String? value) {
                            // print(value);
                            controller.state.email.value = value!;
                          },
                        ),
                        SizedBox(height: 50.h),
                        PhoneFormField(
                            key: Key('phone-field'),
                            controller: null, // controller & initialValue value
                            initialValue:
                                null, // can't be supplied simultaneously
                            shouldFormat: true,
                              textAlign: TextAlign.left,
                            style: Get.textTheme.bodyText1, // default
                            defaultCountry: IsoCode.JO, // default
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.sp),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.sp),
                                
                              ),
                              
                              hintText: 'Phone'.tr,
                              errorStyle: Get.textTheme.bodyText1!.copyWith(fontSize: 25.sp),
                              labelStyle: Get.textTheme.bodyText1
                            ),
                            validator: (PhoneNumber? num){
                              if (num!.isValid()) {
                                
                              }else{
                                controller.state.phone.value='';
                                return 'Invalid Phone Number'.tr;
                              }
                            }, // default PhoneValidator.valid()
                            isCountryChipPersistent: false, // default
                            isCountrySelectionEnabled: false, // default
                            
                            showFlagInInput: true, // default
                            flagSize: 40.sp, // default
                            autofillHints: [
                              AutofillHints.telephoneNumber
                            ], // default to null
                            enabled: true, // default
                            autofocus: false, // default
                            
                            onSaved: (PhoneNumber? p) =>
                                print('saved $p'), // default null
                            onChanged: (PhoneNumber? p) {
                              printInfo(info: p.toString());
                              controller.state.phone.value = p!.international.toString();
                              printInfo(info: controller.state.phone.value);
                            } // default null
                            // ... + other textfield params
                            ),
                        SizedBox(height: 50.h),
                        CustomDataInput(
                          title: 'Address',
                          maxLines: 1,
                          enabled: !controller.state.loginState.value,
                          obs: false,
                          icon: Icon(Icons.location_pin),
                          onChanged: (String? value) {
                            // print(value);
                            controller.state.address.value = value!;
                          },
                        ),
                        SizedBox(height: 50.h),
                        CustomDataInput(
                          title: 'Password',
                          maxLines: 1,
                          enabled: !controller.state.loginState.value,
                          obs: true,
                          icon: Icon(Icons.lock),
                          onChanged: (String? value) {
                            // print(value);
                            controller.state.password.value = value!;
                          },
                        ),

                      
                        SizedBox(height: 100.h),
                        // Spacer(),
                        Obx(
                          () {
                            return controller.state.sendMailState.value
                                ? MyIndicator()
                                : ElevatedButton(
                                    onPressed: () {
                                      controller.sendMail();
                                      // Get.to(()=>SignUpSteper());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Get.theme.primaryColor,
                                      fixedSize: Size(Get.width, 110.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.sp),
                                      ),
                                    ),
                                    child: Text(
                                      'Sign up'.tr,
                                      style: Get.textTheme.bodyText1!.copyWith(
                                        color: Colors.white,
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
