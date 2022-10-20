import 'package:ejarkom/app/home/binding.dart';
import 'package:ejarkom/app/home/view.dart';
import 'package:ejarkom/app/login/binding.dart';
import 'package:ejarkom/app/login/view.dart';
import 'package:ejarkom/app/start_point/binding.dart';
import 'package:ejarkom/app/start_point/view.dart';
import 'package:ejarkom/utils/helper.dart';
import 'package:ejarkom/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class POINT extends StatelessWidget {
  const POINT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: webHelper(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Ejarkom Admin',

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
      designSize: const Size(428, 926),
    );
  }
}
