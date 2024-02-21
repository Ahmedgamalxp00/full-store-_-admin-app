import 'package:admin_app/core/utils/app_router.dart';
import 'package:admin_app/views/items_view/widgets/items_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Items',
        ),
      ),
      body: const ItemsListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addItemsView);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
