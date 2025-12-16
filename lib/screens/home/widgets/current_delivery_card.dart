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
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 👤 Customer Name
          Text(
            delivery.customerName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 10),

          // 📍 Address
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  delivery.address,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ⏱ ETA & Item
          Row(
            children: [
              const Icon(Icons.access_time,
                  size: 18, color: Colors.orange),
              const SizedBox(width: 6),
              Text('ETA: ${delivery.eta}'),
              const SizedBox(width: 16),
              const Icon(Icons.inventory_2_outlined,
                  size: 18, color: Colors.green),
              const SizedBox(width: 6),
              Text(delivery.item),
            ],
          ),

          const SizedBox(height: 16),

          // 🔘 Top Actions
          Row(
            children: [
              _smallActionButton(
                icon: Icons.navigation,
                label: 'Navigate',
                color: Colors.blue,
                onTap: onNavigate,
              ),
              const SizedBox(width: 12),
              _smallActionButton(
                icon: Icons.call,
                label: 'Call',
                color: Colors.green,
                onTap: onCall,
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 🔘 Bottom Actions
          Row(
            children: [
              _primaryButton(
                label: 'Delivered',
                color: const Color(0xFF2FA84F),
                onTap: onDelivered,
              ),
              const SizedBox(width: 12),
              _outlineButton(
                label: 'Cancel',
                color: Colors.red,
                onTap: onCancel,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🔹 Small action button
  Widget _smallActionButton({
    required IconData icon,
    required String label,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Primary button
  Widget _primaryButton({
    required String label,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ❌ Outline button
  Widget _outlineButton({
    required String label,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
