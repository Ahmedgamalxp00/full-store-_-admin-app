import 'package:admin_app/controllers/items/edit_item_controller.dart';
import 'package:admin_app/core/constants.dart';
import 'package:admin_app/core/functions/validate_formfield.dart';
import 'package:admin_app/core/shared/custom_botton.dart';
import 'package:admin_app/core/shared/custom_formfiled.dart';
import 'package:admin_app/core/shared/custom_loading1.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/views/categories_view/widgets/choose_image_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EditItemForm extends StatelessWidget {
  const EditItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditItemController());
    return GetBuilder<EditItemController>(builder: (controller) {
      if (controller.requestState == RequestState.loading) {
        return const CustomLoadingWidget1();
      } else {
        return Form(
            key: controller.editCategoryformKey,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Customformfield(
                        validator: (value) => validateInput(value, 2, 50, ''),
                        hint: 'Item Name',
                        controller: controller.editnameController),
                    const Gap(10),
                    Customformfield(
                        validator: (value) => validateInput(value, 2, 50, ''),
                        hint: 'Item Name (Arabic)',
                        controller: controller.editnamearController),
                    const Gap(10),
                    Customformfield(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        validator: (value) => validateInput(value, 2, 255, ''),
                        hint: 'Item Description',
                        controller: controller.editDescController),
                    const Gap(10),
                    Customformfield(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        validator: (value) => validateInput(value, 2, 255, ''),
                        hint: 'Item Description (Arabic)',
                        controller: controller.editDescarController),
                    const Gap(10),
                    Customformfield(
                        keyboardType: TextInputType.number,
                        validator: (value) => validateInput(value, 1, 10, ''),
                        hint: 'Item Count',
                        controller: controller.editCountController),
                    const Gap(10),
                    Customformfield(
                        keyboardType: TextInputType.number,
                        validator: (value) => validateInput(value, 1, 20, ''),
                        hint: 'Item Price',
                        controller: controller.editPriceController),
                    // const Gap(10),
                    // Customformfield(
                    //     validator: (value) => validateInput(value, 1, 1, ''),
                    //     hint: 'Item Active',
                    //     controller: controller.editActiveController),
                    const Gap(10),
                    Customformfield(
                        keyboardType: TextInputType.number,
                        hint: 'Item Discount',
                        controller: controller.editDiscountController),
                    const Gap(10),
                    Customformfield(
                        readOnly: true,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          controller.showCategoriesDropDown(context);
                        },
                        validator: (value) => validateInput(value, 1, 10, ''),
                        hint: 'Item Category Id',
                        controller: controller.editCategoryIdController),
                    const Gap(20),
                    CustomBottn(
                      color: controller.editImage != null
                          ? Colors.green
                          : kPrimeryColor,
                      text: 'Upload Image',
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return ChooseImageBottmSheet(
                                onCameraTap: () async {
                                  controller.pickImagefromCamera();
                                },
                                onGalleryTap: () async {
                                  controller.pickImagefromGallery();
                                },
                              );
                            });
                      },
                    ),
                    const Gap(10),
                    CustomBottn(
                      text: 'Save',
                      onTap: () {
                        controller.editItem(
                            id: '${controller.item!.itemsId}',
                            oldImage: '${controller.item!.itemsImage}');
                      },
                    ),
                  ],
                ),
              ),
            ));
      }
    });
  }
}
