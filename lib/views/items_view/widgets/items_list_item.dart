import 'package:admin_app/core/app_links.dart';
import 'package:admin_app/core/utils/app_styles.dart';
import 'package:admin_app/data/models/items_model/item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ItemsListItem extends StatelessWidget {
  const ItemsListItem(
      {super.key, this.onDeleteTap, this.onEditTap, required this.item});
  final ItemModel item;
  final void Function()? onDeleteTap;
  final void Function()? onEditTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onEditTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              if (item.itemsImage!.contains('svg'))
                SvgPicture.network(
                  height: 60,
                  width: 90,
                  '${AppLinks.categoriesImagesRoot}${item.itemsImage}',
                ),
              if (!item.itemsImage!.contains('svg'))
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 60,
                  width: 90,
                  imageUrl: '${AppLinks.itemsImagesRoot}${item.itemsImage}',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              const Gap(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.itemsName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.styleSemiBold18,
                    ),
                    const Gap(5),
                    Text(
                      '${item.itemsCreateat}',
                      style: AppStyles.styleSemiBold14,
                    )
                  ],
                ),
              ),
              const Gap(20),
              IconButton(
                onPressed: onDeleteTap,
                icon: const Icon(Icons.delete),
              ),
              // IconButton(
              //   onPressed: onEditTap,
              //   icon: const Icon(Icons.edit),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
