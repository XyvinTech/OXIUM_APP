class StationMarkerModel {
  final int stationId;
  double lattitude;
  double longitude;
  bool isBusy;
  String amenities;
  StationMarkerModel({
    required this.stationId,
    required this.lattitude,
    required this.longitude,
    required this.isBusy,
    required this.amenities,
  });

  factory StationMarkerModel.fromJson(Map<String, dynamic> json) {
    return StationMarkerModel(
      stationId: json['stationId'],
      lattitude: json['lattitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
      isBusy: json['isBusy'] ?? false,
      amenities: json['amenities'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "stationId": stationId,
        "lattitude": lattitude,
        "longitude": longitude,
        "isBusy": isBusy,
        "amenities": amenities,
      };
}
