import 'package:flutter/material.dart';

extension NumEx on num {
  SizedBox get inRow => SizedBox(
        width: toDouble(),
      );
  SizedBox get inColumn => SizedBox(
        height: toDouble(),
      );
  Color get color => Color(toInt());
}

extension DoubleEx on double {
  String awesome([int fractionDigits = 2]) {
    String s = toStringAsFixed(fractionDigits);
    while (s.endsWith("0") && s.contains(".")) {
      s = s.substring(0, s.length - 1);
    }
    if (s.endsWith(".")) s = s.substring(0, s.length - 1);
    return s;
  }
}
