class ReviewModel {
  // final int stationId;
  // final String name;
  final String userName;
  final String image;
  final int rating;
  final String review;
  final String createdAt;

  ReviewModel({
    // required this.stationId,
    // required this.name,
    required this.image,
    required this.rating,
    required this.review,
    required this.createdAt,
    required this.userName,
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      // stationId: json['stationId'],
      // name: json['name'] ?? '',
      image: json['image'] == ''
          ? 'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg'
          : json['image'] ??
              'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg',
      rating: json['rating'] ?? 0,
      review: json['comment'] ?? '',
      userName: json['username'] ?? '',
      createdAt: json['createdAt'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        // "stationId": stationId,
        // "name": name,
        "image": image,
        "rating": rating,
        "comment": review,
        "username": userName,
        "createdAt": createdAt
      };
}
