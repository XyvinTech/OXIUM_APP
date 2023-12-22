import 'package:freelancer_app/Model/vehicleModel.dart';
import 'package:freelancer_app/constants.dart';

class UserModel {
  String username;
  final String id;
  final String name;
  final String image;
  final String email;
  // final String phone;
  // final String status;
  final String rfid;
  final int total_sessions;
  final double total_units;
  double balanceAmount;
  final VehicleModel defaultVehicle;

  UserModel({
    required this.id,
    required this.username,
    // required this.phone,
    required this.email,
    required this.image,
    // required this.status,
    required this.name,
    required this.total_sessions,
    required this.total_units,
    required this.rfid,
    required this.balanceAmount,
    required this.defaultVehicle,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['userId'],
      username: json['username'],
      name: json['Name'] ?? '',
      // phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      email: json['email'] ?? '',
      rfid: json['rfid'] ?? '',
      // status: json['status'] ?? '',
      total_sessions: json['total_sessions'] ?? 0,
      total_units: json['total_units'].toDouble() ?? 0,
      balanceAmount: json['wallet'] ?? 0,
      defaultVehicle: json['defaultVehicle'] != null
          ? VehicleModel.fromjson(json['defaultVehicle'])
          : kVehicleModel,
    );
  }

  // Map<String, dynamic> toJson() => {
  //       "userId": userId,
  //       "username": username,
  //       "name": name,
  //       "image": image,
  //       // "phone": phone,
  //       "email": email,
  //       "rfid": rfid,
  //       // "status": status,
  //       "total_sessions": total_sessions,
  //       "total_units": total_units,
  //       "wallet": balanceAmount,
  //       "defaultVehicle": defaultVehicle,
  //     };
}
