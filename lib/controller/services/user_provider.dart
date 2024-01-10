import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/user_model.dart';

const String userName = 'username';
const String passWord = 'password';
const String email = 'email';
const String phone = 'phone';
const String image = 'image';
const String birthday = 'birthday';
const String vehicleStatus = 'vehiclestatus';
const String vehicleCategory = 'vehiclecategory';
const String vehicleModel = 'vehiclemodel';
const String vehicleNumber = 'vehiclenumber';

class UserProvider with ChangeNotifier {
  late User? signupUser;
  LocalUser? currentUser;
  List<LocalUser> userCheckList = [];
  List<LocalUser> searchFriendCheckList = [];

  Future<String> addUser({required User user}) async {
    const url =
        'https://jan-bahon-default-rtdb.asia-southeast1.firebasedatabase.app/user.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "username": user.username,
          "password": user.password,
          "email": user.email,
          "image": user.image,
          "phone": user.phone,
          "birthday": user.birthday,
          "vehiclestatus": user.vehicleStatus,
          "vehiclecategory": user.vehicleCategory,
          "vehiclemodel": user.vehicleModel,
          "vehiclenumber": user.vehicleNumber,
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
      final List<LocalUser> loadedUsers = [];
      extractedData.forEach((userId, userData) {
        loadedUsers.add(
          LocalUser(
            id: userId,
            username: userData[userName],
            password: userData['password'],
            email: userData['email'],
            phone: userData['phone'],
            image: userData['image'],
            birthday: userData['birthday'],
            vehicleStatus: userData['vehiclestatus'],
            vehicleCategory: userData['vehiclecategory'],
            vehicleModel: userData['vehiclemodel'],
            vehicleNumber: userData['vehiclenumber'],
          ),
        );
      });
      userCheckList = loadedUsers;
      print(userCheckList.length);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
