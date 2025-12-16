import 'package:flutter/material.dart';
import '../../data/repository/user_repository.dart';
import '../../models/user_model.dart';

class AuthController extends ChangeNotifier {
  final UserRepository userRepository;

  AuthController({required this.userRepository});

  bool _loading = false;
  String? _error;
  UserModel? _user;

  bool get loading => _loading;
  String? get error => _error;
  UserModel? get user => _user;

  Future<bool> login(String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await userRepository.login(
        email: email,
        password: password,
      );
      _user = result;
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
}
