// lib/data/repository/user_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/user_model.dart';
import 'dummy_data.dart';

class UserRepository {
  /// Full URL to sir's login.php
  final String loginUrl;

  UserRepository({
    this.loginUrl = "https://svtechshant.com/tiffin/api/login.php",
  });

  // -------- dummy helpers (keep existing UI working) --------
  UserModel getUser() => DummyData.user;

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

  // ---------------- REAL LOGIN (login.php) ----------------
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse(loginUrl);

    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Server error: ${response.statusCode}');
      }

      final data = jsonDecode(response.body);

      if (data['status'] != 'success') {
        final msg = data['message']?.toString() ?? 'Invalid email or password';
        throw Exception(msg);
      }

      final int userId = data['user_id'] is int
          ? data['user_id'] as int
          : int.tryParse(data['user_id'].toString()) ?? 0;

      final user = UserModel(
        id: userId,
        name: DummyData.user.name, // temporary until backend returns name
        email: email,
        phone: DummyData.user.phone,
        profilePic: DummyData.user.profilePic,
      );

      DummyData.user = user; // keep dummy in sync

      return user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // ---------------- SIGNUP (signup.php) ----------------
  Future<void> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse('https://svtechshant.com/tiffin/api/signup.php');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Signup failed: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);

    // Example expected: { "status": "success", "message": "Registered" }
    if (data['status'] != 'success') {
      throw Exception(data['message'] ?? 'Signup failed');
    }
  }
}
