// lib/screens/profile/profile_page.dart
import 'package:deliveryui/screens/profile/profile_controller.dart';
import 'package:deliveryui/screens/profile/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/login_page.dart';
import 'widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
      builder: (context, controller, _) {
        if (controller.isLoading) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            title: const Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ProfileHeader(
                  name: controller.name,
                  memberSince: 'Dec 2025',
                  location: controller.email,
                  imageUrl: controller.profilePic,
                  onChangePhoto: () => controller.changeProfilePhoto(context),
                ),
                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () async {
                    final newName = await _askName(context, controller.name);
                    if (newName != null && newName.trim().isNotEmpty) {
                      await controller.updateName(newName.trim());
                    }
                  },
                  child: const Text('Edit Name'),
                ),

                const SizedBox(height: 16),

                // your other tiles / options here...

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: LogoutButton(
                    onLogout: () async {
                      await controller.logout();

                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', false);

                      if (!context.mounted) return;

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                            (route) => false,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logged out successfully')),
                      );
                    },
                  ),

                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String?> _askName(BuildContext context, String current) async {
    final controller = TextEditingController(text: current);
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, controller.text),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
