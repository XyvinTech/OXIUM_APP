// import 'dart:async';
// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: Container(
//         child: CustomCircularProgressBar(
//       value: .01,
//       strokeWidth: 10,
//     )),
//   ));
// }

// class CustomLinearProgressIndicator extends StatefulWidget {
//   final double strokeWidth;
//   final double value;

//   CustomLinearProgressIndicator({this.strokeWidth = 10.0, this.value = 0.0});

//   @override
//   _CustomLinearProgressIndicatorState createState() =>
//       _CustomLinearProgressIndicatorState();
// }

// class _CustomLinearProgressIndicatorState
//     extends State<CustomLinearProgressIndicator>
//     with SingleTickerProviderStateMixin {
//   AnimationController? _animationController;
//   Animation<double>? _animationValue;
//   double _progressValue = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 200),
//     );
//     _animationValue = Tween(begin: 0.0, end: widget.value).animate(
//       CurvedAnimation(
//         parent: _animationController!,
//         curve: Curves.easeOut,
//       ),
//     );
//     _animationValue?.addListener(() {
//       setState(() {
//         _progressValue = _animationValue!.value;
//       });
//     });
//     _animationController?.forward();
//   }

//   @override
//   void dispose() {
//     _animationController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: LinearPainter(
//         strokeWidth: widget.strokeWidth,
//         value: _progressValue,
//       ),
//     );
//   }
// }

// class LinearPainter extends CustomPainter {
//   final double strokeWidth;
//   final double value;

//   LinearPainter({required this.strokeWidth, required this.value});

//   @override
//   void paint(Canvas canvas, Size size) {
//     double width = size.width - strokeWidth;
//     double height = size.height - strokeWidth;
//     Paint paint = Paint()
//       ..shader = LinearGradient(
//         colors: [Colors.blue, Colors.green],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         tileMode: TileMode.clamp,
//       ).createShader(Rect.fromLTWH(0.0, 0.0, width, height))
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;
//     Path path = Path()
//       ..moveTo(strokeWidth / 2, height / 2 + strokeWidth / 2)
//       ..lineTo(width * value + strokeWidth / 2, height / 2 + strokeWidth / 2);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

// class CustomCircularProgressBar extends StatefulWidget {
//   final double strokeWidth;
//   final double value;

//   CustomCircularProgressBar({this.strokeWidth = 10, this.value = 0.5});

//   @override
//   _CustomCircularProgressBarState createState() =>
//       _CustomCircularProgressBarState();
// }

// class _CustomCircularProgressBarState extends State<CustomCircularProgressBar>
//     with SingleTickerProviderStateMixin {
//   AnimationController? _animationController;
//   Animation<double>? _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//     _animation = Tween<double>(
//       begin: 0,
//       end: widget.value,
//     ).animate(CurvedAnimation(
//       parent: _animationController!,
//       curve: Curves.easeOut,
//     ));
//     _animation?.addListener(() {
//       setState(() {});
//     });
//     _animationController?.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       foregroundPainter: _CircularProgressBarPainter(
//         strokeWidth: widget.strokeWidth,
//         percentage: _animation!.value,
//       ),
//       willChange: true,
//       child: Container(),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController?.dispose();
//     super.dispose();
//   }
// }

// class _CircularProgressBarPainter extends CustomPainter {
//   final double strokeWidth;
//   final double percentage;

//   _CircularProgressBarPainter(
//       {required this.strokeWidth, required this.percentage});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke
//       ..shader = LinearGradient(
//         colors: [
//           Colors.redAccent,
//           Colors.yellowAccent,
//           Colors.greenAccent,
//         ],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ).createShader(
//         Rect.fromCircle(
//           center: Offset(size.width / 2, size.height / 2),
//           radius: size.width / 2,
//         ),
//       );

//     double progressDegrees = (360 * percentage);

//     canvas.drawArc(
//       Rect.fromCircle(
//         center: Offset(size.width / 2, size.height / 2),
//         radius: size.width / 2 - strokeWidth / 2,
//       ),
//       -90,
//       progressDegrees,
//       false,
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/constants.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasPermissions = false;
  CompassEvent? _lastRead;
  DateTime? _lastReadAt;

  @override
  void initState() {
    super.initState();

    _fetchPermissionStatus();
    // FlutterCompass compass = FlutterCompass();
    FlutterCompass.events?.listen((event) {
      kLog(event.heading.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Flutter Compass'),
        ),
        body: Builder(builder: (context) {
          if (_hasPermissions) {
            return Column(
              children: <Widget>[
                // _buildManualReader(),
                Expanded(child: _buildCompass()),
              ],
            );
          } else {
            return _buildPermissionSheet();
          }
        }),
      ),
    );
  }

  Widget _buildManualReader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            child: Text('Read Value'),
            onPressed: () async {
              final CompassEvent tmp = await FlutterCompass.events!.first;
              setState(() {
                _lastRead = tmp;
                _lastReadAt = DateTime.now();
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$_lastRead',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '$_lastReadAt',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;

        // if direction is null, then device does not support this sensor
        // show error message
        if (direction == null)
          return Center(
            child: Text("Device does not have sensors !"),
          );

        return Column(
          children: [
            _buildManualReader(),
            Material(
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              elevation: 4.0,
              child: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Transform.rotate(
                  angle: (direction * (math.pi / 180) * -1),
                  child: SvgPicture.asset(
                    'assets/svg/bolt.svg',
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPermissionSheet() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Location Permission Required'),
          ElevatedButton(
            child: Text('Request Permissions'),
            onPressed: () {
              Permission.locationWhenInUse.request().then((ignored) {
                _fetchPermissionStatus();
              });
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('Open App Settings'),
            onPressed: () {
              openAppSettings().then((opened) {
                //
              });
            },
          )
        ],
      ),
    );
  }

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() => _hasPermissions = status == PermissionStatus.granted);
      }
    });
  }
}