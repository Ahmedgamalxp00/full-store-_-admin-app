import 'package:admin_app/core/constants.dart';
import 'package:admin_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomBottn extends StatelessWidget {
  const CustomBottn(
      {super.key, required this.text, this.onTap, this.color = kPrimeryColor});
  final String text;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
          height: 50,
          color: color,
          disabledColor: color,
          onPressed: onTap,
          child: Text(
            text,
            style: AppStyles.styleSemiBold20,
          )),
    );
  }
}
