class ChargingCafeModel {
  final int id;
  String name;
  String location;
  ChargingCafeModel({
    required this.id,
    required this.name,
    required this.location,
  });

  factory ChargingCafeModel.fromJson(Map<String, dynamic> json) {
    return ChargingCafeModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
      };
}
