import 'package:ejarkom/app/home/logic.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/apis.dart';

class DrawerScreen extends StatelessWidget {
  final logic = Get.find<HomeLogic>();

  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logic.closeDrawer();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          image: const DecorationImage(
              image: AssetImage('assets/images/newb.png'),
              fit: BoxFit.fitHeight),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 50.h, left: 20.w, bottom: 70.h, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //  Spacer(),
                  SizedBox(height: 120.h),
                  MyDataBase.getPhoto() == ''
                      ? Container()
                      : CircleAvatar(
                        // borderRadius: BorderRadius.circular(100.sp),
                        radius: 120.sp,
                        backgroundImage:NetworkImage(
                            '${photoAPI}${MyDataBase.getPhoto()}',
                            // 'https://media.istockphoto.com/id/1338134336/photo/headshot-portrait-african-30s-man-smile-look-at-camera.jpg?b=1&s=170667a&w=0&k=20&c=j-oMdWCMLx5rIx-_W33o3q3aW9CiAWEvv9XrJQ3fTMU=',
                            // fit: BoxFit.contain,
                            // width: 400.h,
                            // height: 300.h,
                          ),
                      ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => state.gettingState.value
                            ? MyIndicator()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.h),
                                  Text(
                                    '${state.userData.name}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '${state.userData.email}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${state.userData.phone}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${'Current package:'.tr} ${state.userData.numAds}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 10.h),

                  SizedBox(height: 20.h),
                  Container(
                    // width: 250.w,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2.sp,
                      // endIndent: 350.w,
                    ),
                  ),
                  SizedBox(height: 40.h),

                  NewRow(
                    text: 'Home Screen'.tr,
                    icon: Icons.home,
                    ontap: () {
                      state.isDrawerOpen
                          ? logic.closeDrawer()
                          : logic.openDrawer();
                      state.cureentScreen.value = 0;
                    },
                  ),

                  SizedBox(height: 5.h),
                  NewRow(
                    text: 'My Informtions'.tr,
                    icon: Icons.data_object,
                    ontap: () {
                      state.cureentScreen.value = 3;
                      state.isDrawerOpen
                          ? logic.closeDrawer()
                          : logic.openDrawer();
                      // state.cureentScreen.value=0;
                    },
                  ),
                  SizedBox(height: 5.h),
                  NewRow(
                    text: 'Ads'.tr,
                    icon: Icons.ads_click_outlined,
                    ontap: () {
                      state.cureentScreen.value = 1;
                      state.isDrawerOpen
                          ? logic.closeDrawer()
                          : logic.openDrawer();
                      // state.cureentScreen.value=0;
                    },
                  ),
                  SizedBox(height: 5.h),
                  NewRow(
                    text: 'My Services ADs'.tr,
                    icon: Icons.home_repair_service_outlined,
                    ontap: () {
                      state.cureentScreen.value = 5;
                      state.isDrawerOpen
                          ? logic.closeDrawer()
                          : logic.openDrawer();
                      // state.cureentScreen.value=0;
                    },
                  ),
                  SizedBox(height: 5.h),
                  NewRow(
                    text: 'Packages'.tr,
                    icon: Icons.shop,
                    ontap: () {
                      state.cureentScreen.value = 2;
                      state.isDrawerOpen
                          ? logic.closeDrawer()
                          : logic.openDrawer();
                      // state.cureentScreen.value=0;
                    },
                  ),
                  SizedBox(height: 5.h),
                  NewRow(
                    text: 'My Requests'.tr,
                    icon: Icons.request_quote_sharp,
                    ontap: () {
                      state.cureentScreen.value = 4;
                      state.isDrawerOpen
                          ? logic.closeDrawer()
                          : logic.openDrawer();
                      // state.cureentScreen.value=0;
                    },
                  ),
                  SizedBox(height: 5.h),
                  // NewRow(
                  //   text: 'Checkups'.tr,
                  //   icon: FontAwesomeIcons.check,
                  //   ontap: () {
                  //     state.cureentScreen.value = 6;
                  //     state.isDrawerOpen
                  //         ? logic.closeDrawer()
                  //         : logic.openDrawer();
                  //     // state.cureentScreen.value=0;
                  //   },
                  // ),
                  SizedBox(height: 5.h),
                  NewRow(
                    text: 'Management Requests'.tr,
                    icon: FontAwesomeIcons.building,
                    ontap: () {
                      state.cureentScreen.value = 7;
                      state.isDrawerOpen
                          ? logic.closeDrawer()
                          : logic.openDrawer();
                      // state.cureentScreen.value=0;
                    },
                  ),
                  SizedBox(height: 5.h),
                  NewRow(
                    text: 'Update Profile'.tr,
                    icon: FontAwesomeIcons.personBooth,
                    ontap: () {
                      state.cureentScreen.value = 8;
                      state.isDrawerOpen
                          ? logic.closeDrawer()
                          : logic.openDrawer();
                      // state.cureentScreen.value=0;
                    },
                  ),
                  SizedBox(height: 5.h),
                  NewRow(
                    text: 'Help'.tr,
                    icon: Icons.help,
                    ontap: () {
                      state.cureentScreen.value = 9;
                      state.isDrawerOpen
                          ? logic.closeDrawer()
                          : logic.openDrawer();
                      // state.cureentScreen.value=0;
                    },
                  ),
                  SizedBox(height: 5.h),
                  NewRow(
                    text: 'privacy policy'.tr,
                    icon: Icons.privacy_tip,
                    ontap: () {
                      state.cureentScreen.value = 10;
                      state.isDrawerOpen
                          ? logic.closeDrawer()
                          : logic.openDrawer();
                      // state.cureentScreen.value=0;
                    },
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  logic.deleteMyAcocount();
                },
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Remove My Account'.tr,
                      style: Get.textTheme.bodyText1!.copyWith(
                        color: Colors.red,
                        fontSize: 25.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      final Uri _url =
                          Uri.parse('https://www.facebook.com/eAJARcom/');

                      if (!await launchUrl(_url)) {
                        throw 'Could not launch $_url';
                      }
                    },
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.amber,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final Uri _url =
                          Uri.parse('https://www.facebook.com/eAJARcom/');
                      if (!await launchUrl(_url)) {
                        throw 'Could not launch $_url';
                      }
                    },
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.amber,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final Uri _url = Uri.parse(
                          'https://www.linkedin.com/company/eajarcom');
                      if (!await launchUrl(_url)) {
                        throw 'Could not launch $_url';
                      }
                    },
                    icon: Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.amber,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      String telephoneNumber = '+962797025927';
                      String telephoneUrl = "tel:$telephoneNumber";
                      if (await canLaunch(telephoneUrl)) {
                        await launch(telephoneUrl);
                      } else {
                        throw "Error occured trying to call that number.";
                      }
                    },
                    icon: Icon(
                      FontAwesomeIcons.phone,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  logic.logoutMethod();
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.logout_outlined,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                     'Log out'.tr,
                      style: Get.textTheme.bodyText1!.copyWith(
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback ontap;

  NewRow({
    Key? key,
    required this.icon,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: Colors.transparent,
        // width: .w,
        height: 70.h,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 10.w),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
