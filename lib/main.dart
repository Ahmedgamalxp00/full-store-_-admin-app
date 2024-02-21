import 'package:admin_app/core/constants.dart';
import 'package:admin_app/core/mybinding.dart';
import 'package:admin_app/core/utils/app_router.dart';
import 'package:admin_app/localization/language_controller.dart';
import 'package:admin_app/localization/translations.dart';
import 'package:admin_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LanguageController languageController =
        Get.put(LanguageController(), permanent: true);
    return GetMaterialApp(
      theme: myTheme,
      locale: languageController.language,
      translations: MyTranslations(),
      initialBinding: MyBinding(),
      debugShowCheckedModeBanner: false,
      getPages: myRoutes,
    );
  }
}
