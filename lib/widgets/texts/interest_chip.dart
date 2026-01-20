import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:core_kit/core_kit.dart';

/// A professional chip widget for displaying selected interests
class InterestChip extends StatelessWidget {
  final String label;
  final VoidCallback onDelete;

  const InterestChip({super.key, required this.label, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.instance.primary.withOpacity(0.6),
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: label,
            fontSize: 14,
            textColor: AppColors.instance.primary,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onDelete,
            child: Icon(
              Icons.close,
              size: 18,
              color: AppColors.instance.primary,
            ),
          ),
        ],
      ),
    );
  }
}
