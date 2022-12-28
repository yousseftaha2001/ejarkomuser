import 'package:ejarkom/company_app/CompanyData/add_data.dart';
import 'package:ejarkom/company_app/CompanyHome/controller.dart';
import 'package:ejarkom/utils/helper.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/apis.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class CompanydataPage extends GetView<CompanydataController> {
  const CompanydataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanydataController>(
      init: CompanydataController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Informations'.tr,
              style: Get.theme.textTheme.bodyText1!.copyWith(
                color: Get.theme.primaryColor,
              ),
            ),
            leading: GetBuilder<CompanyhomeController>(
              builder: (logic) {
                return Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          logic.state.isDrawerOpen
                              ? Icons.arrow_back_ios
                              : FontAwesomeIcons.list,
                          color: Get.theme.primaryColor,
                        ),
                        onPressed: () {
                          logic.state.isDrawerOpen
                              ? logic.closeDrawer()
                              : logic.openDrawer();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => AddDataCompany());
            },
            backgroundColor: Colors.amber,
            child: Icon(Icons.add),
          ),
          body: Obx(() {
            return controller.state.pageState.value != 3
                ? const MyIndicator()
                : controller.state.pageState.value == 2
                    ? Center(
                        child: Text(
                          controller.state.error!,
                        ),
                      )
                    : Container(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/images/newb.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          height: Get.height,
                          child: Center(
                            child: controller
                                    .state.myDataRequest!.myData!.isEmpty
                                ? Text('No Data Yet'.tr)
                                : GetBuilder<CompanydataController>(
                                    builder: (logic) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20.w,
                                          vertical: 10.h,
                                        ),
                                        child: ListView.builder(
                                          itemCount: controller.state
                                              .myDataRequest!.myData!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h),
                                              child: Container(
                                                // height: 200.h,
                                                width: Get.width.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.sp),
                                                  border: Border.all(
                                                    color:
                                                        Colors.grey.withOpacity(
                                                      0.3,
                                                    ),
                                                  ),
                                                  color: Colors.white70,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                    vertical: 10.h,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Image.network(
                                                            '$photoAPI${controller.state.myDataRequest!.myData![index]!.photo1!}',
                                                            // 'http://cdn.shopify.com/s/files/1/1060/0108/articles/POA_Card.png?v=1597336214',
                                                            height: 300.h,
                                                            width: 300.h,
                                                            scale: 1.sp,
                                                          ),
                                                          Image.network(
                                                            '$photoAPI${controller.state.myDataRequest!.myData![index]!.photo2!}',
                                                            // 'http://cdn.shopify.com/s/files/1/1060/0108/articles/POA_Card.png?v=1597336214',
                                                            height: 300.h,
                                                            width: 300.h,
                                                            scale: 1.sp,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              controller
                                                                  .state
                                                                  .myDataRequest!
                                                                  .myData![
                                                                      index]!
                                                                  .address!,
                                                              style: Get
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                fontSize: 35.sp,
                                                              ),
                                                              softWrap: true,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            dateParser(
                                                              controller
                                                                  .state
                                                                  .myDataRequest!
                                                                  .myData![
                                                                      index]!
                                                                  .createdAt!
                                                                  .toString(),
                                                            ),
                                                            style: Get.textTheme
                                                                .bodyText1!
                                                                .copyWith(
                                                              fontSize: 30.sp,
                                                            ),
                                                          ),
                                                          getState(
                                                              s: controller
                                                                  .state
                                                                  .myDataRequest!
                                                                  .myData![
                                                                      index]!
                                                                  .stute!),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                      );
          }),
        );
      },
    );
  }

  String dateParser(String date) =>
      DateFormat('yyyy-MM-dd – h:mm a').format(DateTime.parse(date));
}
