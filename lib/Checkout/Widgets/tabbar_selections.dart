import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabbarSelection extends StatefulWidget {
  final Function(String) onSelectionChanged;
  final String initialSelection;

  const TabbarSelection({
    super.key,
    required this.onSelectionChanged,
    this.initialSelection = 'Home delivery',
  });

  @override
  State<TabbarSelection> createState() => _TabbarSelectionState();
}

class _TabbarSelectionState extends State<TabbarSelection> {
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelection;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          // Moving pill background
          AnimatedAlign(
            alignment: selected == 'Home delivery' ? Alignment.centerLeft : Alignment.centerRight,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),

          Row(
            children: [
              _buildOption('Home delivery', Alignment.centerLeft),
              _buildOption('Pick up in store', Alignment.centerRight),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String title, Alignment align) {
  final bool isSelected = selected == title;
  return Expanded(
    child: GestureDetector(
      behavior: HitTestBehavior.opaque, // <--- this is important!
      onTap: () {
        setState(() {
          selected = title;
        });
        widget.onSelectionChanged(selected);
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.baiJamjuree(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.black : Colors.grey.shade600,
          ),
        ),
      ),
    ),
  );
}

}
