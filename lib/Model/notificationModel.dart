class NotificationModel {
  final int id;
  String title;
  String subtitle;
  bool isDisconnected;
  NotificationModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isDisconnected,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      isDisconnected: json['isDisconnected'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "isDisconnected": isDisconnected,
      };
}
