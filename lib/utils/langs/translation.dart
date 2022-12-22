import 'package:get/get.dart';

import 'lans/en.dart';
import 'lans/ar.dart';

class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar,
  };
}
