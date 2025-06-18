import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodSelector extends StatelessWidget {
  final List<Widget> paymentIcons;
  final VoidCallback onAddNew;

  const PaymentMethodSelector({
    super.key,
    required this.paymentIcons,
    required this.onAddNew,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onAddNew,
          child: Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              '+ Add new',
              style: GoogleFonts.baiJamjuree(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: paymentIcons
                .map(
                  (icon) => Container(
                    width: 95,
                    height: 50,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: icon,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
