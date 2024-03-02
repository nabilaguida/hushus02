

import 'Sandwitch.dart';

class Order {
  String order_id;
  int total;
  List<Sandwitch> sandwitch_list;

  Order(
      {required this.order_id,
        required this.total,
        required this.sandwitch_list
      }
      );

  factory Order.fromJson(
      Map<String, dynamic> responseData) {
    return Order(
      order_id: responseData['order_id'] ?? 'order_id',
      total: responseData['total'] ?? 'total',
      sandwitch_list: responseData['sandwitch_list'] ?? 'sandwitch_list',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'order_id': order_id,
      'total': total,
      'sandwitch_list': sandwitch_list,
    };
  }
}