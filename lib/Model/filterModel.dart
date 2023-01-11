class FilterModel {
  String title;
  bool isSelected;
  String? iconPath;
  FilterModel({
    required this.title,
    required this.isSelected,
    this.iconPath,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      title: json['title'],
      isSelected: json['isSelected'],
      iconPath: json['iconPath'],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "isSelected": isSelected,
        "iconPath": iconPath,
      };
}
