import 'package:admin_app/core/constants.dart';
import 'package:admin_app/core/utils/app_styles.dart';
import 'package:admin_app/views/home_views/widgets/home_gridview.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimeryColor,
        title: const Text(
          'Admin Home',
          style: AppStyles.styleSemiBold20,
        ),
      ),
      body: const HomeGridView(),
    );
  }
}
