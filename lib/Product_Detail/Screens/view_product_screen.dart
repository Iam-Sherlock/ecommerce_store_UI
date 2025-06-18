import 'package:ecommerce_store/Product_Detail/Widgets/color_selector.dart';
import 'package:ecommerce_store/Product_Detail/Widgets/indicator.dart';
import 'package:ecommerce_store/Product_Detail/Widgets/view_product_appbar.dart';
import 'package:ecommerce_store/utils/button.dart';
import 'package:ecommerce_store/utils/colors.dart';
import 'package:ecommerce_store/utils/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProductScreen extends StatefulWidget {
  final ProductModel productDetails;
  const ViewProductScreen({
    required this.productDetails,
    super.key,
  });

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  int selectedVariant = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> variants = [
      widget.productDetails.image1,
      // widget.productDetails.image2,
      // widget.productDetails.image3,
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      body: Column(
        children: [
          const SizedBox(height: 20),
          ViewProductAppbar(product: widget.productDetails),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Hero(
                  tag: widget.productDetails.id,
                  child: Image.asset(
                    widget.productDetails.image1,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image,
                          size: 100, color: Colors.grey);
                    },
                    height: 236,
                    width: 224,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                IndicatorWidget(
                    itemCount: variants.length, currentIndex: selectedVariant),
                const SizedBox(height: 30),
                // variants row
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(variants.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedVariant = index;
                            });
                          },
                          child: Container(
                            width: 73,
                            height: 73,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedVariant == index
                                    ? AppColors.secondaryGreenColor
                                    : Colors.transparent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                fit: BoxFit.cover,
                                variants[index],
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.broken_image,
                                      size: 100, color: AppColors.greyColor);
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 40),

                // Details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productDetails.name ?? '',
                        style: GoogleFonts.baiJamjuree(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            "\$ ${widget.productDetails.price ?? ''}.00",
                            style: GoogleFonts.baiJamjuree(
                              fontSize: 20,
                              color: AppColors.primaryGreenColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            "|  Including taxes and duties",
                            style: GoogleFonts.baiJamjuree(
                              fontSize: 12,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Color dots
                          ColorSelector(),

                          // Rating
                          Row(
                            children: [
                              Image.asset('assets/icons/star_icon.png'),
                              const SizedBox(width: 4),
                              Text(
                                ' ${widget.productDetails.rating.toString()} [10]',
                                style: GoogleFonts.baiJamjuree(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Divider
                      Container(
                        height: 2,
                        color: AppColors.greyColor.withOpacity(0.5),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 8),
                      ),
                      const SizedBox(height: 20),

                      CustomButton(
                        text: 'Add to Cart',
                        textColor: Colors.white,
                        onTap: () {},
                        backgroundColor: Colors.black,
                        borderColor: Colors.black,
                      ),

                      const SizedBox(height: 20),

                      CustomButton(
                        text: 'Buy Now',
                        textColor: Colors.white,
                        onTap: () {
                          context.push('/checkout', extra: {
                            'image': widget.productDetails.image1,
                            'name': widget.productDetails.name,
                            'price': widget.productDetails.price.toString(),
                          });
                        },
                        backgroundColor: AppColors.primaryGreenColor,
                        borderColor: AppColors.primaryGreenColor,
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
