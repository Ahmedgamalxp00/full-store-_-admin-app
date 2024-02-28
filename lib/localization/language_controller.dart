import 'package:admin_app/core/utils/app_router.dart';
import 'package:admin_app/services/services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LanguageController extends GetxController {
  late Locale language;
  MyServices myServices = Get.find();
  changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    Get.updateLocale(locale);
    Get.offAllNamed(AppRoute.loginView);
  }

  @override
  void onInit() {
    String? sharedPrefLocale = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLocale == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLocale == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
