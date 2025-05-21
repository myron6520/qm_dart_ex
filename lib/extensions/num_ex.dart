import 'package:flutter/material.dart';

extension NumEx on num {
  SizedBox get inRow => SizedBox(
        width: toDouble(),
      );
  SizedBox get inColumn => SizedBox(
        height: toDouble(),
      );
  Color get color => Color(toInt());
  String format(
      {int fractionDigits = 2,
      bool removeTrailingZeros = true,
      String separator = ','}) {
    String s = toStringAsFixed(fractionDigits);
    if (removeTrailingZeros) {
      while (s.endsWith("0") && s.contains(".")) {
        s = s.substring(0, s.length - 1);
      }
    }
    if (s.endsWith(".")) s = s.substring(0, s.length - 1);
    if (separator.isEmpty) return s;

    List<String> parts = s.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

    // 处理整数部分，每三位添加一个逗号
    String formattedInteger = '';
    int counter = 0;
    for (int i = integerPart.length - 1; i >= 0; i--) {
      if (counter == 3 && i != 0) {
        formattedInteger = separator + formattedInteger;
        counter = 0;
      }
      formattedInteger = integerPart[i] + formattedInteger;
      counter++;
    }

    return formattedInteger + decimalPart;
  }
}

extension DoubleEx on double {
  String awesome([int fractionDigits = 2]) {
    return format(fractionDigits: fractionDigits, separator: "");
    // String s = toStringAsFixed(fractionDigits);
    // while (s.endsWith("0") && s.contains(".")) {
    //   s = s.substring(0, s.length - 1);
    // }
    // if (s.endsWith(".")) s = s.substring(0, s.length - 1);
    // return s;
  }
}
