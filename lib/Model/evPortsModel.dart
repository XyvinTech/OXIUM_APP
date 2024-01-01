class EvPortModel {
  final int seqNumber;
  // final String identificationNumber;
  final String ocppStatus;
  final String connectorType;
  // final double energyKWh;
  EvPortModel({
    required this.seqNumber,
    // required this.identificationNumber,
    required this.ocppStatus,
    required this.connectorType,
    // required this.energyKWh,
  });

  factory EvPortModel.fromJson(Map<String, dynamic> json) {
    return EvPortModel(
      seqNumber: json['seqNumber'],
      // identificationNumber: json['identificationNumber'] ?? '',
      ocppStatus: json['ocppStatus'] ?? '',
      connectorType: json['connectorType'] ?? '',
      // energyKWh: json['energyKWh'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "seqNumber": seqNumber,
        // "identificationNumber": identificationNumber,
        "ocppStatus": ocppStatus,
        "connectorType": connectorType,
        // "energyKWh": energyKWh
      };
}
