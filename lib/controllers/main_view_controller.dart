import 'package:admin_app/views/orders_view/accepted_orders_view.dart';
import 'package:admin_app/views/orders_view/archived_orders_view.dart';
import 'package:admin_app/views/orders_view/pending_orders_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrdersMainViewController extends GetxController {
  List<Widget> screens = [
    const PendingOrdersView(),
    const AcceptedOrdersView(),
    const ArchivedOrdersView()
  ];
  Widget currentView = const PendingOrdersView();
  int selectedIndx = 0;
  onTabChange(int index) {
    currentView = screens[index];
    selectedIndx = index;
    update();
  }
}
