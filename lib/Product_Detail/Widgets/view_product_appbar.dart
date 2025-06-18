import 'package:ecommerce_store/Product_Detail/Widgets/fav_icon_animations.dart';
import 'package:ecommerce_store/utils/colors.dart';
import 'package:ecommerce_store/utils/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewProductAppbar extends StatelessWidget {
  final ProductModel product;

  const ViewProductAppbar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBgColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                context.pop();
              },
              child: Image.asset('assets/icons/back_icon.png'),
            ),
            Row(
              children: [
                // Use product here
                AnimatedFavoriteIcon(product: product),
                const SizedBox(width: 10),
                Image.asset('assets/icons/shar_icon.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
