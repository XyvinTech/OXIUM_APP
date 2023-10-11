class VehicleModel {
  int id;
  final String icon;
  String vehicleDetails;
  final String modelName;
  final String outputType;
  final String typeOfPorts;
  final String evRegNumber;
  final String defaultVehicle;
  final String year;
  final int ratedVoltages;
  final int capacity;
  final int numberOfPorts;
  List evPort;
  VehicleModel({
    required this.id,
    required this.icon,
    required this.vehicleDetails,
    required this.modelName,
    required this.year,
    required this.evRegNumber,
    required this.outputType,
    required this.typeOfPorts,
    required this.ratedVoltages,
    required this.capacity,
    required this.numberOfPorts,
    required this.evPort,
    required this.defaultVehicle,
  });
  factory VehicleModel.fromjson(Map<String, dynamic> json) {
    return VehicleModel(
        id: json['id']??-1,
        icon: json['icon'] ?? '',
        vehicleDetails: json['vehicleDetails'] ?? '',
        defaultVehicle: json['defaultVehicle'] ?? '',
        evRegNumber: json['evRegNumber'] ?? '',
        year: json['year'] ?? '',
        modelName: json['modelName'] ?? '',
        outputType: json['outputType'] ?? '',
        typeOfPorts: json['typeOfPorts'] ?? '',
        ratedVoltages: json['ratedVoltages'] ?? 0,
        capacity: json['capacity'] ?? 0,
        numberOfPorts: json['numberOfPorts'] ?? 0,
        evPort: json['evPort'] ?? []);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        'icon': icon.isEmpty ? null : icon,
        "vehicleDetails": vehicleDetails,
        "modelName": modelName,
        "evRegNumber": evRegNumber,
        "outputType": outputType,
        "typeOfPorts": typeOfPorts,
        "ratedVoltages": ratedVoltages,
        "capacity": capacity,
        "numberOfPorts": numberOfPorts,
        "evPort": evPort,
        "year": year
        // [
        //   {"evPortSeq": 1, "connectorType": "Type 2 ", "energyKWh": 12121.0}
        // ],
      };
}
