import 'package:ejarkom/app/services/componant/canceled_services/canceled_services_view.dart';
import 'package:ejarkom/app/services/componant/done_services/done_services_view.dart';
import 'package:ejarkom/app/services/componant/finished_services/finished_services_view.dart';
import 'package:ejarkom/app/services/componant/waiting_service_ads/waiting_service_ads_view.dart';
import 'package:ejarkom/utils/widgets/leading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class ViewAllMyServices extends StatefulWidget {
  const ViewAllMyServices({Key? key}) : super(key: key);

  @override
  State<ViewAllMyServices> createState() => _ViewAllMyServicesState();
}

class _ViewAllMyServicesState extends State<ViewAllMyServices>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Services ADs'.tr,
          style: Get.textTheme.bodyText1!.copyWith(
            fontSize: 40.sp,
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.timer),
              text: 'Waitting'.tr,
            ),
            Tab(
              icon: Icon(Icons.done_all),
              text: 'Accepted'.tr,
            ),
            Tab(
              icon: Icon(Icons.cancel),
              text: 'Rejected'.tr,
            ),
            Tab(
              icon: Icon(Icons.cancel),
              text: 'Canceled'.tr,
            ),
          ],
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 4.sp,
          labelColor: Get.theme.primaryColor,
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: Get.textTheme.bodyText1!.copyWith(
            fontSize: 25.sp,
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
          labelStyle: Get.textTheme.bodyText1!.copyWith(
            fontSize: 28.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
          controller: _tabController,
          children: [
            WaitingServiceAdsView(),
            FinishedServicesView(),
            DoneServicesView(),
            CanceledServicesView(),
            // WaitingRequestsView(),
            // DoneRequestsView(),
            // RejectedRequestView(),
            // CanceledRequestsView(),
          ],
        ),
      ),
    );
  }
}
