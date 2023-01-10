import 'package:flutter/cupertino.dart';

class VehiclesModel {
  String image;
  String vehiclesName;
  VehiclesModel({required this.image, required this.vehiclesName});
  factory VehiclesModel.fromjson(Map<String, dynamic> json) {
    return VehiclesModel(
        image: json["image"], vehiclesName: json["vehiclesName"]);
  }

  // List vehiclesdata = [
  //   VehiclesModel(image: "assets/images/jeep.png", vehiclesName: "Jeep"),
  //   VehiclesModel(image: "assets/images/misth.png", vehiclesName: "Misth"),
  //   VehiclesModel(image: "assets/images/jeep.png", vehiclesName: "Jeep"),
  //   VehiclesModel(image: "assets/images/misth.png", vehiclesName: "Misth"),
  // ];
}
