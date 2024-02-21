import 'dart:io';

import 'package:admin_app/controllers/categories/view_categories_controller.dart';
import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/data/models/category_model/category_model.dart';
import 'package:admin_app/data/repos/categories_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditCategoryController extends GetxController {
  CategoriesRepo categoriesRepo = Get.put(CategoriesRepo());
  ViewCategoriesController viewCategoriesController =
      Get.put(ViewCategoriesController());
  RequestState? requestState;
  late String requestError;
  CategoryModel? category;

  GlobalKey<FormState> editCategoryformKey = GlobalKey<FormState>();

  late TextEditingController editnameController;
  late TextEditingController editnamearController;

  File? editImage;
  List<CategoryModel> categoriesList = [];

  editCategory({required String id, required String oldImage}) async {
    if (editCategoryformKey.currentState!.validate()) {
      editCategoryformKey.currentState!.save();
      requestState = RequestState.loading;
      update();
      var resulte = await categoriesRepo.edit(
        oldimage: oldImage,
        name: editnameController.text,
        namear: editnamearController.text,
        image: editImage,
        id: id,
      );

      resulte.fold((failure) {
        requestError = failure.erorrMassage;
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: failure.erorrMassage);
      }, (data) {
        requestState = RequestState.success;
        Get.back();
        customDialog(title: 'Success', body: 'Category Modfied successfully');
        viewCategoriesController.refreshData();
      });
      update();
    }
  }

  pickImagefromGallery() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    Get.back();
    if (xFile != null) {
      editImage = File(xFile.path);
    }

    update();
  }

  pickImagefromCamera() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    Get.back();
    if (xFile != null) {
      editImage = File(xFile.path);
    }

    update();
  }

  @override
  void onInit() {
    category = Get.arguments["category"];
    editnameController = TextEditingController();
    editnamearController = TextEditingController();
    editnameController.text = '${category!.categoriesName}';
    editnamearController.text = '${category!.categoriesNameAr}';
    super.onInit();
  }

  @override
  void dispose() {
    editnameController.dispose();
    editnamearController.dispose();
    super.dispose();
  }
}
