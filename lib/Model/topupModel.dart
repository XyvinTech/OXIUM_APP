class TopupModel {
  final int id;
  final String appUserName;
  final String updatedTS;
  final String updatedBy;
  final String updatedFrom;
  final double updatedAmt;
  final double updatedValue;
  final double oldValue;
  final String updateType;

  TopupModel({
    required this.id,
    required this.appUserName,
    required this.updatedTS,
    required this.updatedBy,
    required this.updatedFrom,
    required this.updatedAmt,
    required this.updatedValue,
    required this.oldValue,
    required this.updateType,
  });

  factory TopupModel.fromJson(Map<String, dynamic> json) {
    return TopupModel(
      id: json['id'] ?? -1,
      appUserName: json['appUserName'] ?? '',
      updatedTS: json['updatedTS'] ?? '',
      updatedBy: json['updatedBy'] ?? '',
      updatedFrom: json['updatedFrom'] ?? '',
      updatedAmt: json['updatedAmt'] ?? 0,
      updatedValue: json['updatedValue'] ?? 0,
      oldValue: json['oldValue'] ?? 0,
      updateType: json['updateType'] ?? '',
      
    );
  }

  Map<String, dynamic> toJson() => {
                "appUserName": appUserName,
                "updatedAmt": updatedAmt,
                "updatedTS":updatedTS,
                "updatedBy":updatedBy,
                "updatedFrom": updatedFrom,
                "updatedValue":updatedValue,
                "oldValue": oldValue,
                "id": id,
                "updateType": updateType
      };
}
