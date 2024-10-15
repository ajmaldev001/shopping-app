import 'package:flutter/material.dart';
import 'package:shopping_app/configs/color/colors.dart';
import 'package:shopping_app/configs/themes/theme_text.dart';


class ShoppingCard extends StatelessWidget {
  const ShoppingCard({
  super.key, 
  required this.imageUrl, 
  required this.itemName, 
  required this.descriptiontext, 
  required this.price, 
  required this.iconLength});
  
  final String imageUrl;
  final String itemName;
  final String descriptiontext;
  final String price;
  final int iconLength;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: AppColor.white,
      surfaceTintColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                ),
                child: 
                imageUrl.isNotEmpty
                ? 
                Image.network(
                  imageUrl.replaceAll('[', '').replaceAll(']', ''),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.medium,
                  errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/no_image.jpg',fit: BoxFit.cover,),
                )
                : Image.asset('assets/images/no_image.jpg',fit: BoxFit.cover,),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  height: 24,
                  width: 24,
                  padding: const EdgeInsets.all(6.0),
                  color: AppColor.black.withOpacity(0.5),
                  child: Center(child: Image.asset('assets/images/like.png')),
                ))
            ],
          ),
          // Text and info section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item name
                Text(
                  itemName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemeStyles.blackTheme12.copyWith(fontWeight: FontWeight.w700)
                ),
                const SizedBox(height: 6.0),
                // Item description, restricted to 2 lines
                Text(
                  descriptiontext,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemeStyles.blackTheme12.copyWith(color: Colors.grey[600],fontSize: 10)
                ),
                const SizedBox(height: 4.0),
                // Price and Rating row
                 Text(
                  '\$$price',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemeStyles.blackTheme12.copyWith(fontSize: 10,fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 4.0),
                // Rating
                Row(
                  children: List.generate(iconLength, (index) {
                    return Icon(
                      Icons.star,
                      color: AppColor.yellow,
                      size: 12,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
