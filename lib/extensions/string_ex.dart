import 'package:flutter/material.dart';

// enum StringType {
//   normal,
//   image,
//   font,
//   path,
// }

class StringWrap {
  final String string;
  final Widget Function(StringWrap)? builder;
  StringWrap(
    this.string, {
    this.builder,
  });
  Widget? get widget => builder?.call(this);
}

extension StringEx on String {
  Widget toText(
          {Key? key,
          Color color = const Color(0xff333333),
          double fontSize = 16,
          double? height = 1.4,
          TextAlign? textAlign,
          double? textScaleFactor,
          TextDecoration? decoration,
          int? maxLines,
          TextOverflow overflow = TextOverflow.ellipsis,
          FontWeight fontWeight = FontWeight.normal,
          String? fontFamily,
          TextStyle? style}) =>
      Text(
        this,
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        style: style ??
            TextStyle(
                decoration: decoration ?? TextDecoration.none,
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                height: height),
      );
  Widget toAssetImage({
    double? width,
    double? height,
    BoxFit? fit,
  }) =>
      Image.asset(
        this,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      );
  StringWrap toStringWrap({Widget Function(StringWrap)? builder}) =>
      StringWrap(this, builder: builder);
}
