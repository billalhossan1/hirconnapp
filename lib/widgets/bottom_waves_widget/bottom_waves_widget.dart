import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/widgets/texts/app_text.dart';

class BottomWaves extends StatelessWidget {
  final Color wave1Color;
  final Color wave2Color;
  final Color wave3Color;
  final Widget? text;
  final TextStyle? textStyle;

  const BottomWaves({
    super.key,
    required this.wave1Color,
    required this.wave2Color,
    required this.wave3Color,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 350, // Increase this value to make waves taller
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            size: Size(screenWidth, 350), // Match the SizedBox height
            painter: _WavePainter(
              wave1Color: wave1Color,
              wave2Color: wave2Color,
              wave3Color: wave3Color,
            ),
          ),
         text!=null? Positioned(
            bottom: 120, // Adjusted to center with the top wave
            child:text!
          ): SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Color wave1Color;
  final Color wave2Color;
  final Color wave3Color;

  _WavePainter({
    required this.wave1Color,
    required this.wave2Color,
    required this.wave3Color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Create linear gradient paints for each wave (left to right)
    final paint1 = Paint()
      ..shader = LinearGradient(
        colors: [wave1Color, wave1Color.withOpacity(0.6)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final paint2 = Paint()
      ..shader = LinearGradient(
        colors: [wave2Color, wave2Color.withOpacity(0.6)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final paint3 = Paint()
      ..shader = LinearGradient(
        colors: [wave3Color, wave3Color.withOpacity(0.6)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Bottom wave - Increase left start height to push wave up
    final path1 = Path();
    path1.moveTo(0, size.height * 0.52); // Adjust this to move wave up/down
    path1.quadraticBezierTo(
      size.width * 0.35, size.height * 0.25,
      size.width, size.height * 0.60, // Right side end point - decrease to raise wave
    );
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();

    // Middle wave - Increase left start height to push wave up
    final path2 = Path();
    path2.moveTo(0, size.height * 0.42); // Increased from 0.45 for more initial spacing
    path2.quadraticBezierTo(
      size.width * 0.4, size.height * 0.18,
      size.width, size.height * 0.42, // Right side end point - decrease to raise wave
    );
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();

    // Top wave - Increase left start height to push wave up
    final path3 = Path();
    path3.moveTo(0, size.height * 0.36); // Increased from 0.42 for more initial spacing
    path3.quadraticBezierTo(
      size.width * 0.45, size.height * 0.1,
      size.width, size.height * 0.23, // Right side end point - decrease to raise wave
    );
    path3.lineTo(size.width, size.height);
    path3.lineTo(0, size.height);
    path3.close();

    canvas.drawPath(path3, paint3); // Top wave
    canvas.drawPath(path2, paint2); // Middle wave
    canvas.drawPath(path1, paint1); // Bottom wave
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}