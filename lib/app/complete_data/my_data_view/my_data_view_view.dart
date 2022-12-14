/// Generated by Flutter GetX Starter on 2022-10-16 04:58
import 'package:ejarkom/app/complete_data/complete_data_view.dart';
import 'package:ejarkom/app/home/logic.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'my_data_view_logic.dart';
import 'my_data_view_state.dart';

class MyDataViewView extends StatefulWidget {
  @override
  _MyDataViewViewState createState() => _MyDataViewViewState();
}

class _MyDataViewViewState extends State<MyDataViewView> {
  final MyDataViewLogic logic = Get.put(MyDataViewLogic());
  final MyDataViewState state = Get.find<MyDataViewLogic>().state;

  @override
  void dispose() {
    Get.delete<MyDataViewLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          leading: GetBuilder<HomeLogic>(
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
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CompleteDataView());
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
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
        child: Center(
          child: Obx(
            () => state.getState.value
                ? MyIndicator()
                : state.myData.isEmpty
                    ? Text('No Data Yet'.tr,style: Get.textTheme.bodyText1,)
                    : GetBuilder<MyDataViewLogic>(builder: (logic) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          child: ListView.builder(
                            itemCount: state.myData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Container(
                                  // height: 200.h,
                                  width: Get.width.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.network(
                                              '$photoAPI${state.myData[index].photo1!}',
                                              // 'http://cdn.shopify.com/s/files/1/1060/0108/articles/POA_Card.png?v=1597336214',
                                              height: 300.h,
                                              width: 300.h,
                                              scale: 1.sp,
                                            ),
                                            Image.network(
                                              '$photoAPI${state.myData[index].photo2!}',
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            
                                            Text(
                                              state.myData[index].dob!,
                                              style: Get.textTheme.bodyText1!.copyWith(
                                                  fontSize: 35.sp,
                                                ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            
                                            Expanded(
                                             
                                              child: Text(
                                                state.myData[index].address!,
                                                style: Get.textTheme.bodyText1!.copyWith(
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              logic.dateParser(
                                                state.myData[index].createdAt!,
                                              ),
                                              style: Get.textTheme.bodyText1!
                                                  .copyWith(
                                                fontSize: 30.sp,
                                              ),
                                            ),
                                            getState(
                                                s: state.myData[index].stute!),
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
                      }),
          ),
        ),
      ),
    );
  }

  Widget getState({required String s}) {
    print(s);
    if (s == 'Waiting') {
      return Container(
         height: 80.h,
        width: 250.w,
        decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8.sp)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Waiting....'.tr,
                style: Get.theme.textTheme.bodyText1!.copyWith(
                  color: Colors.black38,
                  fontSize: 30.sp,
                ),
              ),
              const Icon(
                Icons.timer,
                color: Colors.black38,
              )
            ],
          ),
        ),
      );
    } else if (s == 'Accepted') {
      return Container(
        height: 80.h,
        width: 250.w,
        decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8.sp)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Accepted'.tr,
                style: Get.theme.textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontSize: 30.sp,
                ),
              ),
              Icon(
                Icons.check,
                color: Colors.white,
              )
            ],
          ),
        ),
      );
    } else {
      return Container(
         height: 80.h,
        width: 250.w,
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8.sp)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rejected'.tr,
                style: Get.theme.textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontSize: 30.sp,
                ),
              ),
              Icon(
                Icons.close,
                color: Colors.white,
              )
            ],
          ),
        ),
      );
    }
  }
}
