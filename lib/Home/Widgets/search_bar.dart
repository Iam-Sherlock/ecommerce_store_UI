import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search Box
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/search_icon.png', height:20, fit: BoxFit.cover,),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search products',
                      hintStyle: GoogleFonts.baiJamjuree(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Notification Icon with Green Dot
        Stack(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/icons/notification_icon.png',height: 45, fit: BoxFit.cover,),
            ),
          ],
        ),
      ],
    );
  }
}
