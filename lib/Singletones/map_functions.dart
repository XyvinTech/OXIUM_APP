import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/View/Homepage/homepage.dart';
import 'package:freelancer_app/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

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
  late GoogleMapController dirMapController;
  late StreamSubscription mapStream;
  double zoom = 16;
  Position? curPos;
  Set<Marker> markers_homepage = {};
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  String polylineString = '';
  Timer? timer;
  Uint8List? bytesBlue, bytesGreen, navigationMarker;
  String googleApiKey = "AIzaSyC-KnRoUdTT4_xQ_xbyVkvXPoKUNTZptnE";
  var googlePlace = GooglePlace('AIzaSyC-KnRoUdTT4_xQ_xbyVkvXPoKUNTZptnE');

  Rx<CameraPosition> initialPosition = CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962), zoom: 15)
      .obs;

  void initCameraPosition(LatLng latLng) {
    initialPosition.value = CameraPosition(target: latLng, zoom: zoom);
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
    return null;
  }

  Future<void> myPositionListener() async {
    if ((await checkLocationPermission()))
      mapStream = await Geolocator.getPositionStream().listen((event) async {
        // await animateToNewPosition(LatLng(event.latitude, event.longitude));
        curPos = event;
      });
  }

  Future<void> animateToNewPosition(LatLng latLng, {double? newZoom}) async {
    await controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: latLng, zoom: newZoom ?? zoom),
    ));
  }

  void setMapFitToPolyline(Set<Polyline> p, GoogleMapController controller) {
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

  addMarkerHomePage({
    required String name,
    required LatLng latLng,
    required bool isGreen,
    required HomePageController controller,
  }) {
    markers_homepage.add(Marker(
        onTap: () async {
          //TODO: show bottom sheet when clicked on marker
          await MapFunctions().animateToNewPosition(latLng);
          //TODO: you should pass the model here to show on bottom sheet when clicked
          Future.delayed(Duration(milliseconds: 500), () {
            showBottomSheetWhenClickedOnMarker(null, controller);
          });
        },
        markerId: MarkerId(name),
        // infoWindow: InfoWindow(title: name),
        icon: BitmapDescriptor.fromBytes(isGreen ? bytesGreen! : bytesBlue!),
        position: latLng,
        anchor: Offset(.5, .5)));
  }

  Future<List<AutocompletePrediction>?> searchPlaceByName(String place) async {
    var result = await googlePlace.autocomplete.get(
      place,
      origin: LatLon(
          MapFunctions().curPos!.latitude, MapFunctions().curPos!.longitude),
      location: LatLon(
          MapFunctions().curPos!.latitude, MapFunctions().curPos!.longitude),
    );

    if (result != null && result.predictions != null) {
      result.predictions!.forEach((element) {
        log(element.placeId.toString());
        log(element.description.toString());
      });
    }

    return result?.predictions ?? [];
  }

  Future<DetailsResponse?> getDetailsByPlaceId(String placeId) async {
    DetailsResponse? res = await googlePlace.details.get(placeId);
    if (res != null && res.status == 'OK') {
      print(res.result!.geometry!.location!.lat);
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
    log('get directions');
    PolylinePoints polylinePoints = PolylinePoints();
    DirectionsService.init(googleApiKey);
    final directinosService = DirectionsService();
    DirectionsResult? finalResponse;

    // '${pickup.lat},${pickup.lng}'
    final request = await DirectionsRequest(
      origin: 'place_id:' + source.placeId!,
      destination: 'place_id:' + destination.placeId!,
    );

    await directinosService.route(request,
        (DirectionsResult response, DirectionsStatus? status) async {
      if (status == DirectionsStatus.ok) {
        List<LatLng> polylineOne = [];
        polylineString = response.routes!.first.overviewPolyline!.points!;
        log(polylineString);
        //DECODE POLYLINE
        polylineOne = polylinePoints
            .decodePolyline(polylineString)
            .map((e) => LatLng(e.latitude, e.longitude))
            .toList();
        var legs = response.routes!.first.legs!;
        addCircleOnSourceDest(
          name: 'source',
          lat: legs[0].startLocation!.latitude,
          lng: legs[0].startLocation!.longitude,
          bytes: bytesBlue,
        );
        addCircleOnSourceDest(
          name: 'destination',
          lat: legs[legs.length - 1].startLocation!.latitude,
          lng: legs[legs.length - 1].startLocation!.longitude,
          bytes: bytesBlue,
        );

        polylines.add(Polyline(
          polylineId: PolylineId('1'),
          points: polylineOne,
          color: Colors.grey.withOpacity(1),
          width: 3,
        ));
        // setMapFitToPolyline(polylines, dirMapController);

        polylineString = response.routes!.first.overviewPolyline!.points!;
        finalResponse = response;
        // animatePolyline(response.routes!.first.overviewPolyline!.points!);
      } else {
        // do something with error response
        log('failed to get directions');
      }
    });
    log('direction get complete');
    return finalResponse;
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
}
