import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;

import '../Utils/routes.dart';

class MapFunctions {
  //make it singleTone class
  static final MapFunctions _singleton = MapFunctions._internal();
  factory MapFunctions() {
    return _singleton;
  }
  MapFunctions._internal();
  //code starts from here
  bool isFocused = true;
  bool isIdle = false;
  late GoogleMapController controller;
  GoogleMapController? dirMapController;
  late StreamSubscription mapStream;
  StreamSubscription<CompassEvent>? headingListener;
  late Timer mapTimer;
  double zoom = 10;
  Position curPos = kPosition;
  RxString curPosName = ''.obs;
  RxString curPosPlaceId = ''.obs;
  Set<Marker> markers_homepage = {};
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  String polylineString = '';
  RxInt reload = 0.obs;
  Rx<DirectionsResult> directionsResult = DirectionsResult().obs;
  RxInt steps = 0.obs;
  double heading = 0;
  RxInt stepDistance = 0.obs;
  RxInt awayDistance = 0.obs;
  RxString maneuverText = ''.obs;
  Timer? timer;
  Uint8List? bytesBlue,
      bytesGreen,
      bytesGray,
      navigationMarker,
      carMarker,
      myMarker;
  String googleApiKey = "AIzaSyCGj0hRgN-cr02TaGzHjCY9QilpB5nsMAs";
  var googlePlace = GooglePlace('AIzaSyCGj0hRgN-cr02TaGzHjCY9QilpB5nsMAs');

  Rx<CameraPosition> initialPosition =
      CameraPosition(target: LatLng(10.6732, 76.6413), zoom: 7.5, bearing: 0)
          .obs;

  void dispose() {
    controller.dispose();
    mapStream.cancel();
    dirMapController?.dispose();
    headingListener?.cancel();
    mapTimer.cancel();
  }

  void initCameraPosition(LatLng latLng) {
    initialPosition.value =
        CameraPosition(target: latLng, zoom: zoom, bearing: 0);
  }

  void setMapStyle(GoogleMapController controller) {
    controller.setMapStyle('''
    [
  {
    "featureType": "all",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#F2F6FC"
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
    {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        // "color": "#c9c9c9"
        "color": "#519fed"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
  ]
    ''');
  }

  Future<bool> checkLocationPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        kLog('Location permissions are denied');
        return false;
      }
    }
    return true;
  }

  Future<Position?> getLastLocation() async {
    return await Geolocator.getLastKnownPosition();
  }

  Future<Position?> getCurrentPosition() async {
    isFocused = true;
    if (await checkLocationPermission())
      return await Geolocator.getCurrentPosition();
    return null;
  }

  Future<void> myPositionListener() async {
    kLog('listener');
    if ((await checkLocationPermission())) {
      startMapTimer();
      getHeading();
      mapStream = await Geolocator.getPositionStream().listen((event) async {
        curPos = event;
        updateMarkers(event);
      });
    }
  }

  getHeading() {
    headingListener = FlutterCompass.events?.listen((event) {
      heading = event.heading ?? 0;
    });
  }

  startMapTimer() {
    mapTimer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (Get.currentRoute == Routes.navigationPageRoute) {
        addCarMarker(curPos);
        checkForUpdateSteps();
      }
      addMyPositionMarker(curPos, markers_homepage);
      reload++;
    });
  }

  updateMarkers(Position event) {
    if (Get.currentRoute == Routes.navigationPageRoute) {
      animateForNavigation(event);
    } else if (isFocused) {
      // controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      //   target: LatLng(event.latitude, event.longitude),
      //   zoom: zoom,
      //   // bearing: heading
      //   bearing: 0,
      // )));
    }
  }

  addCarMarker(Position event) {
    markers.removeWhere((element) => element.markerId == 'myCar');
    markers.add(Marker(
        markerId: MarkerId('myCar'),
        // infoWindow: InfoWindow(title: name),
        icon: BitmapDescriptor.fromBytes(MapFunctions().carMarker!),
        position: LatLng(event.latitude, event.longitude),
        rotation: heading + 90,
        anchor: Offset(.5, .5)));
  }

  addMyPositionMarker(Position event, Set<Marker> set) {
    set.removeWhere((element) => element.markerId == MarkerId('myMarker'));
    set.add(Marker(
        markerId: MarkerId('myMarker'),
        // infoWindow: InfoWindow(title: name),
        icon: BitmapDescriptor.fromBytes(MapFunctions().myMarker!),
        position: LatLng(event.latitude, event.longitude),
        rotation: heading + 90,
        anchor: Offset(.5, .5)));
  }

  Future<void> animateToNewPosition(LatLng latLng,
      {double? newZoom, double bearing = 0}) async {
    await controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: latLng, zoom: newZoom ?? zoom, bearing: bearing),
    ));
  }

  void setMapFitToPolyline(
    Set<Polyline> p,
    GoogleMapController controller, {
    bool isNavigation = false,
  }) async {
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
    await controller.moveCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(minLat, minLong),
            northeast: LatLng(maxLat, maxLong)),
        30));
    zoom = await dirMapController!.getZoomLevel();
    var leg = directionsResult.value.routes!.first.legs!.first;
    controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng((minLat + maxLat) / 2, (minLong + maxLong) / 2),
        zoom: zoom - .5,
        bearing: heading
        // bearingBetween(
        //         leg.startLocation!.latitude,
        //         leg.startLocation!.longitude,
        //         leg.endLocation!.latitude,
        //         leg.endLocation!.longitude) -
        //     90

        )));
    // Future.delayed(Duration(milliseconds: 4000), () async {
    //   // ScreenCoordinate minScreen =
    //   //     await controller.getScreenCoordinate(LatLng(minLat, minLong));
    //   // ScreenCoordinate maxScreen =
    //   //     await controller.getScreenCoordinate(LatLng(maxLat, maxLong));
    //   // print(minScreen);
    //   // print(maxScreen);
    //   // print(size);
    //   // print(isNavigation);
    //   // if (isNavigation) {
    //   //   controller.animateCamera(CameraUpdate.zoomBy(-.7));
    //   //   Future.delayed(Duration(milliseconds: 500), () {
    //   //     controller.animateCamera(CameraUpdate.scrollBy(0, -55));
    //   //   });
    //   // } else {
    //   //   await controller.animateCamera(CameraUpdate.zoomBy(
    //   //       (minScreen.y - maxScreen.y) > size.height * .50 ? -1.12 : 0));
    //   // }
    //   // await controller.animateCamera(CameraUpdate.zoomBy(
    //   //     (minScreen.y - maxScreen.y) > size.height * .50 ? -1.12 : 0));
    //   // if (isNavigation) controller.animateCamera(CameraUpdate.scrollBy(0, 20));
    // });
  }

  addMarkerHomePage({
    required String id,
    required LatLng latLng,
    required bool isBusy,
    required HomePageController controller,
    required String status,
  }) {
    markers_homepage.add(Marker(
        onTap: () async {
          MapFunctions().isFocused = false;
          await MapFunctions().animateToNewPosition(latLng);
          Future.delayed(Duration(milliseconds: 500), () {
            controller.getChargeStationDetails(id);
          });
        },
        markerId: MarkerId(id),
        icon: BitmapDescriptor.fromBytes(status == 'disConnected'
            ? bytesGray!
            : isBusy
                ? bytesGreen!
                : bytesBlue!),
        position: latLng,
        anchor: Offset(.5, .5)));
  }

  Future<List<AutocompletePrediction>?> searchPlaceByName(String place) async {
    try {
      var result = await googlePlace.autocomplete.get(
        place,
        origin: LatLon(curPos.latitude, curPos.longitude),
        location: LatLon(curPos.latitude, curPos.longitude),
      );
      if (result != null && result.predictions != null) {
        result.predictions!.forEach((element) {
          kLog(element.placeId.toString());
          kLog(element.description.toString());
        });
      }

      return result?.predictions ?? [];
    } on Exception catch (e) {
      // TODO
      kLog(e.toString());
    }

    return [];
  }

  Future<DetailsResponse?> getDetailsByPlaceId(String placeId) async {
    DetailsResponse? res = await googlePlace.details.get(placeId);
    if (res != null && res.status == 'OK') {
      // print(res.result!.geometry!.location!.lat);
      return res;
    }
    return null;
  }

  addCircleOnSourceDest({
    required String name,
    required double lat,
    required double lng,
    required var bytes,
  }) {
    markers.add(Marker(
        markerId: MarkerId(name),
        // infoWindow: InfoWindow(title: name),
        icon: BitmapDescriptor.fromBytes(bytes),
        position: LatLng(lat, lng),
        anchor: Offset(.5, .5)));
  }

  Future<DirectionsResult?> getDirections(
      AutocompletePrediction source, AutocompletePrediction destination) async {
    kLog('get directions');
    PolylinePoints polylinePoints = PolylinePoints();
    DirectionsService.init(googleApiKey);
    final directinosService = DirectionsService();
    DirectionsResult? finalResponse;
    polylineString = '';
    polylines = {};
    markers = {};
    //TODO: get the place id of source and destination if it is not available (if user choose my location)

    // '${pickup.lat},${pickup.lng}'
    final request = await DirectionsRequest(
      origin: 'place_id:' + source.placeId!,
      destination: 'place_id:' + destination.placeId!,
    );

    try {
      await directinosService.route(request,
          (DirectionsResult response, DirectionsStatus? status) {
        if (status == DirectionsStatus.ok) {
          List<LatLng> polylineOne = [];
          polylineString = response.routes!.first.overviewPolyline!.points!;
          kLog(polylineString);
          //DECODE POLYLINE
          polylineOne = polylinePoints
              .decodePolyline(polylineString)
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList();
          var legs = response.routes!.first.legs!;
          addCircleOnSourceDest(
            name: 'source',
            lat: legs.first.startLocation!.latitude,
            lng: legs.first.startLocation!.longitude,
            bytes: navigationMarker,
          );
          kLog(legs.first.endLocation.toString());
          kLog(legs.first.startLocation.toString());
          addCircleOnSourceDest(
            name: 'destination',
            lat: legs.first.endLocation!.latitude,
            lng: legs.first.endLocation!.longitude,
            bytes: navigationMarker,
          );

          polylines.add(Polyline(
            polylineId: PolylineId('1'),
            points: polylineOne,
            color: Color(0xff0047c3),
            width: 3,
          ));
          // setMapFitToPolyline(polylines, dirMapController);

          polylineString = response.routes!.first.overviewPolyline!.points!;
          finalResponse = response;
          MapFunctions().directionsResult.value = response;
          // animatePolyline(response.routes!.first.overviewPolyline!.points!);
        } else {
          // do something with error response
          kLog('failed to get directions');
        }
      });
      kLog('direction get complete');
      return finalResponse;
    } on Exception {
      // TODO
      return null;
    }
    return null;
  }

  animatePolyline(String points, RxInt reload) {
    List<LatLng> polylinethree = [];
    List<PointLatLng> polyList = PolylinePoints().decodePolyline(points);

    int i = 0;
    timer = Timer.periodic(Duration(milliseconds: 20), (_timer) {
      if (i >= polyList.length) {
        i = 0;
        polylinethree.clear();
      }
      polylinethree.add(LatLng(polyList[i].latitude, polyList[i].longitude));
      i++;
      polylines.add(Polyline(
        polylineId: PolylineId('animated'),
        points: polylinethree,
        color: Color(0xff0047C3),
        width: 3,
      ));
      reload++;
    });
  }

  Future<List<String>> getNameAndPlaceIdFromLatLng(
      double lat, double lng) async {
    var endpoint =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleApiKey';
    var response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['results'].isNotEmpty) {
        kLog(json['results'][0]['place_id'].toString());
        return [
          json['results'][0]['formatted_address'],
          json['results'][0]['place_id'],
        ];
      }
    }
    return ['', ''];
  }

  Future<List<String>> getMyLocationNameAndPlaceId() async {
    if (curPos.latitude == 0) await getCurrentPosition();
    if (curPos.latitude == 0) return ['', ''];

    var res =
        await getNameAndPlaceIdFromLatLng(curPos.latitude, curPos.longitude);
    curPosName.value = res[0];
    curPosPlaceId.value = res[1];
    return [curPosName.value, curPosPlaceId.value];
  }

  static double distanceBetweenCoordinates(
      double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371000; // in meters

    double dLat = (lat2 - lat1) * pi / 180;
    double dLon = (lon2 - lon1) * pi / 180;

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180) *
            cos(lat2 * pi / 180) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double d = earthRadius * c;

    return d;
  }

  static bool areCoordinatesEqual(
      double lat1, double lon1, double lat2, double lon2) {
    double distance = distanceBetweenCoordinates(lat1, lon1, lat2, lon2);
    double threshold = 50; // in meters, adjust as necessary
    return distance < threshold;
  }

  List? stepList = [];
  void checkForUpdateSteps() {
    if (directionsResult.value.routes == null) return;
    stepList = directionsResult.value.routes?.first.legs?.first.steps ?? [];
    directionsResult.value.routes?.first.legs?.first.steps!.first.instructions;
    kLog(stepList!.length.toString());
    if (stepList != null && stepList!.isNotEmpty) {
      if (steps.value == 0 ||
          areCoordinatesEqual(
              curPos.latitude,
              curPos.longitude,
              stepList![steps.value].startLocation!.latitude,
              stepList![steps.value].startLocation!.longitude)) {
        //If it's the steps end then update the step card and push to next step
        stepDistance.value = stepList![steps.value].distance.value;

        // kLog(steps.toString());
        steps++;
        steps.value = steps.value % (stepList!.length);
        String text = stepList![steps.value].instructions;
        // text = text.replaceAll('<b>', '').replaceAll('</b>', '');
        if (text.isEmpty)
          maneuverText.value = 'Go Straight';
        else
          maneuverText.value = text;

        int sum = 0;
        int? val;
        // kLog('length of  steps ${stepList!.length}');
        for (int i = steps.value; i < stepList!.length; i++) {
          kLog('step: $i');
          kLog(stepList![i].instructions.toString());
          val = stepList![i].distance.value;
          sum += val == null ? 0 : val;
        }
        awayDistance.value = sum;
      }
    }
    // kLog(stepDistance.value.toString());
    // kLog(awayDistance.value.toString());
    // showSuccess('${stepDistance.value}  ${awayDistance.value}');
  }

  static double bearingBetween(
      double lat1, double lon1, double lat2, double lon2) {
    var degToRad = pi / 180.0;
    var phi1 = lat1 * degToRad;
    var phi2 = lat2 * degToRad;
    var deltaTheta = (lon2 - lon1) * degToRad;
    var theta = atan2(sin(deltaTheta) * cos(phi2),
        cos(phi1) * sin(phi2) - sin(phi1) * cos(phi2) * cos(deltaTheta));
    return (theta * 180.0 / pi);
  }

  animateForNavigation(Position event) {
    dirMapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(event.latitude, event.longitude),
          zoom: 16,
          bearing: heading),
    ));
  }
}
