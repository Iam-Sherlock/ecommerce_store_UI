import 'package:ecommerce_store/Favourite/Provider/favorites_provider.dart';
import 'package:ecommerce_store/Home/Widgets/product_card.dart';
import 'package:ecommerce_store/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesProvider>(context).favorites;

    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      appBar: AppBar(title: const Text("Favorites")),
      body: favorites.isEmpty
          ? const Center(child: Text("No favorite items."))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: favorites.map((item) {
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width - 55) / 2,
                    child: ProductCard(product: item), // Pass the whole map
                  );
                }).toList(),
              ),
            ),
    );
  }
}
