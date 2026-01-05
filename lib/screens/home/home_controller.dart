// lib/screens/home/home_controller.dart
import 'package:flutter/material.dart';
import '../../data/repository/delivery_repository.dart';
import '../../data/repository/user_repository.dart';
import '../../models/delivery_model.dart';

class HomeController extends ChangeNotifier {
  final DeliveryRepository deliveryRepo = DeliveryRepository();
  final UserRepository userRepo = UserRepository();

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  String get userName => userRepo.getUser().name;

  List<DeliveryModel> get allDeliveries => deliveryRepo.getAllDeliveries();
  int get totalCount => allDeliveries.length;
  int get pendingCount => deliveryRepo.getPendingDeliveries().length;
  int get completedCount => deliveryRepo.getCompletedDeliveries().length;
  int get cancelledCount => deliveryRepo.getCancelledDeliveries().length;

  DeliveryModel? get currentDelivery {
    final list = deliveryRepo.getPendingDeliveries();
    return list.isNotEmpty ? list.first : null;
  }

  List<DeliveryModel> get upcomingDeliveries =>
      deliveryRepo.getPendingDeliveries();

  void toggleOnline() {
    _isOnline = !_isOnline;
    notifyListeners();
  }

  void markDeliveryCompleted(String id) {
    final list = deliveryRepo.getAllDeliveries();
    final index = list.indexWhere((d) => d.id == id);
    if (index == -1) return;

    list[index] = DeliveryModel(
      id: list[index].id,
      customerName: list[index].customerName,
      item: list[index].item,
      address: list[index].address,
      latitude: list[index].latitude,
      longitude: list[index].longitude,
      eta: list[index].eta,
      status: 'Completed',
    );
    notifyListeners();
  }

  void markDeliveryCancelled(String id) {
    final list = deliveryRepo.getAllDeliveries();
    final index = list.indexWhere((d) => d.id == id);
    if (index == -1) return;

    list[index] = DeliveryModel(
      id: list[index].id,
      customerName: list[index].customerName,
      item: list[index].item,
      address: list[index].address,
      latitude: list[index].latitude,
      longitude: list[index].longitude,
      eta: list[index].eta,
      status: 'Cancelled',
    );
    notifyListeners();
  }
}
