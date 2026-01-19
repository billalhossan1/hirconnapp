import 'package:flutter/material.dart';
import 'package:hirconn_app/widgets/bottom_waves_widget/bottom_waves_widget.dart';

class OnboardingTemplate extends StatelessWidget {
  final Color wave1Color;
  final Color wave2Color;
  final Color wave3Color;
  final Widget? waveText;
  final TextStyle? waveTextStyle;
  final double bottomPadding;
  final Widget child;
  final bool isCenterContent;
  final CrossAxisAlignment crossAxisAlignment;

  const OnboardingTemplate({
    super.key,
    required this.wave1Color,
    required this.wave2Color,
    required this.wave3Color,
    this.waveText,
    this.waveTextStyle,
    this.bottomPadding = 10,
    this.isCenterContent = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Bottom waves
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: BottomWaves(
              wave1Color: wave1Color,
              wave2Color: wave2Color,
              wave3Color: wave3Color,
              text: waveText,
              textStyle: waveTextStyle ??
                  const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          // Content area
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: bottomPadding,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  // Ensure the scroll view can still scroll when content is larger than available
                  child: ConstrainedBox(
                    // Make the inner area take at least the available height so centering works
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Align(
                      alignment: isCenterContent ? Alignment.center : Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: child,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}