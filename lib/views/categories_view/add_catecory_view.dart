import 'package:admin_app/views/categories_view/widgets/add_category_form.dart';
import 'package:flutter/material.dart';

class AddCategoriesView extends StatelessWidget {
  const AddCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Categories',
        ),
      ),
      body: const AddCategoryForm(),
    );
  }
}
