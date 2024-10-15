import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/configs/color/colors.dart';

abstract class Utils {

  static void showToast({
    required String message,
    Toast toastLength = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.CENTER,
    Color textColor = AppColor.black,
    Color backgroundColor = AppColor.mildGrey,
    double fontSize = 16.0,
    int timeInSecForIosWeb = 1,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      textColor: textColor,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
    );
  }

}