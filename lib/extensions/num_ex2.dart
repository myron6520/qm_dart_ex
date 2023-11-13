import 'package:flutter/material.dart';

extension NumEx2 on num {
  double get w =>
      this *
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width /
      375;
  double get sp => w;
}
