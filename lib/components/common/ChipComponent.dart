import 'dart:math';

import 'package:flutter/material.dart';
import '../../utils/constants.dart' as Constants;

/* Chip custom color */
class CustomColor {
  final int color;
  final int bgColor;

  CustomColor(this.color, this.bgColor);
}

/* Chip component with random color generator */
class ChipComponent extends StatelessWidget {
  final String label;
  final String size; // medium | small

  static final colorsList = [
    CustomColor(Constants.ACCENT_COLOR, Constants.ACCENT_LIGHT_COLOR),
    CustomColor(Constants.DANGER_COLOR, Constants.DANGER_LIGHT_COLOR),
    CustomColor(Constants.INFO_COLOR, Constants.INFO_LIGHT_COLOR),
    CustomColor(Constants.SUCCESS_COLOR, Constants.SUCCESS_LIGHT_COLOR),
    CustomColor(Constants.WARNING_COLOR, Constants.WARNING_LIGHT_COLOR)
  ];

  ChipComponent({required this.label, this.size = 'medium'});

  CustomColor getChipColor() {
    var index = Random().nextInt(colorsList.length);
    return colorsList[index];
  }

  @override
  Widget build(BuildContext context) {
    var randomColor = getChipColor();
    var density = const VisualDensity(vertical: 0);
    if (size == 'small') density = const VisualDensity(vertical: -4);
    double fSize = 13;
    if (size == 'small') fSize = 12;

    return Chip(
        visualDensity: density,
        label: Text(label),
        labelStyle: TextStyle(
            fontSize: fSize,
            fontWeight: FontWeight.bold,
            color: Color(randomColor.color)),
        backgroundColor: Color(randomColor.bgColor));
  }
}
