import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CircularProgressIndicators extends StatelessWidget {
  const CircularProgressIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: DashedCircularProgressIndicator(
            percentage: 70.5, // Progress percentage (adjustable)
            dashWidth: 6.0, // Width of each dash
            dashHeight: 8.0, // Height of each dash
            strokeWidth: 3.0, // Thickness of dashes
            backgroundStrokeWidth: 8.0, // Now you can change this!
          ),
        ),
      ),
    );
  }
}

class DashedCircularProgressIndicator extends StatelessWidget {
  final double percentage;
  final double dashWidth;
  final double dashHeight;
  final double strokeWidth;
  final double backgroundStrokeWidth;

  const DashedCircularProgressIndicator({
    super.key,
    required this.percentage,
    this.dashWidth = 6.0,
    this.dashHeight = 12.0,
    this.strokeWidth = 3.0,
    this.backgroundStrokeWidth = 6.0, // New parameter for grey circle thickness
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125.w,
      height: 125.h,
      child: CustomPaint(
        painter: DashedCirclePainter(
          percentage: percentage,
          dashWidth: dashWidth,
          dashHeight: dashHeight,
          strokeWidth: strokeWidth,
          backgroundStrokeWidth: backgroundStrokeWidth, // Pass it to painter
        ),
        child: Center(
          child: Text('${percentage.toStringAsFixed(1)} %',
              style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
        ),
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final double percentage;
  final double dashWidth;
  final double dashHeight;
  final double strokeWidth;
  final double backgroundStrokeWidth;

  DashedCirclePainter({
    required this.percentage,
    required this.dashWidth,
    required this.dashHeight,
    required this.strokeWidth,
    required this.backgroundStrokeWidth, // New variable
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius =
        (size.width / 2) - (backgroundStrokeWidth / 2); // Use background width
    double circumference = 2 * pi * radius;
    int dashCount = (circumference / (dashWidth * 2)).floor();
    int filledDashCount = (dashCount * (percentage / 100)).round();

    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = backgroundStrokeWidth // Adjusted width for grey circle
      ..strokeCap = StrokeCap.round;

    Paint filledPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // **Draw the thicker grey background circle**
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius,
      backgroundPaint,
    );

    // Draw dashed progress
    for (int i = 0; i < dashCount; i++) {
      double angle = (i * (dashWidth * 2)) / radius;
      Offset start = Offset(
        size.width / 2 + radius * cos(angle),
        size.height / 2 + radius * sin(angle),
      );
      Offset end = Offset(
        size.width / 2 + (radius - dashHeight) * cos(angle),
        size.height / 2 + (radius - dashHeight) * sin(angle),
      );

      if (i < filledDashCount) {
        canvas.drawLine(start, end, filledPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
