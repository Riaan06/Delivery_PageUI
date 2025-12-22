// lib/controllers/profile_controller.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repository/user_repository.dart';

class ProfileController extends ChangeNotifier {
  final UserRepository _repo = UserRepository();
  final ImagePicker _picker = ImagePicker();

  String name = '';
  String email = '';
  String profilePic = ''; // can be URL or local file path
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

  Future<void> updateProfilePic(String urlOrPath) async {
    _repo.updateProfilePic(urlOrPath);
    profilePic = urlOrPath;
    notifyListeners();
  }

  /// Change profile photo with bottom sheet (Camera / Gallery)
  Future<void> changeProfilePhoto(BuildContext context) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Take photo'),
              onTap: () => Navigator.pop(ctx, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () => Navigator.pop(ctx, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );

    if (source == null) return;

    final XFile? picked = await _picker.pickImage(source: source);
    if (picked == null) return;

    final String path = picked.path; // local file path

    await updateProfilePic(path);
  }
}
