import 'package:flutter/material.dart';

extension ListEx on List<Widget> {
  Widget toRow(
          {Key? key,
          MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
          MainAxisSize mainAxisSize = MainAxisSize.max,
          bool reversed = false}) =>
      Row(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: reversed ? this.reversed.toList() : this,
      );
  Widget toColumn(
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
          MainAxisSize mainAxisSize = MainAxisSize.max,
          bool reversed = false}) =>
      Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: reversed ? this.reversed.toList() : this,
      );
  Widget toStack({StackFit fit = StackFit.loose, bool reversed = false}) =>
      Stack(
        fit: fit,
        children: reversed ? this.reversed.toList() : this,
      );
}
