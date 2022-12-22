import 'package:get_storage/get_storage.dart';

class LanguageStorage {
  static void storeLang({required String lang}) async {
    await GetStorage().write('lang', lang);
  }

  static String getLanguage()  {
    var result = GetStorage().read('lang');
    return result ?? 'en';
  }
}
