class OrderModel {
  final int id;
  String title;
  String subtitle;
  bool isDisconnected;
  OrderModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isDisconnected,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      isDisconnected: json['isDisconnected'],
    );
  }

  Map<String, dynamic> toJson() => {
        "transactionId": 34,
        "type": "RZRWeb",
        "pgOrderId": "order_LVIzlI3gdJevpg",
        "pgPaymentId": null,
        "bookingId": null,
        "appuserName": "9782199455",
        "amount": 10.0,
        "pgSIgnature": null,
        "status": "I",
        "pgOrderGenTime": "2023-03-24T09:04:18.119+0000",
        "lastUpdateTime": null,
        "pgLog": "{\"amount\":1000,\"amount_paid\":0,\"notes\":[],\"created_at\":1679648658,\"amount_due\":1000,\"currency\":\"INR\",\"receipt\":\"1\",\"id\":\"order_LVIzlI3gdJevpg\",\"entity\":\"order\",\"offer_id\":null,\"status\":\"created\",\"attempts\":0}",
        "paymentMode": null,
        "statusUpdateBy": null
      };
}
