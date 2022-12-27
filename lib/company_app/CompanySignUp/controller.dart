import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import 'index.dart';

class CompanysignupController extends GetxController {
  CompanysignupController();

  final state = CompanysignupState();

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

   void getImage1() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      Uint8List uploadedfile = result.files.single.bytes!;
      state.photo.value = uploadedfile;
      update(['photo1']);
    } else {
      // state.photo.clear();
      // update(['photo']);
    }
  }

  void getImage3() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      Uint8List uploadedfile = result.files.single.bytes!;
      state.photo3.value = uploadedfile;
      update(['photo3']);
    } else {
      // state.photo.clear();
      // update(['photo']);
    }
  }

  void getImage2() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      Uint8List uploadedfile = result.files.single.bytes!;
      state.photo2.value = uploadedfile;
      update(['photo2']);
    } else {
      // state.photo.clear();
      // update(['photo']);
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
