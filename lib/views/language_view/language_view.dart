import 'package:admin_app/core/shared/custom_botton.dart';
import 'package:admin_app/core/utils/app_styles.dart';
import 'package:admin_app/localization/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1'.tr,
              style: AppStyles.styleExtraBold24,
            ),
            const Gap(30),
            CustomBottn(
              text: 'Ar',
              onTap: () {
                controller.changeLanguage("ar");
              },
            ),
            const Gap(20),
            CustomBottn(
                text: 'En',
                onTap: () {
                  controller.changeLanguage("en");
                }),
          ],
        ),
      ),
    );
  }
}
