class UserModel {
  final int id;
  String first_name;
  String last_name;
  final String phone;
  String image;
  final String email;
  final String status;
  final String created_at;
  final String updated_at;
  final String feature_preference;
  String active_service;
  UserModel({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.phone,
    required this.email,
    required this.image,
    required this.status,
    required this.created_at,
    required this.updated_at,
    required this.active_service,
    required this.feature_preference,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      phone: json['phone'],
      image: json['image'] ?? '',
      email: json['email'] ?? '',
      feature_preference: json['feature_preference'] ?? '',
      status: json['status'],
      created_at: json['created_at'] ?? '',
      updated_at: json['updated_at'] ?? '',
      active_service: json['active_service'] ?? '',
    );
  }
}
