class SearchStationrModel {
  final int id;
  final String chargestation_name;
  final String location_name;
  final double lattitude;
  final double longitude;

  SearchStationrModel({
    required this.id,
    required this.chargestation_name,
    required this.location_name,
    required this.lattitude,
    required this.longitude,
  });

  factory SearchStationrModel.fromJson(Map<String, dynamic> json) {
    return SearchStationrModel(
      id: json['id'],
      chargestation_name: json['chargstation_name'] ?? '',
      location_name: json['location_name'] ?? '',
      lattitude: json['lattitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "chargstation_name": chargestation_name,
        "location_name": location_name,
        "lattitude": lattitude,
        "longitude": longitude
      };
}
