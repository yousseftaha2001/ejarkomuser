import 'package:ejarkom/app/main/models/PageOneModel.dart';
import 'package:ejarkom/app/view_all/view_all_logic.dart';
import 'package:ejarkom/app/view_all/view_all_view.dart';
import 'package:get/get.dart';

import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();
  void changePageState() => state.pageIsHere.value = !state.pageIsHere.value;

  void getPage() async {
    changePageState();
    var result = await state.mainScreenHTTP.getAllPage();
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changePageState();
  }

  void pageDone(PageOneModel pageOneModel) {
    state.pageOneModel = pageOneModel;
  }

  void pageError(String e) {
    Get.snackbar('Error'.tr, e.toString());
  }

  void gotoAll(String id) {
    Get.put(ViewAllLogic(id: id.toString()),permanent: true);
    Get.to(() => ViewAllView());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPage();
  }
}
