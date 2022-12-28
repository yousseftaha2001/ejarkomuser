import 'package:ejarkom/company_app/CompanyHome/widgets/company_drawer.dart';
import 'package:ejarkom/company_app/CompanyHome/widgets/company_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class CompanyhomePage extends GetView<CompanyhomeController> {
  const CompanyhomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyhomeController>(
      init: CompanyhomeController(),
      builder: (_) {
        return Scaffold(
      body: Stack(
        children: [
          DrawerScreenCompany(),
          HomeScreenCompany(),
        ],
      ),
    );
      },
    );
  }
}
