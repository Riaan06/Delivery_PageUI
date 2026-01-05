// lib/screens/profile/profile_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_controller.dart';
import '../auth/login_page.dart';
import '../auth/auth_controller.dart';
import '../earnings/earnings_summary_page.dart';
import '../settings/language_page.dart';
import '../kyc/kyc_page.dart';
import 'widgets/profile_header.dart';
import '../../core/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Consumer<ProfileController>(
      builder: (context, controller, _) {
        if (controller.isLoading) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              title: Text(
                localizations.translate('profile'),
                style: const TextStyle(color: Colors.black),
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
            title: Text(
              localizations.translate('profile'),
              style: const TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Card
                ProfileHeader(
                  memberSince: 'Dec 2025',
                  location: 'Mumbai, India',
                  onChangePhoto: () => controller.changeProfilePhoto(context),
                ),

                const SizedBox(height: 16),

                // Edit Profile Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final newName = await _askName(context, controller.name);
                      if (newName != null && newName.trim().isNotEmpty) {
                        await controller.updateName(newName.trim());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      localizations.translate('edit_profile'),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Account Section
                _buildSectionHeader(localizations.translate('account')),
                const SizedBox(height: 8),
                _buildKYCStatusCard(context),
                const SizedBox(height: 8),
                _buildMenuItem(
                  icon: Icons.description,
                  title: localizations.translate('documents'),
                  onTap: () {
                    // Navigate to documents
                  },
                ),
                _buildMenuItem(
                  icon: Icons.electric_bike,
                  title: localizations.translate('vehicle_details'),
                  onTap: () {
                    // Navigate to vehicle details
                  },
                ),
                _buildMenuItem(
                  icon: Icons.account_balance,
                  title: localizations.translate('bank_details'),
                  onTap: () {
                    // Navigate to bank details
                  },
                ),

                const SizedBox(height: 24),

                // Performance Section
                _buildSectionHeader(localizations.translate('performance')),
                const SizedBox(height: 8),
                _buildMenuItem(
                  icon: Icons.currency_rupee,
                  title: localizations.translate('earnings_summary'),
                  onTap: () {
                    print('Navigating to Earnings Summary...');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EarningsSummaryPage(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.bar_chart,
                  title: localizations.translate('delivery_stats'),
                  onTap: () {
                    // Navigate to stats
                  },
                ),

                const SizedBox(height: 24),

                // Settings Section
                _buildSectionHeader(localizations.translate('settings')),
                const SizedBox(height: 8),
                _buildMenuItem(
                  icon: Icons.schedule,
                  title: localizations.translate('availability'),
                  onTap: () {
                    // Navigate to availability
                  },
                ),
                _buildMenuItem(
                  icon: Icons.language,
                  title: localizations.translate('language'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LanguagePage(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.notifications,
                  title: localizations.translate('notifications'),
                  onTap: () {
                    // Navigate to notifications
                  },
                ),

                const SizedBox(height: 24),

                // Support Section
                _buildSectionHeader(localizations.translate('support')),
                const SizedBox(height: 8),
                _buildMenuItem(
                  icon: Icons.help_center,
                  title: localizations.translate('help_center'),
                  onTap: () {
                    // Navigate to help center
                  },
                ),
                _buildMenuItem(
                  icon: Icons.contact_support,
                  title: localizations.translate('contact_support'),
                  onTap: () {
                    // Navigate to contact support
                  },
                ),

                const SizedBox(height: 32),

                // Logout Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final confirmed = await _showLogoutDialog(context);
                      if (confirmed == true) {
                        await controller.logout();

                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('isLoggedIn', false);

                        if (!context.mounted) return;

                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                          (route) => false,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Logged out successfully'),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.logout, color: Colors.red),
                    label: Text(
                      localizations.translate('logout'),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Colors.red, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildKYCStatusCard(BuildContext context) {
    final auth = context.watch<AuthController>();
    final isKYCCompleted = auth.user?.kycCompleted ?? false;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        gradient: isKYCCompleted
            ? LinearGradient(
                colors: [Colors.green.shade400, Colors.green.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [Colors.orange.shade400, Colors.orange.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: (isKYCCompleted ? Colors.green : Colors.orange).withOpacity(
              0.3,
            ),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: !isKYCCompleted
              ? () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KYCPage()),
                )
              : null,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    isKYCCompleted ? Icons.verified : Icons.verified_user,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isKYCCompleted ? 'KYC Completed' : 'Complete Your KYC',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isKYCCompleted
                            ? 'Your account is verified'
                            : 'Verify identity to unlock features',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isKYCCompleted)
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 28,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.green, size: 22),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }

  Future<String?> _askName(BuildContext context, String current) async {
    final controller = TextEditingController(text: current);
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
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

  Future<bool?> _showLogoutDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(localizations.translate('logout')),
        content: Text(localizations.translate('logout_confirmation')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(localizations.translate('cancel')),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(localizations.translate('logout')),
          ),
        ],
      ),
    );
  }
}
