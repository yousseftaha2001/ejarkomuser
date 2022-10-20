import 'package:ejarkom/app/home/logic.dart';
import 'package:ejarkom/app/home/state.dart';
import 'package:ejarkom/app/main/main_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  // MainLogic mainLogic = Get.find();
  HomeLogic homeLogic = Get.find();
  HomeState homeState = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GetBuilder<HomeLogic>(
          builder: (logic) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    // color: Colors.black,
                    icon: Icon(
                      homeState.isDrawerOpen
                          ? Icons.arrow_back_ios
                          : FontAwesomeIcons.list,
                      color: Get.theme.primaryColor,
                    ),
                    onPressed: () {
                      homeState.isDrawerOpen
                          ? homeLogic.closeDrawer()
                          : homeLogic.openDrawer();
                    },
                  ),
                ],
              ),
            );
          },
        ),
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 300.w,
            height: 40.h,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(5.sp),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Text(
                      'Search',
                      style: Get.textTheme.bodyText1,
                    ),
                    const Spacer(),
                    const Icon(Icons.search),
                  ],
                ),
              ),
            ),
          ),
        ),
        Icon(
          FontAwesomeIcons.heart,
          color: Colors.white,
        ),
      ],
    );
  }
}
