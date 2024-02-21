import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/data/models/items_model/item.dart';
import 'package:admin_app/data/repos/items_repo.dart';
import 'package:get/get.dart';

class ViewitemsController extends GetxController {
  ItemsRepo itemsRepo = Get.put(ItemsRepo());
  RequestState? requestState;
  late String requestError;
  List<ItemModel> itemsList = [];
  viewItems() async {
    requestState = RequestState.loading;
    update();
    var resulte = await itemsRepo.view();

    resulte.fold((failure) {
      requestState = RequestState.failure;
      requestError = failure.erorrMassage;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      data['data'].sort((a, b) {
        return DateTime.parse(b['items_createat'])
            .compareTo(DateTime.parse(a['items_createat']));
      });

      for (var item in data['data']) {
        itemsList.add(ItemModel.fromJson(item));
      }
      requestState = RequestState.success;
    });
    update();
  }

  refreshData() {
    itemsList = [];
    viewItems();
  }

  @override
  void onInit() {
    viewItems();
    super.onInit();
  }
}
