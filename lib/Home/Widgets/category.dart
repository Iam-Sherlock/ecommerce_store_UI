import 'package:ecommerce_store/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChips extends StatelessWidget {
  final List<String> categories = [
    'Technology',
    'Fashion',
    'Sports',
    'Supermarket',
  ];

  CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Chip(
            label: Text(
              categories[index],
              overflow: TextOverflow.ellipsis, // optional, just in case
            ),
            backgroundColor: AppColors.primaryBgColor,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(20),
            ),
            labelStyle: GoogleFonts.baiJamjuree(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          );
        },
      ),
    );
  }
}
