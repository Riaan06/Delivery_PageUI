import 'package:flutter/material.dart';
import '../../../models/delivery_model.dart';

class CurrentDeliveryCard extends StatelessWidget {
  final DeliveryModel delivery;
  final VoidCallback? onNavigate;
  final VoidCallback? onCall;
  final VoidCallback? onDelivered;
  final VoidCallback? onCancel;

  const CurrentDeliveryCard({
    super.key,
    required this.delivery,
    this.onNavigate,
    this.onCall,
    this.onDelivered,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            delivery.customerName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text('📍 ${delivery.address}'),
          Text('⏳ ETA: ${delivery.eta}'),
          Text('🛍 Item: ${delivery.item}'),
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton(
                onPressed: onNavigate,
                child: const Text('Navigate'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: onCall,
                child: const Text('Call'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: onDelivered,
                child: const Text('Delivered'),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: onCancel,
                child: const Text('Cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
