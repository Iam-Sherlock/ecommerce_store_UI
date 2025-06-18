import 'package:flutter/material.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Green background container
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF00A884),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CYBER\nLINIO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '40% ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'DSCNT\n',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'in technology',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'FREE SHIPPING',
                    style: TextStyle(
                      color: Color(0xFF00A884),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: -30,
          left: 100,
          child: Image.asset(
            'assets/onboarding/home_stick.png',
            width: 180,
            height: 180,
          ),
        ),
        Positioned(
          top: -3,
          right: 20,
          child: Image.asset(
            'assets/onboarding/nitendo_switch.png',
            width: 180,
            height: 140,
          ),
        ),
        Positioned(
          bottom: -1,
          right: 30,
          child: Image.asset(
            'assets/onboarding/samsung_buds.png',
            width: 120,
            height: 90,
          ),
        ),
      ],
    );
  }
}
