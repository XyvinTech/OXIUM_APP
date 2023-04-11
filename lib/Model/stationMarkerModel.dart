class StationMarkerModel {
  final int id;
  final double lattitude;
  final double longitude;
  final bool isBusy;
  final String amenities;
  final String charger_status;
  final String ac_dc;
  final String charger_type;
  final String charger_capacity;

  StationMarkerModel({
    required this.id,
    required this.lattitude,
    required this.longitude,
    required this.isBusy,
    required this.amenities,
    required this.charger_status,
    required this.ac_dc,
    required this.charger_type,
    required this.charger_capacity,
  });

  factory StationMarkerModel.fromJson(Map<String, dynamic> json) {
    return StationMarkerModel(
      id: json['id'],
      lattitude: json['lattitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
      isBusy: json['Busy'] ?? false,
      amenities: json['amenities'] ?? '',
      charger_status: json.containsKey('filter')
          ? json['filter']['charger_status'] ?? ''
          : '',
      ac_dc:
          json.containsKey('filter') ? json['filter']['outputType'] ?? '' : '',
      charger_type: json.containsKey('filter')
          ? json['filter']['connectorType'] ?? ''
          : '',
      charger_capacity:
          json.containsKey('filter') ? json['filter']['capacity'] ?? '' : '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "lattitude": lattitude,
        "longitude": longitude,
        "Busy": isBusy,
        "amenities": amenities,
        "filter": {
          "charger_status": charger_status,
          "outputType": ac_dc,
          "connectorType": charger_type,
          "capacity": charger_capacity
        }
      };
}
