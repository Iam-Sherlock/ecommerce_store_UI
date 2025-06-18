# ecommerce_store

A modern, feature-rich e-commerce mobile application built with Flutter.

## Overview

**ecommerce_store** is a sample e-commerce app that demonstrates a clean architecture, beautiful UI, and essential shopping features. It is designed as a starting point for building scalable and maintainable Flutter shopping apps.

## Features

- **Onboarding Experience**: Engaging onboarding screens for new users.
- **Product Catalog**: Browse products by categories such as Technology, Fashion, Sports, and Supermarket.
- **Product Details**: View detailed information, images, color options, and ratings for each product.
- **Favorites**: Add or remove products from your favorites list with animated feedback.
- **Search**: Quickly find products using the search bar.
- **Recently Viewed**: See a list of products you've recently viewed.
- **Checkout Flow**: Select payment methods, choose delivery or pickup, and complete purchases.
- **Profile Management**: Access profile, edit details, view orders, and manage settings.
- **Custom Navigation**: Smooth navigation with a custom bottom navigation bar.

## Screenshots

_Add screenshots of your app here (optional)._

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=3.6.1)
- Dart SDK (compatible with Flutter version)
- Android Studio, VS Code, or any preferred IDE

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/ecommerce_store.git
   cd ecommerce_store
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## Project Structure

- `lib/`
  - `Home/` – Home, onboarding, and profile screens
  - `Product_Detail/` – Product detail screens and widgets
  - `Checkout/` – Checkout flow and payment widgets
  - `Favourite/` – Favorites provider and screen
  - `routes/` – App routing configuration
  - `utils/` – Shared utilities, models, and styles

## Assets

All images and icons are stored in the `assets/` directory and are referenced in `pubspec.yaml`.

## Dependencies

- [provider](https://pub.dev/packages/provider) – State management
- [go_router](https://pub.dev/packages/go_router) – Routing
- [google_fonts](https://pub.dev/packages/google_fonts) – Custom fonts
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) – iOS style icons

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.
 