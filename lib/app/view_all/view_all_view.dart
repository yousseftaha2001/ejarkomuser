/// Generated by Flutter GetX Starter on 2022-10-08 18:12
import 'package:ejarkom/app/main/widgets/build_card.dart';
import 'package:ejarkom/app/main/widgets/main_cate.dart';
import 'package:ejarkom/app/main/widgets/search_bar.dart';
import 'package:ejarkom/app/view_all/widgets/build_card_v.dart';
import 'package:ejarkom/app/view_all/widgets/city_selector.dart';
import 'package:ejarkom/app/view_all/widgets/normal_mode.dart';
import 'package:ejarkom/app/view_all/widgets/search_con.dart';
import 'package:ejarkom/app/view_all/widgets/search_mode.dart';
import 'package:ejarkom/app/view_all/widgets/zone_selector.dart';
import 'package:ejarkom/utils/widgets/leading_button.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'view_all_logic.dart';
import 'view_all_state.dart';

class ViewAllView extends StatefulWidget {
  @override
  State<ViewAllView> createState() => _ViewAllViewState();
}

class _ViewAllViewState extends State<ViewAllView> {
  final ViewAllLogic logic = Get.find<ViewAllLogic>();

  final ViewAllState state = Get.find<ViewAllLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
              Get.delete<ViewAllLogic>();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Get.theme.primaryColor,
            ),
          ),
          title: Text(
            'All Ads'.tr,
            style: Get.textTheme.bodyText1!.copyWith(
              fontSize: 40.sp,
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Get.dialog(SearchCont());
                // logic.changeSearchMode();
              },
              icon: Icon(
                Icons.filter_list,
                color: Get.theme.primaryColor,
              ),
            ),
            Obx(
              () => state.searchMode.value
                  ? IconButton(
                      onPressed: () {
                        logic.closeSearch();
                        // logic.changeSearchMode();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Get.theme.primaryColor,
                      ),
                    )
                  : Container(),
            )
          ],
        ),
        body: state.getState.value
            ? MyIndicator()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/images/newb.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      height: (Get.height) - (AppBar().preferredSize.height),
                      child: Obx(() {
                        return state.searchMode.value
                            ? SearchMode()
                            : NormalMode();
                      }),
                    ),
                  ],
                ),
              ),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    state.searchMode.value = false;
  }
}
