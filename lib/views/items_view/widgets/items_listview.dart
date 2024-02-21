import 'package:admin_app/controllers/items/remove_item_controller.dart';
import 'package:admin_app/controllers/items/view_items_controller.dart';
import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/shared/custom_loading1.dart';
import 'package:admin_app/core/shared/empty_widget.dart';
import 'package:admin_app/core/utils/app_router.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/views/items_view/widgets/items_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewitemsController());
    RemoveItemController removeItemController = Get.put(RemoveItemController());
    return GetBuilder<ViewitemsController>(builder: (controller) {
      if (controller.requestState == RequestState.loading) {
        return const CustomLoadingWidget1();
      } else if (controller.requestState == RequestState.failure) {
        return const CustomEmptyWidget();
      } else {
        return ListView.separated(
          padding:
              const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 80),
          itemCount: controller.itemsList.length,
          itemBuilder: (context, index) {
            return ItemsListItem(
              onEditTap: () {
                Get.toNamed(AppRoute.editItemsView,
                    arguments: {"item": controller.itemsList[index]});
              },
              onDeleteTap: () {
                customDialog(
                  confirmText: "Confirm",
                  title: 'Alert',
                  body: 'Are you sure you want delete Item',
                  onConfirmTap: () {
                    removeItemController.removeItem(
                        id: '${controller.itemsList[index].itemsId}',
                        image: '${controller.itemsList[index].itemsImage}');
                    Get.back();
                  },
                );
              },
              item: controller.itemsList[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 5,
            );
          },
        );
      }
    });
  }
}
