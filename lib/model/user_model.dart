class User {
  String username;
  String password;
  String email;
  String phone;
  String image;
  String birthday;
  bool vehicleStatus;
  String vehicleCategory;
  String vehicleModel;
  String vehicleNumber;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    this.image = '',
    this.birthday = '',
    this.vehicleStatus = false,
    this.vehicleCategory = '',
    this.vehicleModel = '',
    this.vehicleNumber = '',
  });
}

class LocalUser {
  String id;
  String username;
  String password;
  String email;
  String phone;
  String image;
  String birthday;
  bool vehicleStatus;
  String vehicleCategory;
  String vehicleModel;
  String vehicleNumber;

  LocalUser({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.image,
    required this.birthday,
    required this.vehicleStatus,
    required this.vehicleCategory,
    required this.vehicleModel,
    required this.vehicleNumber,
  });
}
