class VehicleModel {
  int id;
  String icon;
  String vehicleDetails;
  String modelName;
  String outputType;
  String typeOfPorts;
  String evRegNumber;
  int ratedVoltages;
  int capacity;
  int numberOfPorts;
  List evPort;
  VehicleModel({
    required this.id,
    required this.icon,
    required this.vehicleDetails,
    required this.modelName,
    required this.evRegNumber,
    required this.outputType,
    required this.typeOfPorts,
    required this.ratedVoltages,
    required this.capacity,
    required this.numberOfPorts,
    required this.evPort,
  });
  factory VehicleModel.fromjson(Map<String, dynamic> json) {
    return VehicleModel(
        id: json['id'],
        icon: json['icon'] ?? '',
        vehicleDetails: json['vehicleDetails'] ?? '',
        evRegNumber: json['evRegNumber'] ?? '',
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
        "evPort": evPort
        // [
        //   {"evPortSeq": 1, "connectorType": "Type 2 ", "energyKWh": 12121.0}
        // ],
      };
}
