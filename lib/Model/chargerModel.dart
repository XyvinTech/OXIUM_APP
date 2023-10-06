import 'evPortsModel.dart';

class ChargerModel {
  final String charger_name;
  final String outputType;
  final int totalPorts;
  final String capacity;
  final double tariff;
  final String ocppStatus;
  final List<EvPortModel> evports;

  ChargerModel({
    required this.charger_name,
    required this.outputType,
    required this.totalPorts,
    required this.evports,
    required this.capacity,
    required this.tariff,
    required this.ocppStatus,
  });

  factory ChargerModel.fromJson(Map<String, dynamic> json) {
    return ChargerModel(
      charger_name: json['charger_name'],
      outputType: json['outputType'] ?? '',
      totalPorts: json['totalPorts'] ?? 0,
      capacity: json['capacity'] ?? '',
      ocppStatus: json['ocppStatus'] ?? '',
      tariff: json['tariff'] ?? 0,
      evports: json['evports']
              .map<EvPortModel>((e) => EvPortModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        "charger_name": charger_name,
        "outputType": outputType,
        "totalPorts": totalPorts,
        "capacity": capacity,
        "tariff": tariff,
        "ocppStatus": ocppStatus,
        "evports": evports.map((e) => e.toJson()).toList(),
      };
}
