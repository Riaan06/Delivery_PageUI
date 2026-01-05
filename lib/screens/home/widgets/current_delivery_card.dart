import 'package:flutter/material.dart';
import '../../../models/delivery_model.dart';
import '../../map/osm_navigation_screen.dart';
import '../../chat/chat_screen.dart';

class CurrentDeliveryCard extends StatelessWidget {
  final DeliveryModel delivery;
  final VoidCallback? onCall;
  final VoidCallback? onDelivered;
  final VoidCallback? onCancel;

  const CurrentDeliveryCard({
    super.key,
    required this.delivery,
    this.onCall,
    this.onDelivered,
    this.onCancel,
  });

  Future<void> _handleNavigation(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OSMNavigationScreen(
          destinationLat: delivery.latitude,
          destinationLng: delivery.longitude,
          destinationName: delivery.customerName,
        ),
      ),
    );
  }

  void _showContactOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Customer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.call, color: Colors.green),
              ),
              title: const Text(
                'Call Customer',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: const Text('Start a voice call'),
              onTap: () {
                Navigator.pop(context);
                if (onCall != null) {
                  onCall!();
                }
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.chat_bubble, color: Colors.orange),
              ),
              title: const Text(
                'Text Customer',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: const Text('Send a message'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      customerName: delivery.customerName,
                      orderId: delivery.id,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

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
          Text(
            delivery.customerName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 18,
                color: Colors.grey,
              ),
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
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Colors.orange),
              const SizedBox(width: 6),
              Text('ETA: ${delivery.eta}'),
              const SizedBox(width: 16),
              const Icon(
                Icons.inventory_2_outlined,
                size: 18,
                color: Colors.green,
              ),
              const SizedBox(width: 6),
              Text(delivery.item),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _smallActionButton(
                icon: Icons.navigation,
                label: 'Navigate',
                color: Colors.blue,
                onTap: () => _handleNavigation(context),
              ),
              const SizedBox(width: 12),
              _smallActionButton(
                icon: Icons.phone_in_talk,
                label: 'Call/Text',
                color: Colors.green,
                onTap: () => _showContactOptions(context),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
                onTap: () {
                  print('Cancel button in CurrentDeliveryCard tapped');
                  if (onCancel != null) {
                    onCancel!();
                  } else {
                    print('ERROR: onCancel callback is null!');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

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
                style: TextStyle(fontWeight: FontWeight.w600, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
