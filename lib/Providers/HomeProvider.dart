
import 'package:flutter/cupertino.dart';
import 'package:hushus/Models/Sandwitch.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';

import '../Models/Order.dart';

class HomeProvider extends ChangeNotifier {
  Order cart_order = Order(order_id: 'order_id', total: 0, sandwitch_list: []);

  void addSandwitchToOrder(Sandwitch sandwitch) {
    print('adding sandwitch');
    sandwitch.ingredents.sort();
    cart_order.sandwitch_list.add(sandwitch);
    cart_order.total = cart_order.total + sandwitch.price ;
    notifyListeners();
  }
}
