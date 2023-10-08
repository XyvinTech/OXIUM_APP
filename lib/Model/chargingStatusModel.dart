class ChargingStatusModel {
  final int tran_id;
  final int Connector;
  double amount;
  final int SOC;
  final int Duration;
  final String PriceBy;
  double unit;
  final double load;
  final double price;
  final String startTime;
  final String lastupdated;
  final String Charger;
  String status;
  final String Chargingstatus;
  final double tariff;
  double taxamount;
  int Capacity;
  String OutputType;
  String ConnectorType;
  final double balance;

  ChargingStatusModel({
    required this.tran_id,
    required this.Connector,
    required this.amount,
    required this.SOC,
    required this.Duration,
    required this.PriceBy,
    required this.unit,
    required this.load,
    required this.price,
    required this.startTime,
    required this.lastupdated,
    required this.Charger,
    required this.status,
    required this.Chargingstatus,
    required this.tariff,
    required this.taxamount,
    required this.Capacity,
    required this.OutputType,
    required this.ConnectorType,
    required this.balance,
  });
  factory ChargingStatusModel.fromJson(Map<String, dynamic> json) {
    return ChargingStatusModel(
      tran_id: json['tran_id'] ?? -1,
      Connector: json['Connector'] ?? -1,
      amount: json['amount'] ?? 0,
      SOC: (json['SOC'] ?? 0).toInt(),
      Duration: json['Duration'] ?? 0,
      PriceBy: json['PriceBy'] ?? '',
      unit: (json['unit'] ?? 0.0),
      load: json['load'] ?? 0.0,
      price: json['price'] ?? 0.0,
      startTime: json['startTime'] ?? '',
      lastupdated: json['lastupdated'] ?? '',
      Charger: json['Charger'] ?? '',
      status: json['status'] ?? '',
      Chargingstatus: json['Chargingstatus'] ?? '',
      tariff: json['tariff'] ?? 0,
      taxamount: json['taxamount'] ?? 0,
      Capacity: json['Capacity'] ?? 0,
      OutputType: json['OutputType'] ?? '',
      ConnectorType: json['ConnectorType'] ?? '',
      balance: json['balance'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() => {
        "tran_id": tran_id,
        "Connector": Connector,
        "amount": amount,
        "SOC": SOC,
        "Duration": Duration,
        "PriceBy": "PriceBy",
        "unit": unit,
        "load": load,
        "price": price,
        "startTime": startTime,
        "lastupdated": lastupdated,
        "Charger": Charger,
        "status": status,
        "Chargingstatus": Chargingstatus,
        "tariff": tariff,
        "taxamount": taxamount,
        "Capacity": Capacity,
        "OutputType": OutputType,
        "ConnectorType": ConnectorType,
        "balance": balance,
      };
}
