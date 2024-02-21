import 'package:admin_app/views/items_view/widgets/add_item_form.dart';
import 'package:flutter/material.dart';

class AddItemsView extends StatelessWidget {
  const AddItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Item',
        ),
      ),
      body: const AddItemForm(),
    );
  }
}
