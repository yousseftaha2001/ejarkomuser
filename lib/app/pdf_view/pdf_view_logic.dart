import 'package:get/get.dart';

import 'pdf_view_state.dart';

/// @description:
/// @author
/// @date: 2022-10-21 01:52:20
class PdfViewLogic extends GetxController {
  final state = PdfViewState();

  void changePageState() => state.getPdf.value = !state.getPdf.value;

  void getPage() async {
    changePageState();
    var result = await state.mainScreenHTTP.getHelp();
    result.fold((l) => pageError(l), (r) => pageDone(r));
    changePageState();
  }

  void pageDone(String pageOneModel) {
    if (pageOneModel != 'link') {
      state.url = pageOneModel;
    } else {
      state.url = 'http://africau.edu/images/default/sample.pdf';
    }
  }

  void pageError(String e) {
    Get.snackbar('Error'.tr, e.toString());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPage();
  }
}
