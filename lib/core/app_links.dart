abstract class AppLinks {
  // server link
  static const String serverLink = "http://192.168.1.6/fullstoreapp";
  static const String categoriesImagesRoot = "$serverLink/upload/categories/";
  static const String itemsImagesRoot = "$serverLink/upload/items/";

  // authentication links
  static const String signUpLink = "$serverLink/admins/auth/sginup.php";
  static const String loginLink = "$serverLink/admins/auth/login.php";
  static const String verifyCodeLink = "$serverLink/admins/auth/verifycode.php";
  static const String resendVerifyCodeLink =
      "$serverLink/admins/auth/resendverifycode.php";
  static const String testLink = "$serverLink/test.php";

  // forget password links
  static const String forgrtPassVerifyCodeLink =
      "$serverLink/admins/forgetpassword/verifycode.php";
  static const String resetPassLink =
      "$serverLink/admins/forgetpassword/resetpassword.php";
  static const String checkEmailLink =
      "$serverLink/admins/forgetpassword/checkemail.php";

//categories links
  static const String viewCategoriesLink =
      "$serverLink/admins/categories/view.php";
  static const String editCategoryLink =
      "$serverLink/admins/categories/edit.php";
  static const String removeCategoryLink =
      "$serverLink/admins/categories/remove.php";
  static const String addCategoryLink = "$serverLink/admins/categories/add.php";
//items links
  static const String viewitemsLink = "$serverLink/admins/items/view.php";
  static const String edititemLink = "$serverLink/admins/items/edit.php";
  static const String removeitemLink = "$serverLink/admins/items/remove.php";
  static const String additemLink = "$serverLink/admins/items/add.php";

//home links
  static const String homeLink = "$serverLink/home.php";
  static const String imageCategoriesLink = "$serverLink/upload/categories";
  static const String imageItemsLink = "$serverLink/upload/items";

// items links
  static const String itemsLink = "$serverLink/items/items.php";

// favorites links
  static const String addToFavoritesLink = "$serverLink/favorite/add.php";
  static const String removeFromFavoritesLink =
      "$serverLink/favorite/remove.php";
  static const String viewFavoritesLink = "$serverLink/favorite/view.php";

// cart links
  static const String addToCartLink = "$serverLink/cart/add.php";
  static const String viewCartLink = "$serverLink/cart/view.php";
  static const String removeFromCartLink = "$serverLink/cart/remove.php";
  static const String deleteFromCartLink = "$serverLink/cart/delete.php";
  static const String getItemCountLink = "$serverLink/cart/getitemcount.php";

// address links
  static const String viewAddressLink = "$serverLink/adress/view.php";
  static const String addAddressLink = "$serverLink/adress/add.php";
  static const String removeAddressLink = "$serverLink/adress/remove.php";
  static const String editAddressLink = "$serverLink/adress/edit.php";
// coupon links
  static const String checkcouponLink = "$serverLink/coupon/checkcoupon.php";

// orders

  static const String ordersViewLink = "$serverLink/admins/orders/view.php";
  static const String approveOrderLink =
      "$serverLink/admins/orders/approve.php";
  static const String prepareLink = "$serverLink/admins/orders/prepare.php";
  static const String archivedLink = "$serverLink/admins/orders/archived.php";
  static const String ordersDetailsViewLink =
      "$serverLink/orders/viewdetails.php";

//notification

  static const String notificationRemoveLink =
      "$serverLink/notification/remove.php";
  static const String notificationviewLink =
      "$serverLink/notification/view.php";
}
