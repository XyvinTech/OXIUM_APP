import 'package:get/get.dart';

import '../Model/vehiclesModel.dart';

class VehiclesScreenController extends GetxController {
  RxBool isSelectColor = false.obs;
  RxBool isVehicleColor = false.obs;
  RxInt isSelectedindex = (-1).obs;
  RxInt isIndex = 0.obs;
  RxInt isIndex1 = 0.obs;
  RxInt isSelectedVehicleindex = (-1).obs;

  List vehiclesdata = [
    VehiclesModel(image: "assets/images/jeep.png", vehiclesName: "Jeep"),
    VehiclesModel(image: "assets/images/misth.png", vehiclesName: "Misth"),
    VehiclesModel(image: "assets/images/jeep.png", vehiclesName: "Jeep"),
    VehiclesModel(image: "assets/images/misth.png", vehiclesName: "Misth"),
    VehiclesModel(image: "assets/images/jeep.png", vehiclesName: "Jeep"),
    VehiclesModel(image: "assets/images/misth.png", vehiclesName: "Misth"),
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
