import 'package:flutter/material.dart';
import 'package:scout_app_v0/constants.dart';
import 'dart:math' as math;

import '../utils/logger.dart' show logger;
import '../utils/utilities.dart' show multiplyIfNotNull, addIfNotNull;

class SubTitleText extends StatelessWidget {
  final String text;

  const SubTitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
      ),
    );
  }
}

class TeleopWidgetText extends StatelessWidget {
  final String text;

  const TeleopWidgetText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28,
        color: AppColors.unselectedBtnBorderColor,
      ),
    );
  }
}
