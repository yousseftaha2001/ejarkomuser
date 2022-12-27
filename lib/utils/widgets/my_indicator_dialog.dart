import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';

class MyIndicatorDialog extends StatelessWidget {
  const MyIndicatorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [MyIndicator()],
      ),
    );
  }
}
