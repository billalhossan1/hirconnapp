import 'package:flutter/material.dart';
import 'package:hirconn_app/widgets/bottom_waves_widget/bottom_waves_widget.dart';

class OnboardingTemplate extends StatelessWidget {
  final Color wave1Color;
  final Color wave2Color;
  final Color wave3Color;
  final String waveText;
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
    this.waveText = '',
    this.waveTextStyle,
    this.bottomPadding = 200,
    this.isCenterContent = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return
SafeArea(
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
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment:isCenterContent? MainAxisAlignment.center: MainAxisAlignment.start,
                children: [
                  child, // Your custom content goes here
                ],
              ),
            ),
          ],
        ),
      );
  }
}