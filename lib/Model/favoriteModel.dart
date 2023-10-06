class FavoriteModel {
  final int id;
  final String rating;
  final String name;
  final String image;
  final double lattitude;
  final double longitude;
  FavoriteModel({
    required this.id,
    required this.rating,
    required this.name,
    required this.image,
    required this.lattitude,
    required this.longitude,
  });
  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'] ?? -1,
      rating: json['rating'] == 'null' ? '0' : json['rating'] ?? '0',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      lattitude: json['lattitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "name": name,
        "image": image,
        "lattitude": lattitude,
        "longitude": longitude
      };
}
