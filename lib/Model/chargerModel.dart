import 'evPortsModel.dart';

class ChargerModel {
  final String charger_name;
  final String outputType;
  final int totalPorts;
  final List<EvPortModel> evports;

  ChargerModel({
    required this.charger_name,
    required this.outputType,
    required this.totalPorts,
    required this.evports,
  });

  factory ChargerModel.fromJson(Map<String, dynamic> json) {
    return ChargerModel(
      charger_name: json['charger_name'],
      outputType: json['outputType'] ?? '',
      totalPorts: json['totalPorts'] ?? 0,
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
        "evports": evports.map((e) => e.toJson()).toList(),
      };
}
