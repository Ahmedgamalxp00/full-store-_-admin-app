import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/data/models/category_model/category_model.dart';
import 'package:admin_app/data/repos/categories_repo.dart';
import 'package:get/get.dart';

class ViewCategoriesController extends GetxController {
  CategoriesRepo categoriesRepo = Get.put(CategoriesRepo());
  RequestState? requestState;
  late String requestError;
  List<CategoryModel> categoriesList = [];
  viewcategories() async {
    requestState = RequestState.loading;
    update();
    var resulte = await categoriesRepo.view();

    resulte.fold((failure) {
      requestState = RequestState.failure;
      requestError = failure.erorrMassage;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      data['data'].sort((a, b) {
        return DateTime.parse(b['categories_createat'])
            .compareTo(DateTime.parse(a['categories_createat']));
      });

      for (var item in data['data']) {
        categoriesList.add(CategoryModel.fromJson(item));
      }
      requestState = RequestState.success;
    });
    update();
  }

  refreshData() {
    categoriesList = [];
    viewcategories();
  }

  @override
  void onInit() {
    viewcategories();

    super.onInit();
  }
}
