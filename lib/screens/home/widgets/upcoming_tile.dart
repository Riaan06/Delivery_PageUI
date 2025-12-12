// lib/screens/home/widgets/upcoming_tile.dart
import 'package:flutter/material.dart';
import '../../../models/delivery_model.dart';

class UpcomingTile extends StatelessWidget {
  final DeliveryModel delivery;
  final VoidCallback? onTap;

  const UpcomingTile({
    super.key,
    required this.delivery,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: const CircleAvatar(
        backgroundColor: Colors.orange,
        child: Icon(Icons.delivery_dining, color: Colors.white),
      ),
      title: Text(
        delivery.customerName,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('📍 ${delivery.address}'),
          Text('⏳ ETA: ${delivery.eta}'),
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
