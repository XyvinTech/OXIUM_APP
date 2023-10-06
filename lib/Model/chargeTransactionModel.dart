class ChargeTransactionModel {
  final String image;
  final String ChargingStopTime;
  final double amount;
  final String chargerName;
  final double startReading;
  final int bookingId;
  final String stationAddress;
  final double unit;
  final double price;
  final String chargingStartTime;
  final String stationName;
  final double stopReading;
  final int chargingPoint;
  final String status;

  ChargeTransactionModel({
    required this.image,
    required this.ChargingStopTime,
    required this.amount,
    required this.chargerName,
    required this.startReading,
    required this.stationAddress,
    required this.unit,
    required this.price,
    required this.bookingId,
    required this.chargingStartTime,
    required this.stationName,
    required this.stopReading,
    required this.chargingPoint,
    required this.status,
  });

  factory ChargeTransactionModel.fromJson(Map<String, dynamic> json) {
    return ChargeTransactionModel(
      image: json['image'] ?? '',
      ChargingStopTime: json['ChargingStopTime'] ?? '',
      amount: json['amount'] ?? 0,
      chargerName: json['chargerName'] ?? '',
      startReading: json['startReading'] ?? 0,
      bookingId: json['bookingId'] ?? -1,
      stationAddress: json['stationAddress'] ?? '',
      unit: json['unit'] ?? 0,
      price: json['price'] ?? 0,
      chargingStartTime: json['chargingStartTime'] ?? '',
      stationName: json['stationName'] ?? '',
      stopReading: json['stopReading'] ?? 0,
      chargingPoint: json['chargingPoint'] ?? 0,
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        "ChargingStopTime": ChargingStopTime,
        "amount": amount,
        "chargerName": chargerName,
        "startReading": startReading,
        "bookingId": bookingId,
        "stationAddress": stationAddress,
        "unit": unit,
        "price": price,
        "chargingStartTime": chargingStartTime,
        "stationName": stationName,
        "stopReading": stopReading,
        "chargingPoint": chargingPoint,
        "status": status,
      };
}
