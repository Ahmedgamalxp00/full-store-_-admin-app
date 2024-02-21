import 'package:admin_app/views/categories_view/widgets/edit_category_form.dart';
import 'package:flutter/material.dart';

class EditCategoriesView extends StatelessWidget {
  const EditCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Categories',
        ),
      ),
      body: const EditCategoryForm(),
    );
  }
}
