enum OrderStatus { pending, assigned, picked, onWay, delivered, cancelled }

class OrderModel {
  final String id;
  final String pickupAddress;
  final String deliveryAddress;
  final double price;
  final OrderStatus status;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.price,
    required this.status,
    required this.createdAt,
  });
}
