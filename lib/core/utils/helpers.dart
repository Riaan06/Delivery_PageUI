import 'package:flutter/material.dart';

class Helpers {
  // Show SnackBar
  static void showSnack(BuildContext context, String message,
      {Color color = Colors.black87}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Add Zero to single digit (example: 8 -> 08)
  static String twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  // Convert DateTime to readable date
  static String formatDate(DateTime date) {
    return "${twoDigits(date.day)}-${twoDigits(date.month)}-${date.year}";
  }

  // Clean address (truncate long addresses for UI)
  static String shorten(String text, {int max = 30}) {
    if (text.length <= max) return text;
    return "${text.substring(0, max)}...";
  }
}
