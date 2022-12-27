import 'package:ejarkom/app/home/view.dart';
import 'package:ejarkom/app/login/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class StartPointPage extends StatefulWidget {
  @override
  State<StartPointPage> createState() => _StartPointPageState();
}

class _StartPointPageState extends State<StartPointPage> {
  final logic = Get.find<StartPointLogic>();

  final state = Get.find<StartPointLogic>().state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logic.checkToken();
  }

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    //   return logic.token.value == '' ? LoginPage() : HomePage();
    // });
    return LoginPage();
  }
}
