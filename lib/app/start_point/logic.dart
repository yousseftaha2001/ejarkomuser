import 'package:ejarkom/utils/my_database.dart';
import 'package:get/get.dart';

import 'state.dart';

class StartPointLogic extends GetxController {
  final StartPointState state = StartPointState();

  RxString token = ''.obs;

  checkToken() async {
    var result = MyDataBase.getToken();
    printInfo(info: result);

    token.value = result;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkToken();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  updateToken(String newToken) => token.value = newToken;
}
