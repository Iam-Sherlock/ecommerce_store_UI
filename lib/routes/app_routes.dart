import 'package:ecommerce_store/Checkout/Screens/checkout_screen.dart';
import 'package:ecommerce_store/Favourite/Screens/favourite_screen.dart';
import 'package:ecommerce_store/Home/Screens/homepage.dart';
import 'package:ecommerce_store/Home/Screens/onboarding_screen.dart';
import 'package:ecommerce_store/Home/Screens/profile_screen.dart';
import 'package:ecommerce_store/Product_Detail/Screens/view_product_screen.dart';
import 'package:ecommerce_store/utils/custom_navbar.dart';
import 'package:ecommerce_store/utils/product_model.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'welcome',
      builder: (context, state) => OnboardingScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => MainScaffold(child: child),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => Homepage(),
        ),
        GoRoute(
          name: 'favourite',
          path: '/favourite',
          builder: (context, state) => const FavouriteScreen(),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) {
        final productDetails = state.extra as ProductModel;
        return ViewProductScreen(productDetails: productDetails);
      },
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return CheckoutScreen(
          image: data['image'],
          name: data['name'],
          price: data['price'],
        );
      },
    ),
  ],
);
