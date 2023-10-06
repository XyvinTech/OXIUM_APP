import 'dart:async';
import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';

class GradientLoadingIndicator extends StatefulWidget {
  @override
  _GradientLoadingIndicatorState createState() =>
      _GradientLoadingIndicatorState();
}

class _GradientLoadingIndicatorState extends State<GradientLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..addListener(() {
        setState(() {});
      });
    _controller.repeat();
    _isLoading = true;
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        // _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: BulbPainter(
            // angle: _controller.value * 360,
            // isLoading: _isLoading,
            ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double angle;
  final bool isLoading;

  _GradientPainter({
    required this.angle,
    required this.isLoading,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = SweepGradient(
        colors: [
          Colors.blue,
          Colors.green,
          Colors.yellow,
          Colors.red,
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    if (isLoading) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        0,
        pi,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_GradientPainter oldDelegate) =>
      angle != oldDelegate.angle;
}

class BulbPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );

    final outlinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      outlinePaint,
    );

    final cordPaint = Paint()
      ..color = Colors.grey[400]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;

    final cordLength = size.height * 0.1;
    final cordStart = Offset(size.width / 2, size.height - cordLength);
    final cordEnd = Offset(size.width / 2, size.height);
    canvas.drawLine(cordStart, cordEnd, cordPaint);

    final filamentPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final filamentStart = Offset(size.width / 2 - 20, size.height / 2);
    final filamentEnd = Offset(size.width / 2 + 20, size.height / 2);
    final filamentControl = Offset(size.width / 2, size.height / 2 - 20);
    final filamentPath = Path()
      ..moveTo(filamentStart.dx, filamentStart.dy)
      ..quadraticBezierTo(filamentControl.dx, filamentControl.dy,
          filamentEnd.dx, filamentEnd.dy);
    canvas.drawPath(filamentPath, filamentPaint);
  }

  @override
  bool shouldRepaint(BulbPainter oldDelegate) => false;
}
