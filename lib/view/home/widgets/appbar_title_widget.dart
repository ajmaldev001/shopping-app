import 'package:flutter/material.dart';
import 'package:shopping_app/configs/color/colors.dart';
import 'package:shopping_app/configs/themes/theme_text.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'M',
            style: CustomThemeStyles.blackBold16.copyWith(color: AppColor.darkPink,fontSize: 28)
          ),
          TextSpan(
            text: 'oBoo',
            style: CustomThemeStyles.blackBold16.copyWith(color: AppColor.black,fontSize: 28)
          ),
          TextSpan(
            text: 'M',
            style: CustomThemeStyles.blackBold16.copyWith(color: AppColor.darkPink,fontSize: 28),
          )
        ],
      ),
    );
  }
}