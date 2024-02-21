import 'package:admin_app/controllers/categories/edit_category_controller.dart';
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

class EditCategoryForm extends StatelessWidget {
  const EditCategoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditCategoryController());
    return GetBuilder<EditCategoryController>(builder: (controller) {
      if (controller.requestState == RequestState.loading) {
        return const CustomLoadingWidget1();
      } else {
        return Form(
            key: controller.editCategoryformKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Customformfield(
                      // initialValue: '${controller.category!.categoriesName}',
                      validator: (value) => validateInput(value, 2, 50, ''),
                      hint: 'Category Name',
                      controller: controller.editnameController),
                  const Gap(10),
                  Customformfield(
                      // initialValue: '${controller.category!.categoriesNameAr}',
                      validator: (value) => validateInput(value, 2, 50, ''),
                      hint: 'Category Name (Arabic)',
                      controller: controller.editnamearController),
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
                      controller.editCategory(
                          id: '${controller.category!.categoriesId}',
                          oldImage: '${controller.category!.categoriesImage}');
                    },
                  ),
                ],
              ),
            ));
      }
    });
  }
}
