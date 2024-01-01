class StationMarkerModel {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final double rating;
  final bool isBusy;
  final String amenities;
  final String charger_status;
  final String ac_dc;
  final String charger_type;
  final String charger_capacity;

  StationMarkerModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.address,
    required this.isBusy,
    required this.amenities,
    required this.charger_status,
    required this.ac_dc,
    required this.charger_type,
    required this.charger_capacity,
  });

  factory StationMarkerModel.fromJson(Map<String, dynamic> json) {
    return StationMarkerModel(
      id: json['_id'],
      latitude: json['latitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
      rating: json['rating'].toDouble() ?? 0,
      isBusy: json['isBusy'] ?? false,
      amenities: json['amenities'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      charger_status: json['charger_status'] ?? '',
      ac_dc: json['outputType'] ?? '',
      charger_type: json['connectorType'] ?? '',
      charger_capacity: json['capacity'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "latitude": latitude,
        "longitude": longitude,
        "isBusy": isBusy,
        "amenities": amenities,
        "name": name,
        "address": address,
        "rating": rating,
        "charger_status": charger_status,
        "outputType": ac_dc,
        "connectorType": charger_type,
        "capacity": charger_capacity
      };
}
