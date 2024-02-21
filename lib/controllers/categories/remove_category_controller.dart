import 'package:admin_app/controllers/categories/view_categories_controller.dart';
import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/data/models/category_model/category_model.dart';
import 'package:admin_app/data/repos/categories_repo.dart';
import 'package:get/get.dart';

class RemoveCategoryController extends GetxController {
  CategoriesRepo categoriesRepo = Get.put(CategoriesRepo());
  ViewCategoriesController viewCategoriesController =
      Get.put(ViewCategoriesController());
  RequestState? requestState;
  late String requestError;

  List<CategoryModel> categoriesList = [];
  removeCategory({
    required String id,
    required String image,
  }) async {
    requestState = RequestState.loading;
    update();
    var resulte = await categoriesRepo.remove(id: id, image: image);

    resulte.fold((failure) {
      requestError = failure.erorrMassage;
      requestState = RequestState.failure;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      requestState = RequestState.success;

      customDialog(title: 'Success', body: 'Category Deleted successfully');
      viewCategoriesController.refreshData();
    });
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
