// import 'package:flutter/material.dart';
// import 'package:freelancer_app/View/Widgets/customText.dart';
// import 'package:google_place/google_place.dart';
// import 'package:location/location.dart' as loc;

// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: Test(),
//   ));
// }

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   @override
//   void initState() {
//     super.initState();
//     loc.Location().onLocationChanged.listen((loc.LocationData currentLocation) {
//       // Use current location
//       print(currentLocation);
//       print(currentLocation.heading);
//       print(currentLocation.headingAccuracy);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
