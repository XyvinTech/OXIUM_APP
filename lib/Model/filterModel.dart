class FilterModel {
  final String title;
  bool isSelected;

  FilterModel({
    required this.title,
    required this.isSelected,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      title: json['title'],
      isSelected: json['isSelected'],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "isSelected": isSelected,
      };
}
