import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';

class HeaderSection extends StatelessWidget {
  final String userName;

  const HeaderSection({required this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back,",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text(
              userName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(AppAssets.userAvatar),
        ),
      ],
    );
  }
}
