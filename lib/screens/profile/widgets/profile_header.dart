// lib/screens/profile/widgets/profile_header.dart
import 'dart:io';

import 'package:flutter/material.dart';
import '../../../widgets/online_status_button.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String memberSince;
  final String location;
  final String? imageUrl;
  final VoidCallback? onChangePhoto;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.memberSince,
    required this.location,
    this.imageUrl,
    this.onChangePhoto,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider avatarProvider;

    if (imageUrl == null || imageUrl!.isEmpty) {
      avatarProvider = const AssetImage('assets/default_avatar.png');
    } else if (imageUrl!.startsWith('http')) {
      // network image from backend
      avatarProvider = NetworkImage(imageUrl!);
    } else {
      // local file path from image_picker
      avatarProvider = FileImage(File(imageUrl!));
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: avatarProvider,
              ),
              if (onChangePhoto != null)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: onChangePhoto,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Member since $memberSince',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// You can still show OnlineStatusButton here if you want
          // const OnlineStatusButton(),
        ],
      ),
    );
  }
}
