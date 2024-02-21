import 'package:admin_app/views/items_view/widgets/edit_item_form.dart';
import 'package:flutter/material.dart';

class EditItemsView extends StatelessWidget {
  const EditItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Item',
        ),
      ),
      body: const EditItemForm(),
    );
  }
}
