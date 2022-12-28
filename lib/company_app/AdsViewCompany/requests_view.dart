import 'package:ejarkom/company_app/AdsViewCompany/controller.dart';
import 'package:ejarkom/company_app/AdsViewCompany/widgets/actions_dialog.dart';
import 'package:ejarkom/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdsRequestsViewCompany extends StatelessWidget {
   AdsRequestsViewCompany({super.key});
   final controller=Get.find<AdsviewcompanyController>();
   final state=Get.find<AdsviewcompanyController>().state;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Requests'.tr,style: Get.textTheme.bodyText1,),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,color: Get.theme.primaryColor,),
      ),),
      body:state.requests.isEmpty
        ?  Center(
            child: Text(
              'No requests Yet'.tr,
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: ListView.builder(
                itemCount: state.requests.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Container(
                      // height: 200.h,
                      width: Get.width.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.2),
                        ),
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
                                // ElevatedButton(
                                //   onPressed: () {
                                //     Get.dialog(
                                //       CheckDialog(),
                                //       barrierDismissible: false,
                                //     );
                                //   },
                                //   child: Text(
                                //     'Check '.tr,
                                //   ),
                                // ),
                                getState(
                                    s: state
                                        .requests[index]!.reqestStatus!),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                               CircleAvatar(
                                radius: 80.sp,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                  state.requests[index]!.photo!
                                ),
                               ),
                              SizedBox(width: 20.w),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    
                                    SizedBox(width: 10.w),
                                    Text(
                                      state.requests[index]!.name!,
                                      style: Get.textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                         state.requests[index]!.reqestStatus== 'Accept' || state.requests[index]!.reqestStatus == 'Accepted' ? Column(
                            children: [
                               Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Phone:'.tr,
                                  style:
                                      Get.textTheme.bodyText1!.copyWith(
                                    fontSize: 30.sp,
                                  ),
                                ),
                                Text(
                                  state.requests[index]!.phone!,
                                  style: Get.textTheme.bodyText1,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'E-mail:'.tr,
                                  style:
                                      Get.textTheme.bodyText1!.copyWith(
                                    fontSize: 30.sp,
                                  ),
                                ),
                                Text(
                                  state.requests[index]!.email!,
                                  style: Get.textTheme.bodyText1,
                                ),
                              ],
                            ),
                            ],
                           ):Center(),
                            SizedBox(height: 10.h),
                            SizedBox(height: 10.h),
                            state.requests[index]!.reqestStatus ==
                                    'Waiting'
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                           if (Get.isSnackbarOpen) {
                                            // print(Get.isSnackbarOpen);
                                            Get.back();
                                            
                                          }
                                          Get.dialog(
                                            MyActionDialogCompany(
                                              type: 'reject',
                                              id: state.requests[index]!
                                                  .reqestId!
                                                  .toString(),
                                            ),
                                            barrierDismissible: false,
                                          );
                                        },
                                        child: Text(
                                          'Reject'.tr,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // logic.actionDialog(type: 'Accept');
                                          if (Get.isSnackbarOpen) {
                                            // print(Get.isSnackbarOpen);
                                            Get.back();
                                            
                                          }
                                          Get.dialog(
                                              MyActionDialogCompany(
                                                type: 'Accept',
                                                id: state.requests[index]!
                                                    .reqestId!
                                                    .toString(),
                                              ),
                                              barrierDismissible: false,
                                            );
                                          // Get.dialog(
                                          //   MyActionDialog(
                                          //     type: 'Accept',
                                          //     id: state.requests[index]!
                                          //         .reqestId!
                                          //         .toString(),
                                          //   ),
                                          //   barrierDismissible: false,
                                          // );
                                        },
                                        child: Text(
                                          'Accept'.tr,
                                        ),
                                      ),
                                    ],
                                  )
                                : Center(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ) ,
    );
  }
}