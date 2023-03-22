import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main(List<String> args) {
  runApp(GetMaterialApp(
    home: GradientIndicator(),
  ));
}

class GradientCircularProgressIndicator extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  GradientCircularProgressIndicator({
    required this.radius,
    required this.gradientColors,
    this.strokeWidth = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: GradientCircularProgressPainter(
        radius: radius,
        gradientColors: gradientColors,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      // ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader = SweepGradient(
            colors: gradientColors, startAngle: 0.0, endAngle: .5 * pi)
        .createShader(rect);
    canvas.drawArc(rect, 0.0, .5 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class GradientIndicator extends StatefulWidget {
  const GradientIndicator({super.key});

  @override
  State<GradientIndicator> createState() => _GradientIndicatorState();
}

class _GradientIndicatorState extends State<GradientIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animationController?.addListener(() => setState(() {}));
    _animationController?.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          RoundedPlaceHolder(radius: 100, strokeWidth: 20, gradientColors: []),
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_animationController!),
            child: GradientCircularProgressIndicator(
              radius: 100,
              gradientColors: [
                Color(0xff45FFBC),
                // Color(0xff3BC2D5),
                Color(0xff3C67FF),
              ],
              strokeWidth: 20.0,
            ),
          ),
          CoveringArc(radius: 100, strokeWidth: 20, gradientColors: []),
        ],
      ),
    );
  }
}

class RoundPlaceHolderPainter extends CustomPainter {
  RoundPlaceHolderPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Color.fromARGB(255, 230, 228, 228)
      // ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    Paint backgroundPaint = Paint()..color = Colors.white;
    // paint.shader =
    // SweepGradient(
    //         colors: gradientColors, startAngle: 0.0, endAngle: .5 * pi)
    //     .createShader(rect);
    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width, size.height), backgroundPaint);
    canvas.drawArc(rect, 130 * pi / 180, 280 * pi / 180, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RoundedPlaceHolder extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  RoundedPlaceHolder({
    required this.radius,
    required this.gradientColors,
    this.strokeWidth = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: RoundPlaceHolderPainter(
        radius: radius,
        gradientColors: gradientColors,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class CoveringArcPainter extends CustomPainter {
  CoveringArcPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      // ..strokeCap = StrokeCap.round
      ..color = Colors.white
      // ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 2;

    final arc1 = Path();
    arc1.moveTo(size.width * .20, size.height * .835);
    arc1.arcToPoint(
      Offset(size.width * .80, size.height * .835),
      radius: Radius.circular(89.5),
      clockwise: false,
    );
    canvas.drawPath(arc1, paint);
    // canvas.drawArc(rect, 130 * pi / 180, 280 * pi / 180, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CoveringArc extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  CoveringArc({
    required this.radius,
    required this.gradientColors,
    this.strokeWidth = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: CoveringArcPainter(
        radius: radius,
        gradientColors: gradientColors,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

////////////PERCENTAGE INDICATOR/////////////
///
// class PercentageIndicator extends StatefulWidget {
//   const PercentageIndicator({super.key});

//   @override
//   State<PercentageIndicator> createState() => _PercentageIndicatorState();
// }

// class _PercentageIndicatorState extends State<PercentageIndicator>
//     with SingleTickerProviderStateMixin {
//   AnimationController? _animationController;

//   @override
//   void initState() {
//     _animationController = new AnimationController(
//         vsync: this, duration: Duration(milliseconds: 1500));
//     _animationController?.addListener(() => setState(() {}));
//     _animationController?.repeat();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: Stack(
//         children: [
//           RoundedPlaceHolder(radius: 100, strokeWidth: 20, gradientColors: []),
//           RotationTransition(
//             turns: Tween(begin: 0.0, end: 1.0).animate(_animationController!),
//             child: GradientCircularProgressIndicator(
//               radius: 100,
//               gradientColors: [
//                 Color(0xff45FFBC),
//                 // Color(0xff3BC2D5),
//                 Color(0xff3C67FF),
//               ],
//               strokeWidth: 20.0,
//             ),
//           ),
//           CoveringArc(radius: 100, strokeWidth: 20, gradientColors: []),
//         ],
//       ),
//     );
//   }
// }
