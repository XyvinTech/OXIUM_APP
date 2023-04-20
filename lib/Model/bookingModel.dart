class BookingModel {
  final int bookingId;
  final String chargerName;
  final int chargingpoint;
  final int userEVId;
  final String username;
  final double amount;
  final String stopReason;
  final int userstartattempts;
  final int userstopattempts;
  final int maxattempts;
  final double pricing;
  final double damount;
  final double tdamount;
  final double extracharges;
  final double taxes;
  final String bookedvia;
  final String user_can_Request;
  final String priceby;
  final String book_time;
  final String start_time;
  final String stop_time;
  final String requested_stop_time;
  final String requested_stop_duration;
  final String requested_stop_unit;
  final String requested_stop_soc;
  final String stopchargingby;
  final String discountcode;
  final String outputType;
  final int capacity;
  final String connectorType;
  String status;
  final String scheduleId;
  BookingModel({
    required this.bookingId,
    required this.chargingpoint,
    required this.chargerName,
    required this.userEVId,
    required this.username,
    required this.amount,
    required this.stopReason,
    required this.userstartattempts,
    required this.userstopattempts,
    required this.maxattempts,
    required this.pricing,
    required this.damount,
    required this.tdamount,
    required this.extracharges,
    required this.taxes,
    required this.bookedvia,
    required this.user_can_Request,
    required this.priceby,
    required this.book_time,
    required this.start_time,
    required this.stop_time,
    required this.requested_stop_time,
    required this.requested_stop_duration,
    required this.requested_stop_unit,
    required this.requested_stop_soc,
    required this.stopchargingby,
    required this.discountcode,
    required this.status,
    required this.scheduleId,
    required this.capacity,
    required this.connectorType,
    required this.outputType,
  });
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      bookingId: json['bookingId'],
      chargingpoint: json['chargingpoint'] ?? 0,
      chargerName: json['chargerName'] ?? '',
      userEVId: json['userEVId'] ?? 0,
      username: json['username'] ?? '',
      amount: json['amount'] ?? 0,
      stopReason: json['stopReason'] ?? '',
      userstartattempts: json['userstartattempts'] ?? 0,
      userstopattempts: json['userstopattempts'] ?? 0,
      maxattempts: json['maxattempts'] ?? 0,
      pricing: json['pricing'] ?? 0,
      damount: json['damount'] ?? 0,
      tdamount: json['tdamount'] ?? 0,
      extracharges: json['extracharges'] ?? 0,
      taxes: json['taxes'] ?? 0,
      bookedvia: json['bookedvia'] ?? '',
      user_can_Request: json['user_can_Request'] ?? '',
      priceby: json['priceby'] ?? '',
      book_time: json['book_time'] ?? '',
      start_time: json['start_time'] ?? '',
      stop_time: json['stop_time'] ?? '',
      requested_stop_time: json['requested_stop_time'] ?? '',
      requested_stop_duration: json['requested_stop_duration'] ?? '',
      requested_stop_unit: json['requested_stop_unit'] ?? '',
      requested_stop_soc: json['requested_stop_soc'] ?? '',
      stopchargingby: json['stopchargingby'] ?? '',
      discountcode: json['discountcode'] ?? '',
      status: json['status'] ?? '',
      scheduleId: json['scheduleId'] ?? '',
      capacity: json['capacity'] ?? 0,
      connectorType: json['connectorType'] ?? '',
      outputType: json['outputType'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
        "chargerName": chargerName,
        "chargingpoint": chargingpoint,
        "userEVId": userEVId,
        "username": username,
        "amount": amount,
        "stopReason": stopReason,
        "userstartattempts": userstartattempts,
        "userstopattempts": userstopattempts,
        "maxattempts": maxattempts,
        "pricing": pricing,
        "damount": damount,
        "tdamount": tdamount,
        "extracharges": extracharges,
        "taxes": taxes,
        "bookedvia": bookedvia,
        "user_can_Request": user_can_Request,
        "priceby": priceby,
        "book_time": book_time,
        "start_time": start_time,
        "stop_time": stop_time,
        "requested_stop_time": requested_stop_time,
        "requested_stop_duration": requested_stop_duration,
        "requested_stop_unit": requested_stop_unit,
        "requested_stop_soc": requested_stop_soc,
        "stopchargingby": stopchargingby,
        "discountcode": discountcode,
        "status": status,
        "scheduleId": scheduleId,
        "capacity": capacity,
        "connectorType": connectorType,
        "outputType": outputType,
      };
}
