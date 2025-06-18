import 'package:ecommerce_store/Home/Widgets/recently_view_items.dart';
import 'package:flutter/material.dart';

class RecentlyViewedSection extends StatelessWidget {
  const RecentlyViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recently viewed',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              RecentlyViewedItem(
                imageUrl: 'assets/products/dell_laptop.png',
                title: 'Huawei Matebook X13',
                price: '20,999',
              ),
              RecentlyViewedItem(
                imageUrl: 'assets/products/amazon.png',
                title: 'Alexa Home',
                price: '999',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
