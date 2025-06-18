import 'package:ecommerce_store/Checkout/Widgets/payment_card.dart';
import 'package:ecommerce_store/Checkout/Widgets/payment_success_dialogl.dart';
import 'package:ecommerce_store/Checkout/Widgets/payment_type_selector.dart';
import 'package:ecommerce_store/Checkout/Widgets/tabbar_selections.dart';
import 'package:ecommerce_store/utils/button.dart';
import 'package:ecommerce_store/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  const CheckoutScreen({super.key, required this.name, required this.image, required this.price});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedIndex = 0;

  final List<Map<String, String>> cards = [
    {
      'brand': 'VISA',
      'number': '**** **** **** 1921',
      'expiry': '07/25',
    },
    {
      'brand': 'VISA',
      'number': '**** **** **** 5632',
      'expiry': '07/25',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Image.asset('assets/icons/back_icon.png')
                ),
                SizedBox(width: 20),
                Text(
                  'Checkout',
                  style: GoogleFonts.baiJamjuree(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 120,
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            child: Image.asset(widget.image, fit: BoxFit.cover),
                          ), 
                                    
                          SizedBox(width: 10),
                      
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name ?? '',
                                  style: GoogleFonts.baiJamjuree(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$ ${widget.price}.00",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.baiJamjuree(
                                        fontSize: 15,
                                        color: AppColors.primaryGreenColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 7),
                                    Expanded(
                                      child: Text(
                                        "|  Including taxes and duties",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.baiJamjuree(
                                          fontSize: 12,
                                          color: Colors.grey.shade800,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                
                    Text(
                      'Shipping method',
                      style: GoogleFonts.baiJamjuree(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20),
            
                    TabbarSelection(
                      onSelectionChanged: (value) {
                      },
                    ),
            
                    SizedBox(height: 20),
            
                    Text(
                      'Select your payment method',
                      style: GoogleFonts.baiJamjuree(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
            
                    SizedBox(height: 20),
            
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(cards.length, (index) {
                          final card = cards[index];
                          return PaymentCardWidget(
                            brandName: card['brand']!,
                            cardNumber: card['number']!,
                            expiryDate: card['expiry']!,
                            isSelected: selectedIndex == index,
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          );
                        }),
                      ),
                    ),
            
                    SizedBox(height: 50),
            
                    PaymentMethodSelector(
                      onAddNew: () {
                      },
                      paymentIcons: [
                        Image.asset(
                          'assets/icons/gpay_icon.png',
                          width: 40,
                          height: 40,
                        ),
                        Image.asset(
                          'assets/icons/applepay_icon.png',
                          width: 40,
                          height: 40,
                        ),
                        Image.asset(
                          'assets/icons/paypal_icon.png',
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),

                    SizedBox(height: 40),
            
                    _buildRow(
                      'Subtotal (2 items)',
                      '\$ ${50.toStringAsFixed(2)}',
                      FontWeight.normal,
                    ),
                    const SizedBox(height: 8),
                    _buildRow(
                      'Shipping cost',
                      '100',
                      FontWeight.normal,
                    ),
                    const SizedBox(height: 12),
                    _buildRow(
                      'Total',
                      '\$ ${200.toStringAsFixed(2)}',
                      FontWeight.bold,
                    ),

                    SizedBox(height: 30),

                    CustomButton(
                      text: 'Finalize Purchase', 
                      textColor: Colors.white, 
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PaymentSuccessDialog();
                          },
                        );
                      },
                      backgroundColor: AppColors.primaryGreenColor,
                      borderColor: AppColors.primaryGreenColor,
                    ),

                    SizedBox(height: 30),
            
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, FontWeight weight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.baiJamjuree(
              fontSize: 14,
              fontWeight: weight,
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.baiJamjuree(
            fontSize: 14,
            fontWeight: weight,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}