import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/Model/stationMarkerModel.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FilterScreenController extends GetxController {
  RxInt selectedParent = 0.obs;
  RxInt reload = 0.obs;
  List<String> parentList = [
    'Charger Status',
    'AC/DC',
    'Charger Type',
    'Charger Capacity',
    'Facilities',
  ];
  List<StationMarkerModel> station_marker_List = [], list = [];

  @override
  void onInit() {
    // TODO: implement onInit
    station_marker_List = Get.arguments ?? [];
    super.onInit();
  }

  applyFilter() {
    int i = 0;
    bool isAtLeastOneSelected = false;
    appData.filterList.forEach((section) {
      section.forEach((element) {
        if (element.isSelected) {
          isAtLeastOneSelected = true;
          String title = element.title.toLowerCase();
          String capacity;
          station_marker_List.forEach((station) {
            capacity = station.charger_capacity.replaceAll(',', 'KwH,');
            //if any of the station contains filter value then add it. avoid illegal contains
            if (i == 0) {
              if (element.title == 'Busy' && station.isBusy) {
                list.add(station);
              } else if (element.title == 'Available' &&
                  !station.isBusy &&
                  station.charger_status == 'Connected') {
                list.add(station);
              } else if (element.title == 'Faulty' &&
                  station.charger_status != 'Connected') {
                list.add(station);
              }
            } else if (i == 1 && station.ac_dc.toLowerCase().contains(title) ||
                i == 2 && station.charger_type.toLowerCase().contains(title) ||
                i == 3 && capacity.toLowerCase().contains(title) ||
                i == 4 && station.amenities.toLowerCase().contains(title)) {
              kLog(station.lattitude.toString());
              kLog(station.longitude.toString());
              list.add(station);
            }
          });
        }
      });
      i++;
    });
    list = list.toSet().toList();
    addToHomePageMarker(isAtLeastOneSelected);
  }

  resetFilter() {
    appData.filterList.forEach((element) {
      for (int i = 0; i < element.length; i++) {
        element[i].isSelected = false;
      }
    });
    reload++;
    list.clear();
    addToHomePageMarker(false);
  }

  addToHomePageMarker(bool isAtLeastOneSelected) {
    kLog(list.length.toString());
    HomePageController _controller = Get.find();
    MapFunctions()
        .markers_homepage
        .removeWhere((element) => element.markerId != MarkerId('myMarker'));
    if (list.isEmpty && !isAtLeastOneSelected) {
      list = station_marker_List.toList();
    }
    _controller.assignCardsToMapScreen(list);
    int index = 0;
    list.forEach((element) {
      kLog(element.lattitude.toString());
      kLog(element.longitude.toString());
      MapFunctions().addMarkerHomePage(
          id: element.id.toString(),
          latLng: LatLng(element.lattitude, element.longitude),
          isBusy: element.isBusy,
          status: element.charger_status.trim(),
          controller: _controller,
          carouselIndex: index);
      index++;
    });
    _controller.reload++;
    list.clear();
  }
}
