import 'package:admin_app/controllers/items/add_item_controller.dart';
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

class AddItemForm extends StatelessWidget {
  const AddItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemController());
    return GetBuilder<AddItemController>(
      builder: (controller) {
        if (controller.requestState == RequestState.loading) {
          return const CustomLoadingWidget1();
        } else {
          return Form(
            key: controller.additemformKey,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Customformfield(
                        keyboardType: TextInputType.name,
                        validator: (value) => validateInput(value, 2, 50, ''),
                        hint: 'Item Name',
                        controller: controller.addnameController),
                    const Gap(10),
                    Customformfield(
                        keyboardType: TextInputType.name,
                        validator: (value) => validateInput(value, 2, 50, ''),
                        hint: 'Item Name (Arabic)',
                        controller: controller.addnamearController),
                    const Gap(10),
                    Customformfield(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        validator: (value) => validateInput(value, 2, 255, ''),
                        hint: 'Item Description',
                        controller: controller.addDescController),
                    const Gap(10),
                    Customformfield(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        validator: (value) => validateInput(value, 2, 255, ''),
                        hint: 'Item Description (Arabic)',
                        controller: controller.addDescarController),
                    const Gap(10),
                    Customformfield(
                        keyboardType: TextInputType.number,
                        validator: (value) => validateInput(value, 1, 10, ''),
                        hint: 'Item Count',
                        controller: controller.addCountController),
                    const Gap(10),
                    Customformfield(
                        keyboardType: TextInputType.number,
                        validator: (value) => validateInput(value, 1, 20, ''),
                        hint: 'Item Price',
                        controller: controller.addPriceController),
                    // const Gap(10),
                    // Customformfield(
                    //     validator: (value) => validateInput(value, 1, 1, ''),
                    //     hint: 'Item Active',
                    //     controller: controller.addActiveController),
                    const Gap(10),
                    Customformfield(
                        keyboardType: TextInputType.number,
                        hint: 'Item Discount',
                        controller: controller.addDiscountController),
                    const Gap(10),
                    Customformfield(
                        readOnly: true,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          controller.showCategoriesDropDown(context);
                        },
                        validator: (value) => validateInput(value, 1, 10, ''),
                        hint: 'Item Category',
                        controller: controller.addCategoryIdController),
                    const Gap(20),
                    CustomBottn(
                      color: controller.addImage != null
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
                      text: 'Add',
                      onTap: () async {
                        await controller.additem();
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
