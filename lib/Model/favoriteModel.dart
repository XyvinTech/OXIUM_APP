class FavoriteModel {
  final String id;
  final String rating;
  final String name;
  final String image;
  final double latitude;
  final double longitude;
  FavoriteModel({
    required this.id,
    required this.rating,
    required this.name,
    required this.image,
    required this.latitude,
    required this.longitude,
  });
  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'] ?? '-1',
      rating: json['rating'].toString(),
      name: json['name'] ?? '',
      image: json['image'] ??
          'https://sternbergclinic.com.au/wp-content/uploads/2020/03/placeholder.png',
      latitude: json['latitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "name": name,
        "image": image,
        "latitude": latitude,
        "longitude": longitude
      };
}
