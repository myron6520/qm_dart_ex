import 'package:flutter/material.dart';

class QMTheme {
  static QMTheme data = QMTheme();
  final double? textHeight;
  final Color? highlightColor;
  final double highlightOpacity;

  QMTheme({
    this.textHeight,
    this.highlightColor,
    this.highlightOpacity = 0.7,
  });
}
