import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/user_model.dart';
import 'dummy_data.dart';

class UserRepository {
  final String baseUrl;

  UserRepository({this.baseUrl = "dummy"});

  // -----------------------------
  // LOCAL DUMMY USER (already in your project)
  // -----------------------------
  UserModel getUser() {
    return DummyData.user;
  }

  Future<UserModel> getUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return DummyData.user;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  void updateUserName(String newName) {
    DummyData.user = DummyData.user.copyWith(name: newName);
  }

  void updateProfilePic(String newUrl) {
    DummyData.user = DummyData.user.copyWith(profilePic: newUrl);
  }

  // --------------------------------------------------
  // REAL LOGIN (uses sir's API) + DUMMY FALLBACK LOGIN
  // --------------------------------------------------
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    // If sir's API base URL is empty or placeholder → use dummy login
    if (baseUrl == "dummy" || baseUrl.isEmpty || baseUrl.contains("API_For_Login")) {
      return _dummyLogin(email, password);
    }

    final url = Uri.parse("$baseUrl/login"); // change to sir's actual endpoint

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,       // change key names if sir uses "username" or "mobile"
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final user = UserModel.fromJson(data);

        // keep DummyData in sync so other parts of app still work
        DummyData.user = user;

        return user;
      } else {
        throw Exception("Invalid credentials (code: ${response.statusCode})");
      }
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }

  // -----------------------------
  // DUMMY LOGIN (No API from sir)
  // -----------------------------
  Future<UserModel> _dummyLogin(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 600));

    if (email == "deliveryboy@gmail.com" && password == "123456") {
      final user = UserModel(
        id: 123,
        name: "Delivery Boy",
        email: email,
        phone: "1234567890",
        profilePic: DummyData.user.profilePic,
      );

      DummyData.user = user;

      return user;
    }

    throw Exception("Invalid email or password");
  }
}
