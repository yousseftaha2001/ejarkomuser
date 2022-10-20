import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';

class CircularDialog extends StatelessWidget {
  const CircularDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyIndicator(),
        ],
      ),
    );
  }
}
