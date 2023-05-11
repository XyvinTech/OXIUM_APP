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
  final double rfidAmountPaid;

  OrderModel( {
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
      transactionId: json['transactionId']??-1,
      type: json['type']??'',
      pgOrderId: json['pgOrderId']??'',
      pgPaymentId: json['pgPaymentId']??'',
      bookingId: json['bookingId']??-1,
      appuserName: json['appuserName']??'',
      amount: json['amount']??0,
      pgSIgnature: json['pgSIgnature']??'',
      status: json['status']??'',
      pgLog: json['pgLog']??'',
      pgOrderGenTime: json['pgOrderGenTime']??'',
      lastUpdateTime: json['lastUpdateTime']??'',
      paymentMode: json['paymentMode']??'',
      statusUpdateBy: json['statusUpdateBy']??'',
      rfidAmountPaid: json['rfidAmountPaid']??0,
    );
  }

  Map<String, dynamic> toJson() => {
        "transactionId": 468,
        "type": "RZRWeb",
        "pgOrderId": "order_LfOQuy430nN7vA",
        "pgPaymentId": "pay_LfORIJ5FMWkgGq",
        "bookingId": null,
        "appuserName": "9782199455",
        "amount": 500.0,
        "pgSIgnature":
            "dbc16cf2b970ed55a6f7f1a5525811dce0efa977f663f1b73f62050c6e3b6c4e",
        "status": "P",
        "pgOrderGenTime": "2023-04-18T20:53:33.000+0000",
        "lastUpdateTime": "2023-04-18T20:54:02.000+0000",
        "pgLog":
            "{\"amount\":50000,\"amount_paid\":0,\"notes\":[],\"created_at\":1681851209,\"amount_due\":50000,\"currency\":\"INR\",\"receipt\":\"3e20a089-4cb8-4307-8\",\"id\":\"order_LfOQuy430nN7vA\",\"entity\":\"order\",\"offer_id\":null,\"status\":\"created\",\"attempts\":0}",
        "paymentMode": null,
        "statusUpdateBy": "M",
        "rfidAmountPaid": null
      };
}
