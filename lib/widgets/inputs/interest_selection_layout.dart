import 'package:flutter/material.dart';
import 'package:hirconn_app/widgets/texts/interest_chip.dart';

/// A reusable layout widget that displays a collection of [InterestChip]s in a Wrap
class InterestSelectionLayout extends StatelessWidget {
  final List<String> selectedInterests;
  final Function(String) onRemove;
  final double spacing;
  final double runSpacing;

  const InterestSelectionLayout({
    super.key,
    required this.selectedInterests,
    required this.onRemove,
    this.spacing = 10.0,
    this.runSpacing = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: selectedInterests.map((interest) {
        return InterestChip(
          label: interest,
          onDelete: () => onRemove(interest),
        );
      }).toList(),
    );
  }
}
