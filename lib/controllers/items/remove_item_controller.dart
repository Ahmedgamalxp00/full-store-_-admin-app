import 'package:admin_app/controllers/items/view_items_controller.dart';
import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/data/repos/items_repo.dart';
import 'package:get/get.dart';

class RemoveItemController extends GetxController {
  ItemsRepo itemsRepo = Get.put(ItemsRepo());
  ViewitemsController viewitemsController = Get.put(ViewitemsController());
  RequestState? requestState;
  late String requestError;

  removeItem({
    required String id,
    required String image,
  }) async {
    requestState = RequestState.loading;
    update();
    var resulte = await itemsRepo.remove(id: id, image: image);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      requestState = RequestState.success;

      // customDialog(title: 'Success', body: 'item Deleted successfully');
      viewitemsController.refreshData();
    });
    update();
  }
}
