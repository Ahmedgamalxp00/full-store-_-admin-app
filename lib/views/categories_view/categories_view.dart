import 'package:admin_app/core/utils/app_router.dart';
import 'package:admin_app/views/categories_view/widgets/categories_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
        ),
      ),
      body: const CategoriesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addCategoriesView);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
