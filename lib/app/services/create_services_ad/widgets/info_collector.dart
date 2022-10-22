import 'package:ejarkom/app/Ads/create_ads/widgets/my_from_feild.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_logic.dart';
import 'package:ejarkom/app/services/create_services_ad/create_services_ad_state.dart';
import 'package:ejarkom/utils/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InfoCollector extends StatelessWidget {
  InfoCollector({Key? key}) : super(key: key);

  final CreateServicesAdLogic logic = Get.find<CreateServicesAdLogic>();

  final CreateServicesAdState state = Get.find<CreateServicesAdLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo.jpg',
            height: 130.h,
          ),
          SizedBox(height: 20.h),
          DataInput(
            controller: state.nameE,
            hint: 'Name In English'.tr,
            icon: Icon(Icons.language),
          ),
          SizedBox(height: 20.h),
          DataInput(
            controller: state.nameA,
            hint: 'Name In Arabic'.tr,
            icon: Icon(Icons.language),
          ),
          SizedBox(height: 20.h),
          DataInput(
            controller: state.descriptionE,
            hint: 'Description In English'.tr,
            icon: Icon(Icons.description_outlined),
          ),
          SizedBox(height: 20.h),
          DataInput(
            controller: state.descriptionA,
            hint: 'Description In Arabic'.tr,
            icon: Icon(Icons.description_outlined),
          ),
          SizedBox(height: 20.h),
          DataInput(
            controller: state.phone,
            hint: 'Phone'.tr,
            icon: Icon(Icons.phone),
          ),
          SizedBox(height: 20.h),
          DataInput(
            controller: state.whats,
            hint: 'WhatsApp'.tr,
            icon: Icon(FontAwesomeIcons.whatsapp),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  logic.checkInfo();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
                child: Row(
                  children: [
                    Text(
                      'Next'.tr,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 25.sp,
                    ),
                  ],
                ),
              )
              // IconButton(
              //   onPressed: () {
              //     logic.checkInfo();
              //   },
              //   icon: Icon(
              //     Icons.arrow_forward_ios,
              //     size: 50.sp,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
