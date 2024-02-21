import 'dart:io';

import 'package:admin_app/controllers/items/view_items_controller.dart';
import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/utils/app_styles.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/data/models/category_model/category_model.dart';
import 'package:admin_app/data/repos/categories_repo.dart';
import 'package:admin_app/data/repos/items_repo.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemController extends GetxController {
  ItemsRepo itemsRepo = Get.put(ItemsRepo());
  ViewitemsController viewitemsController = Get.put(ViewitemsController());
  RequestState? requestState;
  late String requestError;
  List<SelectedListItem> categoriesDropDownList = [];
  GlobalKey<FormState> additemformKey = GlobalKey<FormState>();
  late TextEditingController addnameController;
  late TextEditingController addnamearController;
  late TextEditingController addDescController;
  late TextEditingController addDescarController;
  late TextEditingController addCountController;
  late TextEditingController addActiveController;
  late TextEditingController addPriceController;
  late TextEditingController addDiscountController;
  late TextEditingController addCategoryIdController;
  String? categoryId;
  File? addImage;

  additem() async {
    if (addImage == null) {
      customDialog(title: 'Error', body: 'Please Add an Image');
    }
    if (categoryId == null) {
      customDialog(title: 'Error', body: 'Please choose an category');
    }

    if (additemformKey.currentState!.validate() &&
        addImage != null &&
        categoryId != null) {
      additemformKey.currentState!.save();

      requestState = RequestState.loading;
      update();
      var resulte = await itemsRepo.add(
        name: addnameController.text,
        namear: addnamearController.text,
        desc: addDescController.text,
        descar: addDescarController.text,
        active: addActiveController.text,
        count: addCountController.text,
        price: addPriceController.text,
        discount: addDiscountController.text,
        categoryid: '$categoryId',
        file: addImage!,
      );

      resulte.fold((failure) {
        requestError = failure.erorrMassage;
        requestState = RequestState.failure;
        customDialog(title: 'Error', body: failure.erorrMassage);
      }, (data) {
        requestState = RequestState.success;
        Get.back();
        customDialog(title: 'Success', body: 'Item Added successfully');
        viewitemsController.refreshData();
      });
      update();
    }
  }

  getCategoriesList() async {
    CategoriesRepo categoriesRepo = Get.put(CategoriesRepo());
    requestState = RequestState.loading;
    update();
    var resulte = await categoriesRepo.view();

    resulte.fold((failure) {
      requestState = RequestState.failure;
      requestError = failure.erorrMassage;
      customDialog(title: 'Error', body: failure.erorrMassage);
    }, (data) {
      List<CategoryModel> categoriesList = [];
      for (var item in data['data']) {
        categoriesList.add(CategoryModel.fromJson(item));
      }
      for (var item in categoriesList) {
        categoriesDropDownList.add(SelectedListItem(
            name: '${item.categoriesName}', value: '${item.categoriesId}'));
      }
      requestState = RequestState.success;
    });
    update();
  }

  showCategoriesDropDown(BuildContext context) {
    DropDownState(
      DropDown(
        bottomSheetTitle:
            const Text('choose an category', style: AppStyles.styleSemiBold18),
        submitButtonChild: const Text('Done', style: AppStyles.styleSemiBold18),
        data: categoriesDropDownList,
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          categoryId = '${selectedListItem.value}';
          addCategoryIdController.text = selectedListItem.name;
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
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
    addDescController = TextEditingController();
    addDescarController = TextEditingController();
    addCountController = TextEditingController();
    addActiveController = TextEditingController();
    addPriceController = TextEditingController();
    addDiscountController = TextEditingController();
    addCategoryIdController = TextEditingController();
    getCategoriesList();
    super.onInit();
  }

  @override
  void dispose() {
    addnameController.dispose();
    addnamearController.dispose();
    addDescController.dispose();
    addDescarController.dispose();
    addCountController.dispose();
    addActiveController.dispose();
    addPriceController.dispose();
    addDiscountController.dispose();
    addCategoryIdController.dispose();

    super.dispose();
  }
}
