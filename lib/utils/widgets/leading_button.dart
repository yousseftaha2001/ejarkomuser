import 'package:ejarkom/app/home/logic.dart';
import 'package:ejarkom/company_app/CompanyHome/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
      builder: (logic) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                logic.state.isDrawerOpen
                    ? Icons.arrow_back_ios
                    : FontAwesomeIcons.list,
                color: Get.theme.primaryColor,
              ),
              onPressed: () {
                logic.state.isDrawerOpen
                    ? logic.closeDrawer()
                    : logic.openDrawer();
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
class LeadingButton2 extends StatelessWidget {
  const LeadingButton2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyhomeController>(
      builder: (logic) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                logic.state.isDrawerOpen
                    ? Icons.arrow_back_ios
                    : FontAwesomeIcons.list,
                color: Get.theme.primaryColor,
              ),
              onPressed: () {
                logic.state.isDrawerOpen
                    ? logic.closeDrawer()
                    : logic.openDrawer();
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
