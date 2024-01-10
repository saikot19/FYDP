import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/vehicle_model.dart';

const String brandName = 'brandName';
const String image = 'image';
const String model = 'model';
const String registrationNumber = 'registrationNumber';
const String status = 'status';
const String userID = 'userID';

class VehicleProvider with ChangeNotifier {
  late vehicle? addedVehicle;
  Localvehicle? currentVehicle;
  List<Localvehicle> vehicleCheckList = [];
  List<Localvehicle> searchvehicleCheckList = [];

  Future<String> addVehicle(
      {required vehicle id, required vehicle vehicle}) async {
    const url =
        'https://jan-bahon-default-rtdb.asia-southeast1.firebasedatabase.app/user.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "BrandName": id.brandName,
          "image": id.image,
          "model": id.model,
          "registrationNumber": id.registrationNumber,
          "status": id.vehicleStatus,
          "userID": id.userid,
        }),
      );
      print(response.statusCode);
      print(response.body);
      return response.body;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchAndSetUser() async {
    const url =
        'https://jan-bahon-default-rtdb.asia-southeast1.firebasedatabase.app/user.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Localvehicle> loadedvehicle = [];
      extractedData.forEach((vehicleId, vehicleData) {
        loadedvehicle.add(
          Localvehicle(
            vehicle: vehicleId,
            brandName: vehicleData['brandName'],
            image: vehicleData['image'],
            model: vehicleData['model'],
            vehicleStatus: vehicleData['status'],
            registrationNumber: vehicleData['registrationNumber'],
            userid: vehicleData['UserID'],
          ),
        );
      });
      vehicleCheckList = loadedvehicle;
      print(vehicleCheckList.length);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
