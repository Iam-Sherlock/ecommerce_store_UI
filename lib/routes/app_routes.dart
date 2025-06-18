import 'package:ecommerce_store/homepage.dart';
import 'package:ecommerce_store/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: 'welcome',
      path: '/',
      builder: (context, state) => OnboardingScreen()),
  GoRoute(
    name: 'home',
    path: '/home',
    builder: (context, state) => Homepage(),
  )
]);
