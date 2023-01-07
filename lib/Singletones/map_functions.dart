import 'dart:async';
import 'dart:developer';

import 'package:freelancer_app/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapFunctions {
  //make it singleTone class
  static final MapFunctions _singleton = MapFunctions._internal();
  factory MapFunctions() {
    return _singleton;
  }
  MapFunctions._internal();
  //code starts from here

  String token = '';
  late GoogleMapController controller;
  late StreamSubscription mapStream;
  Rx<CameraPosition> initialPosition = CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962), zoom: 14)
      .obs;

  void initCameraPosition(LatLng latLng) {
    initialPosition.value = CameraPosition(target: latLng, zoom: 14);
  }

  void setMapStyle(GoogleMapController controller) {
    controller.setMapStyle('''
    [
  {
    "featureType": "all",
    "elementType": "geometry",
    "stylers": [
      {
        // "color": "#dfe1e6"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        // "color": "#99a2cc"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  ]
    ''');
  }

  Future<bool> checkLocationPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
        return false;
      }
    }
    return true;
  }

  Future<Position?> getLastLocation() async {
    return await Geolocator.getLastKnownPosition();
  }

  Future<Position?> getCurrentPosition() async {
    if (await checkLocationPermission())
      return await Geolocator.getCurrentPosition();
  }

  Future<void> myPositionListener() async {
    if ((await checkLocationPermission()))
      mapStream = await Geolocator.getPositionStream().listen((event) async {
        await animateToNewPosition(LatLng(event.latitude, event.longitude));
      });
  }

  Future<void> animateToNewPosition(LatLng latLng, {double? newZoom}) async {
    await controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: latLng, zoom: newZoom ?? zoom),
    ));
  }

  void setMapFitToPolyline(Set<Polyline> p) {
    double minLat = p.first.points.first.latitude;
    double minLong = p.first.points.first.longitude;
    double maxLat = p.first.points.first.latitude;
    double maxLong = p.first.points.first.longitude;

    p.forEach((poly) {
      poly.points.forEach((point) {
        if (point.latitude < minLat) minLat = point.latitude;
        if (point.latitude > maxLat) maxLat = point.latitude;
        if (point.longitude < minLong) minLong = point.longitude;
        if (point.longitude > maxLong) maxLong = point.longitude;
      });
    });
    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(minLat, minLong),
            northeast: LatLng(maxLat, maxLong)),
        90));
  }
}
