import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

Widget chooseCategoryBottomSheet(BuildContext context, int currentCategoryId) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          indent: 132,
          endIndent: 132,
          color: Theme.of(context).dividerColor,
          thickness: 4,
        ),
        const SizedBox(height: 8),
        Text('Choose category', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          tileColor: Theme.of(context).canvasColor,
          iconColor: Theme.of(context).popupMenuTheme.color,
          textColor: Theme.of(context).popupMenuTheme.color,
          leading: const Icon(Iconsax.category_25),
          title: const Text('Category'),
          onTap: () => {
            Navigator.pop(context),
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          enableFeedback: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          tileColor: Theme.of(context).canvasColor,
          iconColor: Theme.of(context).popupMenuTheme.color,
          textColor: Theme.of(context).popupMenuTheme.color,
          leading: const Icon(Icons.color_lens_rounded),
          trailing: CircleAvatar(
            backgroundColor: CategoriesColors.colors[0],
          ),
          title: const Text('Choose color'),
          onTap: () {},
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}
