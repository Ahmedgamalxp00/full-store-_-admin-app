import 'dart:io';

import 'package:admin_app/controllers/categories/view_categories_controller.dart';
import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/data/models/category_model/category_model.dart';
import 'package:admin_app/data/repos/categories_repo.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddCategoryController extends GetxController {
  CategoriesRepo categoriesRepo = Get.put(CategoriesRepo());
  ViewCategoriesController viewCategoriesController =
      Get.put(ViewCategoriesController());
  RequestState? requestState;
  late String requestError;
  GlobalKey<FormState> addCategoryformKey = GlobalKey<FormState>();
  late TextEditingController addnameController;
  late TextEditingController addnamearController;

  File? addImage;

  List<CategoryModel> categoriesList = [];

  addCategory() async {
    if (addImage == null) {
      customDialog(title: 'Error', body: 'Please Add an Image');
    }
    if (addCategoryformKey.currentState!.validate() && addImage != null) {
      addCategoryformKey.currentState!.save();

      requestState = RequestState.loading;
      update();
      var resulte = await categoriesRepo.add(
        name: addnameController.text,
        namear: addnamearController.text,
        file: addImage!,
      );

      resulte.fold((failure) {
        requestError = failure.erorrMassage;
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: failure.erorrMassage);
      }, (data) {
        requestState = RequestState.success;
        Get.back();
        customDialog(title: 'Success', body: 'Category Added successfully');
        viewCategoriesController.refreshData();
      });
      update();
    }
  }

  pickImagefromGallery() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    Get.back();
    if (xFile != null) {
      addImage = File(xFile.path);
    }

    update();
  }

  pickImagefromCamera() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    Get.back();
    if (xFile != null) {
      addImage = File(xFile.path);
    }

    update();
  }

  @override
  void onInit() {
    addnameController = TextEditingController();
    addnamearController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    addnameController.dispose();
    addnamearController.dispose();

    super.dispose();
  }
}
