import 'package:ecommerce_store/utils/product_data.dart';
import 'package:flutter/material.dart';
import 'product_card.dart';

class HotSalesSection extends StatelessWidget {
  const HotSalesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final data = products;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Hot sales',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ProductCard(product: data[index]));
            },
          ),
        ),
      ],
    );
  }
}
