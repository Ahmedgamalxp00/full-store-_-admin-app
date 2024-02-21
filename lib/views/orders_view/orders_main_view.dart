import 'package:admin_app/controllers/main_view_controller.dart';
import 'package:admin_app/core/shared/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrdersMainView extends StatelessWidget {
  const OrdersMainView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersMainViewController());

    return GetBuilder<OrdersMainViewController>(
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          body: controller.currentView,
          bottomNavigationBar: CustomBottmNavBar(
            onTabChange: (index) => controller.onTabChange(index),
            selectedIndx: controller.selectedIndx,
          ),
        );
      },
    );
  }
}
