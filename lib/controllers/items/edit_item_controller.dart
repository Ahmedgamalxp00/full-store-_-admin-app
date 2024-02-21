import 'dart:io';
import 'package:admin_app/core/utils/app_styles.dart';
import 'package:admin_app/data/models/category_model/category_model.dart';
import 'package:admin_app/data/repos/categories_repo.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:admin_app/controllers/items/view_items_controller.dart';
import 'package:admin_app/core/functions/custom_dialog.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/data/models/items_model/item.dart';
import 'package:admin_app/data/repos/items_repo.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditItemController extends GetxController {
  ItemsRepo itemsRepo = Get.put(ItemsRepo());

  ViewitemsController viewitemsController = Get.put(ViewitemsController());
  RequestState? requestState;
  late String requestError;
  ItemModel? item;
  List<SelectedListItem> categoriesDropDownList = [];
  GlobalKey<FormState> editCategoryformKey = GlobalKey<FormState>();
  String? categoryId;
  late TextEditingController editnameController;
  late TextEditingController editnamearController;
  late TextEditingController editDescController;
  late TextEditingController editDescarController;
  late TextEditingController editCountController;
  late TextEditingController editActiveController;
  late TextEditingController editPriceController;
  late TextEditingController editDiscountController;
  late TextEditingController editCategoryIdController;

  File? editImage;

  editItem({required String id, required String oldImage}) async {
    if (categoryId == null) {
      customDialog(title: 'Error', body: 'Please choose an category');
    }
    if (editCategoryformKey.currentState!.validate() && categoryId != null) {
      editCategoryformKey.currentState!.save();
      requestState = RequestState.loading;
      update();
      var resulte = await itemsRepo.edit(
        oldimage: oldImage,
        name: editnameController.text,
        namear: editnamearController.text,
        desc: editDescController.text,
        descar: editDescarController.text,
        active: editActiveController.text,
        count: editCountController.text,
        price: editPriceController.text,
        discount: editDiscountController.text,
        categoryid: '$categoryId',
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
        customDialog(title: 'Success', body: 'item Modfied successfully');
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
          editCategoryIdController.text = selectedListItem.name;
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
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
    item = Get.arguments["item"];
    editnameController = TextEditingController();
    editnamearController = TextEditingController();
    editDescController = TextEditingController();
    editDescarController = TextEditingController();
    editCountController = TextEditingController();
    editActiveController = TextEditingController();
    editPriceController = TextEditingController();
    editDiscountController = TextEditingController();
    editCategoryIdController = TextEditingController();
    editnameController.text = '${item!.itemsName}';
    editnamearController.text = '${item!.itemsNameAr}';
    editDescController.text = '${item!.itemsDesc}';
    editDescarController.text = '${item!.itemsDescAr}';
    editCountController.text = '${item!.itemsCount}';
    editActiveController.text = '${item!.itemsActive}';
    editPriceController.text = '${item!.itemsPrice}';
    editDiscountController.text = '${item!.itemsDiscount}';
    editCategoryIdController.text = '${item!.categoriesName}';
    categoryId = '${item!.itemsCategory}';
    getCategoriesList();
    super.onInit();
  }

  @override
  void dispose() {
    editnameController.dispose();
    editnamearController.dispose();
    editDescController.dispose();
    editDescarController.dispose();
    editCountController.dispose();
    editActiveController.dispose();
    editPriceController.dispose();
    editDiscountController.dispose();
    editCategoryIdController.dispose();
    super.dispose();
  }
}
