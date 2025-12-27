// lib/screens/auth/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user_model.dart';
import '../../data/repository/user_repository.dart';

class AuthController extends ChangeNotifier {
  AuthController() {
    _loadCurrentUser();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepo = UserRepository();

  bool _loading = false;
  String? _error;
  UserModel? _user;

  bool get loading => _loading;
  String? get error => _error;
  UserModel? get user => _user;

  Future<void> _loadCurrentUser() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null && _user == null) {
      _user = UserModel(
        id: 0,
        name: firebaseUser.displayName ??
            firebaseUser.email ??
            'Delivery Partner',
        email: firebaseUser.email ?? '',
        phone: '',
        profilePic: firebaseUser.photoURL ?? '',
      );
      notifyListeners();
    }
  }

  /// LOGIN USING backend login.php
  Future<bool> login(String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final user = await _userRepo.login(email: email, password: password);
      _user = user;
      _loading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _loading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// SIGNUP – if backend handles signup, you can remove Firebase here later
  Future<bool> signup(String name, String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      await _userRepo.signup(
        username: name,
        email: email,
        password: password,
      );
      _loading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _loading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
