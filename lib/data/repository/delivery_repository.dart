
import '../../models/delivery_model.dart';
import 'dummy_data.dart';

class DeliveryRepository {
  List<DeliveryModel> getAllDeliveries() {
    return DummyData.deliveries;
  }

  List<DeliveryModel> getPendingDeliveries() {
    return DummyData.deliveries
        .where((d) => d.status == 'Pending')
        .toList();
  }

  List<DeliveryModel> getCompletedDeliveries() {
    return DummyData.deliveries
        .where((d) => d.status == 'Completed')
        .toList();
  }

  List<DeliveryModel> getCancelledDeliveries() {
    return DummyData.deliveries
        .where((d) => d.status == 'Cancelled')
        .toList();
  }

  DeliveryModel? getDeliveryById(String id) {
    return DummyData.deliveries.firstWhere(
          (d) => d.id == id,
      orElse: () => null as DeliveryModel,
    );
  }
}
