import 'package:ejarkom/company_app/CraeteAdsCompany/view.dart';
import 'package:ejarkom/company_app/MyAdsCompany/widgets/CancledAdsCompany/view.dart';
import 'package:ejarkom/company_app/MyAdsCompany/widgets/FinishedAdsCompany/view.dart';
import 'package:ejarkom/company_app/MyAdsCompany/widgets/ReadyAdsCompany/view.dart';
import 'package:ejarkom/company_app/MyAdsCompany/widgets/WaitingAdsCompany/view.dart';
import 'package:ejarkom/utils/langs/lang_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/widgets/leading_button.dart';
import '../CraeteAdsCompany/bindings.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class MyadscompanyPage extends GetView<MyadscompanyController> {
  const MyadscompanyPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyadscompanyController>(
      init: MyadscompanyController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: const LeadingButton2(),
            title: Text(
              'ADS'.tr,
              style: Get.textTheme.bodyText1!.copyWith(
                fontSize: 40.sp,
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              GetBuilder<LanguageController>(
                  init: LanguageController(),
                  builder: (logic) {
                    return IconButton(
                      onPressed: () {
                        // controller.logout();
                        logic.appLang == 'ar'
                            ? logic.changeLang(langCode: 'en')
                            : logic.changeLang(langCode: 'ar');
                      },
                      icon: Icon(
                        Icons.language,
                        color: Colors.black,
                      ),
                    );
                  }),
            ],
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              controller: controller.state.tabController,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.timer),
                  text: 'Waiting'.tr,
                ),
                Tab(
                  icon: Icon(Icons.done),
                  text: 'Active'.tr,
                ),
                Tab(
                  icon: Icon(Icons.done_all),
                  text: 'Finished'.tr,
                ),
                Tab(
                  icon: Icon(Icons.cancel),
                  text: 'Canceld Or Rejected'.tr,
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 4.sp,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.amber,
              indicatorColor: Colors.amber,
              unselectedLabelStyle: Get.textTheme.bodyText1!.copyWith(
                fontSize: 25.sp,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              labelStyle: Get.textTheme.bodyText1!.copyWith(
                fontSize: 30.sp,
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(
                () => CraeteadscompanyPage(),
                binding: CraeteadscompanyBinding(),
              );
            },
            child: Icon(
              Icons.add,
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/newb.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            height: Get.height,
            child: TabBarView(
              controller: controller.state.tabController,
              children: const [
                WaitingadscompanyPage(),
                ReadyadscompanyPage(),
                FinishedadscompanyPage(),
                CancledadscompanyPage(),
              ],
            ),
          ),
        );
      },
    );
  }
}
