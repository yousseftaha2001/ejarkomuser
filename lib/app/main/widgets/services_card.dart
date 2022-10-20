import 'package:ejarkom/app/main/main_logic.dart';
import 'package:ejarkom/app/services/view_service/view_service_logic.dart';
import 'package:ejarkom/app/services/view_service/view_service_view.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServicesContainer extends StatelessWidget {
  ServicesContainer({Key? key, required this.index}) : super(key: key);
  final int index;

  MainLogic logic = Get.find<MainLogic>();
  final state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.put(
          ViewServiceLogic(
            id: state.pageOneModel!.services![index].id!.toString(),
          ),
        );
        Get.to(() => ViewServiceView());
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            elevation: 10.sp,
            borderRadius: BorderRadius.circular(8.sp),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: state.pageOneModel!.services![index].photo!.isEmpty
                    ? Container(
                        width: 120.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                      )
                    : Image.network(
                        '$photoAPI${state.pageOneModel!.services![index].photo!}',
                        height: 70.h,
                        width: 120.w,
                      ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            state.pageOneModel!.services![index].nameE!,
            style: Get.textTheme.bodyText1!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          )
        ],
      ),
    );
  }
}
