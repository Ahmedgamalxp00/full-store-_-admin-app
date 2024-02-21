import 'package:admin_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeGridItem extends StatelessWidget {
  const HomeGridItem(
      {super.key, required this.title, required this.image, this.onTap});
  final String title;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(image),
              const Spacer(),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleSemiBold14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
