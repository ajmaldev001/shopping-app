import 'package:flutter/material.dart';
import 'package:shopping_app/configs/color/colors.dart';

class CustomThemeStyles {
  static TextStyle get redItalicBold18 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w800,
    color: AppColor.red,
  );

  static TextStyle get commonRobotoTheme => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    color: AppColor.white,
  );

  static TextStyle whiteBold24 = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );

  static  TextStyle get greyBold24 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColor.grey,
  );

  static  TextStyle get blackBold16 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  );

  static  TextStyle get blackTheme16 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    color: AppColor.black,
  );

  static  TextStyle get blackTheme12 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    color: AppColor.black,
  );

  static  TextStyle get whiteTheme16 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );

  static  TextStyle get whiteTheme14 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    color: AppColor.white,
  );

  static  TextStyle get blackTheme20 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColor.black,
  );

  static TextStyle get blueItalic20 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontStyle: FontStyle.italic,
    color: AppColor.blue,
  );
  
  static TextStyle copyWith({
    required TextStyle baseStyle,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) {
    return baseStyle.copyWith(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
