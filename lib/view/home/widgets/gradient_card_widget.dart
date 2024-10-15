import 'package:flutter/material.dart';
import 'package:shopping_app/configs/color/colors.dart';
import 'package:shopping_app/configs/themes/theme_text.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: [
            AppColor.darkGrey, 
            AppColor.brown,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Products offer',
            style: CustomThemeStyles.whiteTheme16.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 8.0),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: 'Slash Sales begins in April. Get up to 80% Discount on all products ',
                  style: CustomThemeStyles.whiteTheme14.copyWith(height: 1.5,color: AppColor.white.withOpacity(0.8))
                ),
                const WidgetSpan(child: SizedBox(width: 2)),
                TextSpan(
                  text: 'Read More',
                  style: CustomThemeStyles.whiteTheme16.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
