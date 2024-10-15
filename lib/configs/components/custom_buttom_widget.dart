import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/configs/color/colors.dart';
import 'package:shopping_app/configs/themes/theme_text.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final double? fontSize;
  final String buttonText;
  final bool hasIcon;
  final IconData? icon;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? iconSize;
  final Color? iconColor;
  final double? borderRadius;
  final double? iconSpace;
  final double? buttonHeight;
  final BorderSide? buttonBorderColor;
  final double buttonWidth;


   const CustomButton({
    Key? key,
    required this.onPressed,
    this.fontSize,
    this.buttonText = '',
    this.hasIcon = false,
    this.icon,
    this.buttonColor,
    this.buttonTextColor,
    this.iconSize,
    this.iconColor,
    this.borderRadius,
    this.iconSpace,
    this.buttonHeight,
    this.buttonBorderColor,
    required this.buttonWidth
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? 5.r,
        ),
      ),
      minWidth: buttonWidth,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: MaterialButton(
        key: key,
        color: buttonColor,
        disabledColor: AppColor.grey,
        onPressed: onPressed,
        child: Ink(
          child: Container(
            alignment: Alignment.center,
            height: buttonHeight ?? ScreenUtil().screenHeight * 0.052,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: CustomThemeStyles.whiteTheme16,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}