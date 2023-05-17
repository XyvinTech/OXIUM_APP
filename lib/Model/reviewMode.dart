class ReviewModel {
  final int stationId;
  final String name;
  final String userName;
  final String image;
  final int rating;
  final String review;
  final String creationDateTime;

  ReviewModel({
    required this.stationId,
    required this.name,
    required this.image,
    required this.rating,
    required this.review,
    required this.creationDateTime,
    required this.userName,
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      stationId: json['stationId'],
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating'] ?? 0,
      review: json['review'] ?? '',
      userName: json['userName'] ?? '',
      creationDateTime: json['creationDateTime'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        "stationId": stationId,
        "name": name,
        "image": image,
        "rating": rating,
        "review": review,
        "userName": userName,
        "creationDateTime": creationDateTime
      };
}

