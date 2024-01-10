class vehicle {
  String userid;
  String brandName;
  String model;
  String image;
  String registrationNumber;
  bool vehicleStatus;

  vehicle({
    required this.userid,
    required this.brandName,
    required this.model,
    required this.image,
    this.registrationNumber = '',
    this.vehicleStatus = false,
  });
}

class Localvehicle {
  String userid;
  String brandName;
  String model;
  String image;
  String registrationNumber;
  bool vehicleStatus;

  Localvehicle({
    required this.userid,
    required this.brandName,
    required this.model,
    required this.image,
    required this.registrationNumber,
    required this.vehicleStatus,
    required String vehicle,
  });
}
