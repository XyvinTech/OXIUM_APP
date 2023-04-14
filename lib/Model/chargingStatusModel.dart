class ChargingStatusModel {
  final int Connector;
  final int amount;
  final int SOC;
  final int Duration;
  final String PriceBy;
  final int unit;
  final int load;
  final int price;
  final String startTime;
  final String Charger;
  final String status;
  final String Chargingstatus;

  ChargingStatusModel(
      {required this.Connector,
      required this.amount,
      required this.SOC,
      required this.Duration,
      required this.PriceBy,
      required this.unit,
      required this.load,
      required this.price,
      required this.startTime,
      required this.Charger,
      required this.status,
      required this.Chargingstatus});
  factory ChargingStatusModel.fromJson(Map<String, dynamic> json) {
    return ChargingStatusModel(
      Connector: json['Connector'],
      amount: json['amount'],
      SOC: json['SOC'],
      Duration: json['Duration'],
      PriceBy: json['PriceBy'],
      unit: json['unit'],
      load: json['load'],
      price: json['price'],
      startTime: json['startTime'],
      Charger: json['Charger'],
      status: json['status'],
      Chargingstatus: json['Chargingstatus'],
    );
  }
  Map<String, dynamic> toJson() => {
        "Connector": Connector,
        "amount": amount,
        "SOC": SOC,
        "Duration": Duration,
        "PriceBy": "PriceBy",
        "unit": unit,
        "load": load,
        "price": price,
        "startTime": startTime,
        "Charger": Charger,
        "status": status,
        "Chargingstatus": Chargingstatus
      };
}
