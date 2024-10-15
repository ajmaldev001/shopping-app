import 'package:flutter/material.dart';
import 'package:shopping_app/configs/color/colors.dart';
import 'package:shopping_app/configs/themes/theme_text.dart';

class CustomTextFeildWidget extends StatelessWidget {
  const CustomTextFeildWidget({super.key, 
  required this.onSuffixIconTapped, 
  required this.onChanged, 
  required this.controller});
  
  final VoidCallback onSuffixIconTapped;
  final void Function(String?) onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.black,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400]!
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: AppColor.mildGrey,
          ),
        ),
        hintText: 'What do you want to buy today?',
        hintStyle: CustomThemeStyles.blackTheme16.copyWith(color: AppColor.mildGrey),
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColor.lightGrey!
          )
        ),
        fillColor: Colors.white,
        filled: true,
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:  const BorderSide(
            color: AppColor.black
          )
        ),
        suffixIcon: InkWell(
          onTap: onSuffixIconTapped,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
            child: const Icon(Icons.search)
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}