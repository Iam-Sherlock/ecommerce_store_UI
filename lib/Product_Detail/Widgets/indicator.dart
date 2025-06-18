import 'package:ecommerce_store/utils/colors.dart';
import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color selectedColor;
  final Color unselectedColor;

  const IndicatorWidget({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    this.selectedColor = AppColors.primaryGreenColor,
    this.unselectedColor = AppColors.greyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        bool isSelected = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: isSelected ? 44 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : unselectedColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: isSelected ? AppColors.secondaryGreenColor : unselectedColor)
          ),
        );
      }),
    );
  }
}
