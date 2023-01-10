import 'package:freelancer_app/Bindings/homepage_binding.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:freelancer_app/Utils/image_byte_converter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageController extends GetxController {
  RxDouble height = 80.0.obs;
  RxString name = ''.obs;
  RxString done = 'do'.obs;
  RxInt activeIndex = 0.obs;
  RxInt reload = 0.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    MapFunctions().bytesBlue = await ImageByteConverter.getBytesFromAsset(
        "assets/svg/blue_marker.png", 50);
    MapFunctions().bytesGreen = await ImageByteConverter.getBytesFromAsset(
        "assets/svg/green_marker.png", 50);
    Future.delayed(Duration(milliseconds: 1000), () {
      MapFunctions().myPositionListener();
    });
    var pos = await MapFunctions().getCurrentPosition();
    MapFunctions().animateToNewPosition(LatLng(pos!.latitude, pos.longitude));
  }
}
