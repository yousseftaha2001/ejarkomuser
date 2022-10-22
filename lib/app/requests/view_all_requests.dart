import 'package:ejarkom/app/requests/canceled_requests/canceled_requests_view.dart';
import 'package:ejarkom/app/requests/done_requests/done_requests_view.dart';
import 'package:ejarkom/app/requests/rejected_request/rejected_request_view.dart';
import 'package:ejarkom/app/requests/waiting_requests/waiting_requests_view.dart';
import 'package:ejarkom/utils/widgets/leading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class ViewAllRequests extends StatefulWidget {
  const ViewAllRequests({Key? key}) : super(key: key);

  @override
  State<ViewAllRequests> createState() => _ViewAllRequestsState();
}

class _ViewAllRequestsState extends State<ViewAllRequests>
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Requests'.tr,
          style: Get.textTheme.bodyText1!.copyWith(
            fontSize: 20.sp,
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
              text: 'Finished'.tr,
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
            fontSize: 14.sp,
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
          labelStyle: Get.textTheme.bodyText1!.copyWith(
            fontSize: 16.sp,
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
            WaitingRequestsView(),
            DoneRequestsView(),
            RejectedRequestView(),
            CanceledRequestsView(),
          ],
        ),
      ),
    );
  }
}
