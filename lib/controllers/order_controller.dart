import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/data/models/order_model/order_model.dart';
import 'package:admin_app/data/repos/orders_repo.dart';

import 'package:admin_app/services/services.dart';

import 'package:get/get.dart';

class OrderController extends GetxController {
  OrderRepo orderRepo = Get.put(OrderRepo());

  RequestState? requestState;
  late String requestError;
  MyServices myServices = Get.find();
  List<OrderModel> ordersList = [];
  List<OrderModel> archivedList = [];
  List<OrderModel> acceptedList = [];
  List<OrderModel> pendingList = [];

  printOrderStatus(String value) {
    if (value == '0') {
      return "Order pending approval";
    } else if (value == '1') {
      return "Order being prepared";
    } else if (value == '2') {
      return "Order ready for delivery";
    } else if (value == '3') {
      return "Order on the way";
    } else {
      return "Archived";
    }
  }

  printOrderDeliveryType(String value) {
    if (value == '0') {
      return "Delivery";
    } else {
      return "Drive Throw";
    }
  }

  printOrderPaymentMethod(String value) {
    if (value == '0') {
      return "Cash";
    } else {
      return "Cards";
    }
  }

  viewOrders() async {
    requestState = RequestState.loading;
    update();
    var resulte = await orderRepo.view();
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      // customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      data['data'].sort((a, b) {
        return '${a['orders_status']}'.compareTo('${b['orders_status']}');
      });

      for (var item in data['data']) {
        ordersList.add(OrderModel.fromJson(item));
      }
      for (var item in ordersList) {
        if (item.ordersStatus != 0 && item.ordersStatus != 4) {
          acceptedList.add(item);
        }
        if (item.ordersStatus == 0) {
          pendingList.add(item);
        }
      }

      requestState = RequestState.success;
    });
    update();
  }

  archivedOrdersView() async {
    requestState = RequestState.loading;
    update();
    var resulte = await orderRepo.archived();
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      // customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      data['data'].sort((a, b) {
        return DateTime.parse(b['orders_datetime'])
            .compareTo(DateTime.parse(a['orders_datetime']));
      });

      for (var item in data['data']) {
        acceptedList.add(OrderModel.fromJson(item));
      }

      requestState = RequestState.success;
    });
    update();
  }

  approveOrder({required String orderId, required String userId}) async {
    requestState = RequestState.loading;
    update();
    var resulte = await orderRepo.approve(
      orderId: orderId,
      userId: userId,
    );
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      // customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      requestState = RequestState.success;
      customDialog(title: 'Success', body: 'Order Approved Successfully');
      refreshOrdersView();
    });
    update();
  }

  prepareDone({
    required String orderId,
    required String userId,
    required String orderType,
  }) async {
    requestState = RequestState.loading;
    update();
    var resulte = await orderRepo.prepere(
      orderId: orderId,
      userId: userId,
      orderType: orderType,
    );
    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      // customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      requestState = RequestState.success;
      customDialog(title: 'Success', body: 'Order Preperd Successfully');
      refreshOrdersView();
    });
    update();
  }

  refreshOrdersView() {
    ordersList = [];
    pendingList = [];
    acceptedList = [];
    viewOrders();
  }

  @override
  void onInit() {
    viewOrders();
    super.onInit();
  }
}
