import 'package:flutter/material.dart';
import 'bool_ex.dart';

extension WidgetEx on Widget {
  Widget onClick(void Function() click) => GestureDetector(
        child: this,
        behavior: HitTestBehavior.opaque,
        onTap: click,
      );
  Widget toCenter() => Center(
        child: this,
      );
  Widget toAlign({AlignmentGeometry alignment = Alignment.center}) => Align(
        alignment: alignment,
        child: this,
      );
  Widget toPositioned({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) =>
      Positioned(
        key: key,
        child: this,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      );
  Widget toPositionedFill({Key? key}) => Positioned.fill(child: this, key: key);
  Widget toRow(
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
          MainAxisSize mainAxisSize = MainAxisSize.max}) =>
      Row(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [this],
      );
  Widget toColumn(
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
          MainAxisSize mainAxisSize = MainAxisSize.max}) =>
      Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [this],
      );
  Widget toSafe(
          {bool left = true,
          bool top = true,
          bool right = true,
          bool bottom = true}) =>
      SafeArea(child: this, left: left, right: right, top: top, bottom: bottom);
  Widget toScrollView(
          {Axis scrollDirection = Axis.vertical,
          Clip clipBehavior = Clip.hardEdge,
          ScrollPhysics? physics}) =>
      SingleChildScrollView(
        physics: physics,
        scrollDirection: scrollDirection,
        clipBehavior: clipBehavior,
        child: this,
      );
  Widget applyUnconstrainedBox() => UnconstrainedBox(child: this);
  Widget applyPadding(EdgeInsets padding) =>
      Padding(padding: padding, child: this);
  Widget applyBackground(
          {Key? key,
          Color? color,
          double? width,
          double? height,
          BoxConstraints? constraints,
          EdgeInsets? padding,
          EdgeInsets? margin,
          AlignmentGeometry? alignment,
          Clip clipBehavior = Clip.none,
          BoxDecoration? decoration}) =>
      Container(
        key: key,
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        clipBehavior: clipBehavior,
        constraints: constraints,
        color: decoration == null ? color : null,
        child: this,
        alignment: alignment,
        decoration: decoration,
      );
  Widget applyRadius(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );
  Widget applyOpacity(double opacity) => Opacity(
        opacity: opacity,
        child: this,
      );
  Widget applyTip(String tip) => Tooltip(message: tip, child: this);
  Widget get expanded => Expanded(child: this);
  Widget toExpanded({int flex = 1}) => Expanded(child: this, flex: flex);
  Widget get flexible => Flexible(child: this);
  Widget willPopScope(Future<bool> Function() onWillPop) =>
      WillPopScope(child: this, onWillPop: onWillPop);
  Widget applyCondition(bool condition,
          {Widget? falseWidget, Widget Function()? falseBuilder}) =>
      condition.toWidget(() => this,
          falseWidget: falseWidget, falseBuilder: falseBuilder);
}
