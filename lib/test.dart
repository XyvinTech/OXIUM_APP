import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: Container(child: CustomLoadingIndicator()),));
}

class CustomLoadingIndicator extends StatefulWidget {
  @override
  _CustomLoadingIndicatorState createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Timer? _timer;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    )..repeat();
    _timer = Timer.periodic(Duration(milliseconds: 2000), (_) {
      if (!_isDisposed) {
        _controller?.forward(from: 0.0);
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    _controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomLoadingIndicatorPainter(
        _controller,
        Theme.of(context).accentColor,
      ),
    );
  }
}

class _CustomLoadingIndicatorPainter extends CustomPainter {
  final Animation<double>? _animation;
  final Color _color;

  _CustomLoadingIndicatorPainter(this._animation, this._color)
      : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = min(size.width / 2, size.height / 2) * 0.8;
    final double strokeWidth = radius * 0.2;
    final double strokeLength = strokeWidth * 2;

    canvas.translate(size.width / 2, size.height / 2);

    for (int i = 0; i < 12; i++) {
      final double opacity = 1.0 - (i / 12.0);
      final double angle = 2.0 * pi * (i / 12.0);
      final double x = (radius - strokeLength) * cos(angle);
      final double y = (radius - strokeLength) * sin(angle);
      final double x2 = radius * cos(angle);
      final double y2 = radius * sin(angle);

      final Paint paint = Paint()
        ..color = _color.withOpacity(opacity)
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      canvas.drawLine(Offset(x, y), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(_CustomLoadingIndicatorPainter oldDelegate) {
    return _animation != oldDelegate._animation || _color != oldDelegate._color;
  }
}
