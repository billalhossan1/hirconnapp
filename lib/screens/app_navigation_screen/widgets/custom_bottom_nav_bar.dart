import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> icons = [
      'assets/icons/profile.svg',
      'assets/icons/photos.svg',
      'assets/icons/chat.svg',
      'assets/icons/person.svg',
      'assets/icons/events.svg',
      'assets/icons/connection.svg',
    ];

    return Container(
      height: 70 + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final isSelected = currentIndex == index;
          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Indicator Bar
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 4,
                    width: isSelected ? 40 : 0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6A1B9A), // Purple indicator
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Icon
                  SvgPicture.asset(
                    icons[index],
                    width: 28,
                    height: 28,
                    // If the icon is not colorful enough, we might need to handle colors
                    // But the design shows colorful icons, so we assume SVGs are colorful
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
