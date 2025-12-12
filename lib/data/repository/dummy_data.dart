

import '../../models/delivery_model.dart';
import '../../models/earning_model.dart';
import '../../models/user_model.dart';

class DummyData {
  static List<DeliveryModel> deliveries = [
    DeliveryModel(
      id: '1',
      customerName: 'Amit Sharma',
      item: 'Lunch Box',
      address: 'Room 304, Hostel-B, IIT Mumbai',
      eta: '12 mins',
      pickupSlot: '10:15 - 10:45 AM',
      status: 'Pending',
    ),
    DeliveryModel(
      id: '2',
      customerName: 'Priya Patel',
      item: 'Lunch Box',
      address: 'Room 205, Hostel-A, Near Library',
      eta: '20 mins',
      pickupSlot: '10:15 - 10:45 AM',
      status: 'Pending',
    ),
    DeliveryModel(
      id: '3',
      customerName: 'Rahul Verma',
      item: 'Dinner Box',
      address: 'Room 101, PG House',
      eta: '25 mins',
      pickupSlot: 'N/A',
      status: 'Pending',
    ),
    DeliveryModel(
      id: '4',
      customerName: 'Sneha Desai',
      item: 'Lunch Box',
      address: 'Flat 302, Silver Apartments',
      eta: 'Delivered',
      pickupSlot: 'N/A',
      status: 'Completed',
    ),
  ];

  static List<EarningModel> earnings = [
    EarningModel(
      date: "2025-12-01",
      deliveries: 12,
      amount: 360,
    ),
    EarningModel(
      date: "2025-12-02",
      deliveries: 15,
      amount: 450,
    ),
    EarningModel(
      date: "2025-12-03",
      deliveries: 10,
      amount: 300,
    ),
  ];

  static UserModel user = UserModel(
    id: 1,
    name: "Shubham Delivery",
    email: "delivery@example.com",
    phone: "9876543210",
    profilePic:
    "https://cdn-icons-png.flaticon.com/512/3177/3177440.png",
  );
}
