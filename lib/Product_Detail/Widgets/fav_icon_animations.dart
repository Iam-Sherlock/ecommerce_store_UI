import 'package:ecommerce_store/Favourite/Provider/favorites_provider.dart';
import 'package:ecommerce_store/utils/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedFavoriteIcon extends StatefulWidget {
  final ProductModel product;

  const AnimatedFavoriteIcon({super.key, required this.product});

  @override
  State<AnimatedFavoriteIcon> createState() => _AnimatedFavoriteIconState();
}

class _AnimatedFavoriteIconState extends State<AnimatedFavoriteIcon> {
  bool isFavorite = false;
  List<Widget> floatingHearts = [];
  int tapCount = 0;

  @override
  void initState() {
    super.initState();
    final favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
    isFavorite = favoritesProvider.isFavorite(widget.product.name);
  }

void _onTapFavorite() {
    final favoritesProvider =
        Provider.of<FavoritesProvider>(context, listen: false);
    favoritesProvider.toggleFavorite(widget.product);

    setState(() {
      isFavorite = favoritesProvider.isFavorite(widget.product.name);
      tapCount++;
    });

    _startFloatingHearts();
  }

  void _startFloatingHearts() {
  List<Widget> hearts = [];
  for (int i = 0; i < 5; i++) {
    hearts.add(_buildFloatingHeart(i, tapCount));
  }

  if (mounted) {
    setState(() {
      floatingHearts = hearts;
    });
  }

  Future.delayed(const Duration(seconds: 5), () {
    if (mounted) {
      setState(() {
        floatingHearts = [];
      });
    }
  });
}


  Widget _buildFloatingHeart(int index, int tapId) {
    final double startX = 0;
    final double endX = (index % 2 == 0 ? -1 : 1) * (20 + index * 10);

    return AnimatedPositioned(
      key: ValueKey('floating_heart_${tapId}_$index'),
      duration: Duration(milliseconds: 2000 + index * 200),
      curve: Curves.easeOut,
      bottom: 0,
      left: 0,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: -150.0 - index * 20),
        duration: Duration(milliseconds: 2000 + index * 200),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(
              startX + (endX * (value / (-150 - index * 20))),
              value,
            ),
            child: Opacity(
              opacity: 1.0 - (value / (-150 - index * 20)),
              child: Image.asset(
                'assets/icons/fav_filled_icon.png',
                width: 10,
                height: 10,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: _onTapFavorite,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: isFavorite
                ? Image.asset(
                    'assets/icons/fav_filled_icon.png',
                    key: const ValueKey('fav_filled'),
                    width: 30,
                    height: 30,
                  )
                : Image.asset(
                    'assets/icons/fav_icon.png',
                    key: const ValueKey('fav_empty'),
                    width: 30,
                    height: 30,
                  ),
          ),
        ),
        Positioned.fill(child: Stack(clipBehavior: Clip.none, children: floatingHearts)),
      ],
    );
  }
}
