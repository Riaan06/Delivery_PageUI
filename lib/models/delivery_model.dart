class DeliveryModel {
  final String id;
  final String customerName;
  final String item;
  final String address;
  final String eta;
  final String pickupSlot;
  final String status;

  DeliveryModel({
    required this.id,
    required this.customerName,
    required this.item,
    required this.address,
    required this.eta,
    required this.pickupSlot,
    required this.status,
  });
}
