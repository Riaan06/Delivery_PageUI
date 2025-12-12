import 'package:flutter/material.dart';

class OnlineStatusButton extends StatefulWidget {
  const OnlineStatusButton({super.key});

  @override
  State<OnlineStatusButton> createState() => _OnlineStatusButtonState();
}

class _OnlineStatusButtonState extends State<OnlineStatusButton>
    with SingleTickerProviderStateMixin {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isOnline = !isOnline);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutBack,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isOnline ? Colors.green.shade500 : Colors.red.shade500,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isOnline
              ? [
            BoxShadow(
              color: Colors.green.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ]
              : [
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Circle Dot
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: isOnline
                    ? [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    blurRadius: 6,
                    spreadRadius: 1,
                  )
                ]
                    : [],
              ),
            ),

            const SizedBox(width: 8),

            /// Fading Text
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, anim) =>
                  FadeTransition(opacity: anim, child: child),
              child: Text(
                isOnline ? "Online" : "Offline",
                key: ValueKey(isOnline),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
