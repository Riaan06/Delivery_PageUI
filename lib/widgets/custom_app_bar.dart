import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? action;
  final bool showBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.action,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      leading: showBack
          ? IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        if (action != null)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: action!,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
