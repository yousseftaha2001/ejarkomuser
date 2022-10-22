import 'package:ejarkom/app/services/create_services_ad/widgets/data_colelctor.dart';
import 'package:ejarkom/app/services/create_services_ad/widgets/info_collector.dart';
import 'package:ejarkom/app/services/create_services_ad/widgets/pandle_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'create_services_ad_logic.dart';
import 'create_services_ad_state.dart';

/// @description:
/// @author
/// @date: 2022-10-15 16:23:54
class CreateServicesAdPage extends StatefulWidget {
  CreateServicesAdPage({Key? key}) : super(key: key);

  @override
  State<CreateServicesAdPage> createState() => _CreateServicesAdPageState();
}

class _CreateServicesAdPageState extends State<CreateServicesAdPage> {
  final CreateServicesAdLogic logic = Get.put(CreateServicesAdLogic());

  final CreateServicesAdState state = Get.find<CreateServicesAdLogic>().state;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<CreateServicesAdLogic>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Services ad'.tr,
          style: Get.textTheme.bodyText1!.copyWith(
            color: Get.theme.primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.theme.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/images/newb.png'),
                fit: BoxFit.fitHeight),
          ),
          height: Get.height.h,
          child: PageView(
            controller: state.pageController,
            // pageSnapping: false,
            physics: NeverScrollableScrollPhysics(),
            children: [
              InfoCollector(),
              DataCollector(),
              PandelSelector(),
            ],
          ),
        ),
      ),
    );
  }
}
