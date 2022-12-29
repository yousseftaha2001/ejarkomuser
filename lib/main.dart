import 'package:device_preview/device_preview.dart';
import 'package:ejarkom/app/home/binding.dart';
import 'package:ejarkom/app/home/view.dart';
import 'package:ejarkom/app/login/binding.dart';
import 'package:ejarkom/app/login/view.dart';
import 'package:ejarkom/app/start_point/binding.dart';
import 'package:ejarkom/app/start_point/view.dart';
import 'package:ejarkom/utils/helper.dart';
import 'package:ejarkom/utils/langs/lang_sorage.dart';
import 'package:ejarkom/utils/langs/translation.dart';
import 'package:ejarkom/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:phone_form_field/l10n/generated/phone_field_localization.dart';

import 'utils/routes.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();
  await Firebase.initializeApp();
  // notificationInit();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FlutterNativeSplash.remove();
  // runApp( DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app
  // ));
  runApp(MyApp());
  
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          title: '',
          // color: Colors.white,
          locale: Locale(LanguageStorage.getLanguage()),
          fallbackLocale: const Locale('en'),
            
      
          // defaultTransition: Transition.cupertino,
          translations: Translation(),

          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialBinding: StartPointBinding(),
          // home: LoginPage(),

          getPages: [
            GetPage(
              name: startPointRoute,
              page: () => StartPointPage(),
            ),
            GetPage(
              name: homeRoute,
              page: () => HomePage(),
              binding: HomeBinding(),
            ),
            GetPage(
              name: loginRoute,
              page: () => LoginPage(),
              binding: LoginBinding(),
            ),
          ],
        );
      },
      designSize:  const Size(828, 1792),
    );
  }
}
