// lib/controllers/profile_controller.dart
import 'package:flutter/material.dart';

import '../../data/repository/user_repository.dart';

class ProfileController extends ChangeNotifier {
  final UserRepository _repo = UserRepository();

  String name = '';
  String email = '';
  String profilePic = '';
  bool isLoading = false;

  ProfileController() {
    loadUserData();
  }

  Future<void> loadUserData() async {
    isLoading = true;
    notifyListeners();

    final user = await _repo.getUserProfile();
    name = user.name;
    email = user.email;
    profilePic = user.profilePic;

    isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await _repo.logout();
  }

  Future<void> updateName(String newName) async {
    _repo.updateUserName(newName);
    name = newName;
    notifyListeners();
  }

  Future<void> updateProfilePic(String url) async {
    _repo.updateProfilePic(url);
    profilePic = url;
    notifyListeners();
  }
}
