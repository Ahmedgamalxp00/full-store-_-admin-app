import 'package:admin_app/controllers/archived_controller.dart';
import 'package:admin_app/views/orders_view/widgets/archived_orders_listview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ArchivedOrdersView extends StatelessWidget {
  const ArchivedOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchivedController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archived Orders'),
      ),
      body: const ArchivedOrdersListView(),
    );
  }
}
