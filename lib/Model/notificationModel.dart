class NotificationModel {
  // final int id;
  final String title;
  final String body;
  final String timestamp;
  final String imageUrl;
  // final bool isPromotional;

  NotificationModel({
    // required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    required this.imageUrl,
    // required this.isPromotional,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      // id: json['id'],
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      timestamp: json['ts'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      // isPromotional: json['isPromotional'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "body": body,
        "title": title,
        "imageUrl": imageUrl,
        "ts": timestamp,
        // "isPromotional": isPromotional,
        // "id": id
      };
}
