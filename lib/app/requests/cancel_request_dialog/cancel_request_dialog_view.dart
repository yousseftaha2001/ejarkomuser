/// Generated by Flutter GetX Starter on 2022-10-14 23:34
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'cancel_request_dialog_logic.dart';
import 'cancel_request_dialog_state.dart';

class CancelRequestDialogView extends StatefulWidget {
  String? id;

  CancelRequestDialogView({this.id});

  @override
  _CancelRequestDialogViewState createState() =>
      _CancelRequestDialogViewState();
}

class _CancelRequestDialogViewState extends State<CancelRequestDialogView> {
  final CancelRequestDialogLogic logic = Get.put(CancelRequestDialogLogic());
  final CancelRequestDialogState state =
      Get.find<CancelRequestDialogLogic>().state;

  @override
  void dispose() {
    Get.delete<CancelRequestDialogLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        title: Row(
          children: [
            IconButton(
              onPressed: state.cancelState.value
                  ? null
                  : () {
                      Get.back();
                    },
              icon: const Icon(Icons.close),
            )
          ],
        ),
        content: state.cancelState.value
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  MyIndicator(),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Are you sure to cancel this Request?'.tr,
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(height: 15.h),
                  ElevatedButton(
                    onPressed: () {
                      logic.cancelAd(id: widget.id!);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(Get.width / 2.w, 40.h)),
                    child: Text(
                      'Yes'.tr,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
