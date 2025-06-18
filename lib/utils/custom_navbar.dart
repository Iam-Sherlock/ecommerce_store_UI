import 'package:ecommerce_store/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home, "Home", 0),
            _buildNavItem(Icons.favorite_border, "Favourite", 1),
            _buildNavItem(Icons.person_outline, "Profile", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => onItemTapped(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: isSelected
                ? BoxDecoration(
                    color: const Color(0xFFE6FAEA),
                    borderRadius: BorderRadius.circular(30),
                  )
                : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: isSelected
                      ? AppColors.primaryGreenColor
                      : Colors.grey,
                ),
                const SizedBox(width: 5),
                if (isSelected)
                  Text(
                    label,
                    style: GoogleFonts.baiJamjuree(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryGreenColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    int _getSelectedIndex() {
      if (location.startsWith('/home')) return 0;
      if (location.startsWith('/favourite')) return 1;
      if (location.startsWith('/profile')) return 2;
      return 0;
    }

    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          context.go('/home');
          break;
        case 1:
          context.go('/favourite');
          break;
        case 2:
          context.go('/profile');
          break;
      }
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _getSelectedIndex(),
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
