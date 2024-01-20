import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero/Repository/Core/endpoints.dart';

class AuthRepository {
  final Dio _dioClient = Dio();

  register(String name, String email, String password) async {
    final Map<String, dynamic> requestData = {
      'user_name': name,
      'email': email,
      'password': password,
      'image': 'https://source.unsplash.com/random/900×700/?fruit'
    };
    print(requestData);
    try {
      var response = await _dioClient.post(
        Endpoints.register,
        data: jsonEncode(requestData),
      );
      print("requestData");
      print(response);
      if (response.statusCode == 200 | 201) {
        final responseData = response.data;

        final userData = responseData['user'];
        print(responseData);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('user_name', name ?? '');
        prefs.setString('email', userData['email']);

        return true;
      } else {
        return false;
      }
    } on DioException catch (_) {
      return false;
    }
  }

  login(
    String email,
    String password,
  ) async {
    final Map<String, dynamic> requestData = {
      'email': email,
      'password': password
    };

    try {
      final response = await _dioClient.post(
        Endpoints.login,
        data: jsonEncode(requestData),
      );
      if (response.statusCode == 200) {
        final responseData = response.data;

        print(responseData);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // final name = userData['user_name'] as String?;

        prefs.setString('userName', responseData['user_name']);
        prefs.setString('email', responseData['email']);
        prefs.setString('photo', responseData['photo']);
        return true;
      } else {
        return false;
      }
    } on DioException catch (_) {
      return false;
    }
  }

  Future<AuthUser?> getAuthUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? name = prefs.getString('userName');
    String? email = prefs.getString('email');
    String? photo = prefs.getString('photo');

    if (name != null && email != null) {
      return AuthUser(
        name: name,
        email: email,
        photo: photo ?? "https://source.unsplash.com/random/900×700/?fruit",
      );
    } else {
      return null;
    }
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all data in shared preferences
  }
}

class AuthUser {
  final String name;
  final String email;
  final String photo;

  AuthUser({
    required this.name,
    required this.email,
    required this.photo,
  });
}
