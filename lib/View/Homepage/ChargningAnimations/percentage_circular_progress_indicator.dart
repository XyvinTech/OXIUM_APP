import 'dart:math';

import 'package:flutter/material.dart';

import 'gradiant_circular_progressbar.dart';

////////////PERCENTAGE INDICATOR/////////////
///
class PercentageIndicator extends StatefulWidget {
  const PercentageIndicator({super.key, required this.progress});
  final double progress;
  @override
  State<PercentageIndicator> createState() => _PercentageIndicatorState();
}

class _PercentageIndicatorState extends State<PercentageIndicator>
    with SingleTickerProviderStateMixin {
//   AnimationController? _animationController;

  @override
  void initState() {
    // _animationController = new AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 1500));
    // _animationController?.addListener(() => setState(() {}));
    // _animationController?.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          RoundedPlaceHolder(radius: 100, strokeWidth: 20, gradientColors: []),
          //   RotationTransition(
          // turns: Tween(begin: 0.0, end: 1.0).animate(_animationController!),
          // child:
          PercentageCircularProgressIndicator(
            progress: widget.progress,
            radius: 100,
            gradientColors: [
              Color(0xff3C67FF),
              Color(0xff45FFBC),
            ],
            strokeWidth: 20.0,
          ),
          //   ),
          CoveringArc(radius: 100, strokeWidth: 20, gradientColors: []),
        ],
      ),
    );
  }
}

class PercentageCircularProgressIndicator extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;
  final double progress;

  PercentageCircularProgressIndicator({
    required this.radius,
    required this.gradientColors,
    this.strokeWidth = 10.0,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: .7 * pi,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: PercentageCircularProgressPainter(
            radius: radius,
            gradientColors: gradientColors,
            strokeWidth: strokeWidth,
            progress: progress),
      ),
    );
  }
}

class PercentageCircularProgressPainter extends CustomPainter {
  PercentageCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
    required this.progress,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      //   ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader = SweepGradient(
            colors: gradientColors,
            startAngle: 0,
            endAngle: progress * 1.6 * pi)
        .createShader(rect);
    canvas.drawArc(rect, 0, progress * 1.6 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
