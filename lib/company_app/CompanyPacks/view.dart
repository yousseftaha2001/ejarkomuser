import 'package:ejarkom/company_app/CompanyPacks/widgets/pack_company.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../CompanyHome/controller.dart';
import 'index.dart';

class CompanypacksPage extends GetView<CompanypacksController> {
  const CompanypacksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanypacksController>(
      init: CompanypacksController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Packages'.tr,
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
          body: Obx(() {
            return controller.state.pageState.value != 3
                ? const MyIndicator()
                : controller.state.pageState.value == 2
                    ? Center(
                        child: Text(
                          controller.state.error!,
                        ),
                      )
                    : controller.state.packsRequestModel!.pandleAds!.isEmpty
                        ? Center(
                            child: Text(
                              'No Packages Yet.'.tr,
                              style: Get.textTheme.bodyText1,
                            ),
                          )
                        : ListView.builder(
                            itemCount:
                                controller.state.packsRequestModel!.pandleAds!.length,
                            itemBuilder: (BuildContext context, int index) {
                              printInfo(info: controller.state.packsRequestModel!.pandleAds!.length.toString() );
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                    horizontal: 10.w),
                                child: PackWidgetCompany(
                                  photo: 'assets/images/pack.png',
                                  package: controller.state
                                      .packsRequestModel!.pandleAds![index]!,
                                ),
                              );
                            },
                          );
          }),
        );
      },
    );
  }
}
