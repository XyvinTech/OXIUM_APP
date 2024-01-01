import 'evPortsModel.dart';

class ChargerModel {
  final String chargerName;
  final String outputType;
  // final int totalPorts;
  final String capacity;
  final String tariff;
  final String ocppStatus;
  final List<EvPortModel> evports;

  ChargerModel({
    required this.chargerName,
    required this.outputType,
    // required this.totalPorts,
    required this.evports,
    required this.capacity,
    required this.tariff,
    required this.ocppStatus,
  });

  factory ChargerModel.fromJson(Map<String, dynamic> json) {
    return ChargerModel(
      chargerName: json['chargerName'],
      outputType: json['outputType'] ?? '',
      // totalPorts: json['totalPorts'] ?? 0,
      capacity: json['capacity'] ?? '',
      ocppStatus: json['ocppStatus'] ?? '',
      tariff: json['tariff'] ?? '',
      evports: json['evports']
              .map<EvPortModel>((e) => EvPortModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        "chargerName": chargerName,
        "outputType": outputType,
        // "totalPorts": totalPorts,
        "capacity": capacity,
        "tariff": tariff,
        "ocppStatus": ocppStatus,
        "evports": evports.map((e) => e.toJson()).toList(),
      };
}
