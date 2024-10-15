import 'package:flutter/material.dart';
import 'package:shopping_app/configs/color/colors.dart';
import 'package:shopping_app/configs/themes/theme_text.dart';

class CustomDropdownButton extends StatefulWidget {
  final Function(String?) onChanged;
  final List<dynamic>? items;
  final  String? selectedItem;
  final String hintText;
  final double menuHeight;
  const CustomDropdownButton({
    this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.hintText,
    required this.menuHeight,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String selectedItem = '';

  @override
  void initState() {
     super.initState();
     setState(() {
      selectedItem = widget.selectedItem ?? '';
     });
  }

  @override
  void didUpdateWidget(covariant CustomDropdownButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedItem != selectedItem) {
      setState(() {
        selectedItem = widget.selectedItem ?? '';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final uniqueItems = widget.items?.toSet().toList() ?? [];
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0),borderSide: const BorderSide(color: AppColor.mildGrey)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0),borderSide: const BorderSide(color: AppColor.mildGrey))
      ),
      child: DropdownButtonFormField<String>(
        menuMaxHeight: widget.menuHeight,
        dropdownColor: AppColor.white,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: selectedItem.isNotEmpty && uniqueItems.contains(selectedItem) ? selectedItem : null,
        hint: Text(
          widget.hintText,
          style: CustomThemeStyles.blackTheme16.copyWith(color: AppColor.midGrey),
        ),
        icon: const Icon(Icons.keyboard_arrow_down_sharp),
        items: uniqueItems
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: SizedBox(
                  child: Column(
                    children: [
                      Text(
                        item[0].toUpperCase() + item.substring(1),
                        style: CustomThemeStyles.blackTheme16,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: ((item) {
          setState(() {
            selectedItem = item!;
          });
          widget.onChanged(item);
        }
        ),
      ),
    );
  }
}