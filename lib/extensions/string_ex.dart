import 'package:flutter/material.dart';
import 'package:qm_dart_ex/qm_theme.dart';

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
  Widget toText({
    Key? key,
    Color? color,
    double? fontSize,
    double? height,
    TextAlign? textAlign,
    TextDecoration? decoration,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    String? fontFamily,
    TextStyle? style,
  }) =>
      Text(
        this,
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: style ??
            TextStyle(
              decoration: decoration,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              height: height ?? QMTheme.data.textHeight,
            ),
      );
  Widget toAssetImage({
    double? width,
    double? height,
    BoxFit? fit,
    String? package,
  }) =>
      Image.asset(
        this,
        package: package,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      );
  StringWrap toStringWrap({Widget Function(StringWrap)? builder}) =>
      StringWrap(this, builder: builder);
  Widget toRichText({
    Key? key,
    Color? color,
    double? fontSize,
    double? height,
    bool softWrap = false,
    TextAlign textAlign = TextAlign.start,
    TextDecoration? decoration,
    int? maxLines,
    textScaler: TextScaler.noScaling,
    TextOverflow overflow = TextOverflow.visible,
    FontWeight? fontWeight,
    String? fontFamily,
    TextStyle? style,
  }) =>
      RichText(
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        textScaler: textScaler,
        text: TextSpan(
          text: this,
          style: style ??
              TextStyle(
                decoration: decoration,
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                height: height ?? QMTheme.data.textHeight,
              ),
        ),
      );
}
