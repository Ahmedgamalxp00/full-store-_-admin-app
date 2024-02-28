import 'package:admin_app/controllers/home_controller.dart';
import 'package:admin_app/core/utils/app_assets.dart';
import 'package:admin_app/core/utils/app_router.dart';
import 'package:admin_app/views/home_views/widgets/home_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      childAspectRatio: 0.77,
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        HomeGridItem(
          title: 'Categories',
          image: Assets.imagesCategoriesImage,
          onTap: () {
            Get.toNamed(AppRoute.categoriesView);
          },
        ),
        HomeGridItem(
          title: 'Products',
          image: Assets.imagesProducts,
          onTap: () {
            Get.toNamed(AppRoute.itemsView);
          },
        ),
        HomeGridItem(
          title: 'Users',
          image: Assets.imagesUsers,
          onTap: () {},
        ),
        HomeGridItem(
          title: 'Orders',
          image: Assets.imagesOrders,
          onTap: () {
            Get.toNamed(AppRoute.ordersMainView);
          },
        ),
        HomeGridItem(
          title: 'Reports',
          image: Assets.imagesReports,
          onTap: () {},
        ),
        HomeGridItem(
          title: 'Notifications',
          image: Assets.imagesNotification,
          onTap: () {},
        ),
        HomeGridItem(
          title: 'logout',
          image: Assets.imagesLogout,
          onTap: () {
            homeController.logOut();
          },
        ),
      ],
    );
  }
}
