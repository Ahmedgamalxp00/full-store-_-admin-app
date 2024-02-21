import 'package:admin_app/views/auth_views/forget_password_view.dart';
import 'package:admin_app/views/auth_views/login_view.dart';
import 'package:admin_app/views/auth_views/otp_view.dart';
import 'package:admin_app/views/auth_views/reset_pass_otp_view.dart';
import 'package:admin_app/views/auth_views/reset_password_view.dart';
import 'package:admin_app/views/auth_views/success_view.dart';
import 'package:admin_app/views/categories_view/add_catecory_view.dart';
import 'package:admin_app/views/categories_view/categories_view.dart';
import 'package:admin_app/views/categories_view/edit_categor_view.dart';
import 'package:admin_app/views/home_views/home_view.dart';
import 'package:admin_app/views/items_view/add_item_view.dart';
import 'package:admin_app/views/items_view/edit_item_view.dart';
import 'package:admin_app/views/items_view/items_view.dart';
import 'package:admin_app/views/orders_view/orders_main_view.dart';
import 'package:admin_app/views/orders_details_view/orders_details_view.dart';
import 'package:admin_app/views/orders_view/accepted_orders_view.dart';
import 'package:admin_app/views/orders_view/archived_orders_view.dart';
import 'package:admin_app/views/orders_view/pending_orders_view.dart';

import 'package:get/get.dart';

class AppRoute {
  static const String splashView = "/splashView";
  static const String loginView = "/loginView";
  static const String signUp = "/signUp";
  static const String languageView = "/languageView";
  static const String forgetPassView = "/forgetPassView";
  static const String otpView = "/otpView";
  static const String forgetPassotpView = "/forgetPassotpView";
  static const String resetPassword = "/resetPassword";
  static const String successView = "/successView";
  static const String homeView = "/homeView";
  static const String categoriesView = "/categoriesView";
  static const String addCategoriesView = "/addCategoriesView";
  static const String editCategoriesView = "/editCategoriesView";
  static const String ordersMainView = "/ordersMainView";
  static const String itemsView = "/itemsView";
  static const String addItemsView = "/addItemsView";
  static const String editItemsView = "/editItemsView";
  static const String specialOffersView = "/specialOffersView";
  static const String topSellingView = "/topSellingView";
  static const String productDetailesView = "/ProductDetailesView";
  static const String favoriteView = "/FavoriteView";
  static const String profileView = "/ProfileView";
  static const String cartView = "/cartView";
  static const String addressView = "/addressView";
  static const String addAddressView = "/addAddressView";
  static const String chechOutView = "/ChechOutView";
  static const String archivedOrdersView = "/archivedOrdersView";
  static const String acceptedOrdersView = "/acceptedOrdersView";
  static const String pendingOrdersView = "/archivedOrdersView";
  static const String ordersDetailsView = "/ordersDetailsView";
  static const String notificationView = "/NotificationView";
  static const String myTest = "/mytest";
}

List<GetPage<dynamic>> myRoutes = [
  GetPage(name: '/', page: () => const HomeView()),
  // GetPage(
  //   name: '/',
  //   page: () => const LanguageView(),
  //   middlewares: [MyMiddlewalre()],
  // ),
  GetPage(name: AppRoute.loginView, page: () => const LoginView()),
  GetPage(name: AppRoute.forgetPassView, page: () => const ForgetPassView()),
  GetPage(name: AppRoute.otpView, page: () => const OtpView()),
  GetPage(
      name: AppRoute.forgetPassotpView, page: () => const ResetPassOtpView()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successView, page: () => const SuccessView()),
  GetPage(name: AppRoute.homeView, page: () => const HomeView()),
  GetPage(name: AppRoute.categoriesView, page: () => const CategoriesView()),
  GetPage(name: AppRoute.itemsView, page: () => const ItemsView()),
  GetPage(name: AppRoute.addItemsView, page: () => const AddItemsView()),
  GetPage(name: AppRoute.editItemsView, page: () => const EditItemsView()),
  GetPage(
      name: AppRoute.addCategoriesView, page: () => const AddCategoriesView()),
  GetPage(
      name: AppRoute.editCategoriesView,
      page: () => const EditCategoriesView()),
  GetPage(name: AppRoute.ordersMainView, page: () => const OrdersMainView()),
  GetPage(
      name: AppRoute.ordersDetailsView, page: () => const OrdersDetailsView()),
  GetPage(
      name: AppRoute.archivedOrdersView,
      page: () => const ArchivedOrdersView()),
  GetPage(
      name: AppRoute.acceptedOrdersView,
      page: () => const AcceptedOrdersView()),
  GetPage(
      name: AppRoute.pendingOrdersView, page: () => const PendingOrdersView()),
  // GetPage(name: AppRoute.itemsView, page: () => const ItemsView()),
  // GetPage(name: AppRoute.topSellingView, page: () => const TopSellingView()),
  // GetPage(
  //     name: AppRoute.specialOffersView, page: () => const SpecialOffersView()),
  // GetPage(
  //     name: AppRoute.productDetailesView,
  //     page: () => const ProductDetailesView()),
  // GetPage(name: AppRoute.favoriteView, page: () => const FavoriteView()),
  // GetPage(name: AppRoute.cartView, page: () => const CartView()),
  // GetPage(name: AppRoute.profileView, page: () => const ProfileView()),
  // GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  // GetPage(name: AppRoute.addAddressView, page: () => const AddAddressView()),
  // GetPage(name: AppRoute.chechOutView, page: () => const ChechOutView()),

  // GetPage(
  //     name: AppRoute.archivedOrdersView,
  //     page: () => const ArchivedOrdersView()),

  // GetPage(
  //     name: AppRoute.notificationView, page: () => const NotificationView()),
];
