import 'package:ejarkom/app/main/models/PageOneModel.dart';
import 'package:ejarkom/utils/http_manager/main_screen_http.dart';
import 'package:get/get.dart';

class MainState {
  MainState() {
    mainScreenHTTP = MainScreenHTTP();
  }
  RxBool pageIsHere = false.obs;
  PageOneModel? pageOneModel;
  late MainScreenHTTP mainScreenHTTP;
}
