import 'package:admin_app/controllers/categories/remove_category_controller.dart';
import 'package:admin_app/controllers/categories/view_categories_controller.dart';
import 'package:admin_app/core/shared/custom_loading1.dart';
import 'package:admin_app/core/shared/empty_widget.dart';
import 'package:admin_app/core/utils/app_router.dart';
import 'package:admin_app/core/utils/request_state.dart';
import 'package:admin_app/views/categories_view/widgets/categories_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewCategoriesController());
    RemoveCategoryController removeCategoryController =
        Get.put(RemoveCategoryController());
    return GetBuilder<ViewCategoriesController>(builder: (controller) {
      if (controller.requestState == RequestState.loading) {
        return const CustomLoadingWidget1();
      } else if (controller.requestState == RequestState.failure) {
        return const CustomEmptyWidget();
      } else {
        return ListView.separated(
          padding:
              const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 80),
          itemCount: controller.categoriesList.length,
          itemBuilder: (context, index) {
            return CategoriesListItem(
              onEditTap: () {
                Get.toNamed(AppRoute.editCategoriesView,
                    arguments: {"category": controller.categoriesList[index]});
              },
              onDeleteTap: () {
                removeCategoryController.removeCategory(
                    id: '${controller.categoriesList[index].categoriesId}',
                    image:
                        '${controller.categoriesList[index].categoriesImage}');
              },
              category: controller.categoriesList[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 5,
            );
          },
        );
      }
    });
  }
}
