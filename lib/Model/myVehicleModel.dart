class MyVehicleModel {
  int userEVId;
  String username;
  String make;
  String model;
  String defaultVehicle;
  String evRegNumber;
  MyVehicleModel({
    required this.userEVId,
    required this.username,
    required this.make,
    required this.model,
    required this.defaultVehicle,
    required this.evRegNumber,
  });
  factory MyVehicleModel.fromjson(Map<String, dynamic> json) {
    return MyVehicleModel(
      userEVId: json['userEVId'],
      username: json['username'] ?? '',
      make: json['make'] ?? '',
      model: json['model'],
      defaultVehicle: json['defaultVehicle'],
      evRegNumber: json['evRegNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
        "userEVId": userEVId,
        "username": username,
        "make": make,
        "model": model,
        "defaultVehicle": defaultVehicle,
        "evRegNumber": evRegNumber
      };
}
