class OrderModel {
  final int transactionId;
  final String type;
  final String pgOrderId;
  final String pgPaymentId;
  final int bookingId;
  final String appuserName;
  final double amount;
  final String pgSIgnature;
  final String status;
  final String pgOrderGenTime;
  final String pgLog;
  final String lastUpdateTime;
  final String paymentMode;
  final String statusUpdateBy;
  final String rfidAmountPaid;

  OrderModel({
    required this.transactionId,
    required this.type,
    required this.pgOrderId,
    required this.pgPaymentId,
    required this.bookingId,
    required this.appuserName,
    required this.amount,
    required this.pgSIgnature,
    required this.status,
    required this.pgOrderGenTime,
    required this.lastUpdateTime,
    required this.paymentMode,
    required this.pgLog,
    required this.statusUpdateBy,
    required this.rfidAmountPaid,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      transactionId: json['transactionId'] ?? -1,
      type: json['type'] ?? '',
      pgOrderId: json['pgOrderId'] ?? '',
      pgPaymentId: json['pgPaymentId'] ?? '',
      bookingId: json['bookingId'] ?? -1,
      appuserName: json['appuserName'] ?? '',
      amount: json['amount'] ?? 0,
      pgSIgnature: json['pgSIgnature'] ?? '',
      status: json['status'] ?? '',
      pgLog: json['pgLog'] ?? '',
      pgOrderGenTime: json['pgOrderGenTime'] ?? '',
      lastUpdateTime: json['lastUpdateTime'] ?? '',
      paymentMode: json['paymentMode'] ?? '',
      statusUpdateBy: json['statusUpdateBy'] ?? '',
      rfidAmountPaid: json['rfidAmountPaid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "transactionId": transactionId,
        "type": type,
        "pgOrderId": pgOrderId,
        "pgPaymentId": pgPaymentId,
        "bookingId": bookingId,
        "appuserName": appuserName,
        "amount": amount,
        "pgSIgnature": pgSIgnature,
        "status": status,
        "pgOrderGenTime": pgOrderGenTime,
        "lastUpdateTime": lastUpdateTime,
        "pgLog": pgLog,
        "paymentMode": paymentMode,
        "statusUpdateBy": statusUpdateBy,
        "rfidAmountPaid": rfidAmountPaid
      };
}
