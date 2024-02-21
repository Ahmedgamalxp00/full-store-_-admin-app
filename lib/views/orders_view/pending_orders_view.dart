import 'package:admin_app/controllers/order_controller.dart';
import 'package:admin_app/views/orders_view/widgets/pending_orders_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrdersView extends StatelessWidget {
  const PendingOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Orders'),
      ),
      body: const PendingOrdersListView(),
    );
  }
}
