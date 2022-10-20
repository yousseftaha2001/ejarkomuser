import 'package:ejarkom/app/view_all/view_all_logic.dart';
import 'package:ejarkom/app/view_all/view_all_state.dart';
import 'package:ejarkom/app/view_all/widgets/build_card_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NormalMode extends StatefulWidget {
  NormalMode({Key? key}) : super(key: key);

  @override
  State<NormalMode> createState() => _NormalModeState();
}

class _NormalModeState extends State<NormalMode> {
  final ViewAllLogic logic = Get.find<ViewAllLogic>();

  final ViewAllState state = Get.find<ViewAllLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: state.allBuildingsModel!.ads!.isEmpty
          ? Center(
              child: Text(
                'NO Ads yet'.tr,
                style: Get.textTheme.bodyText1,
              ),
            )
          : Wrap(
              alignment: WrapAlignment.start,
              children: List.generate(
                state.allBuildingsModel!.ads!.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 10.h,
                  ),
                  child: BuildingWidgetV(
                    ads: state.allBuildingsModel!.ads![index],
                  ),
                ),
              ),
            ),
    );
  }
}
