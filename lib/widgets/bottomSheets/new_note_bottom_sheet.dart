import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/themes.dart';
import 'package:flutter_notes_app/widgets/bottomSheets/bottom_sheets.dart';
import 'package:flutter_notes_app/widgets/color_slider.dart';
import 'package:iconsax/iconsax.dart';

Widget newNoteBottomSheet(BuildContext context, int currentColorId) {
  int currentCategoryId = 0;
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
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          tileColor: Theme.of(context).canvasColor,
          iconColor: Theme.of(context).popupMenuTheme.color,
          textColor: Theme.of(context).popupMenuTheme.color,
          leading: const Icon(Iconsax.category5),
          trailing: const Text('Notes'),
          title: const Text('Choose category'),
          onTap: () => {
            Navigator.pop(context),
            showModalBottomSheet(
              context: context,
              builder: (context) =>
                  chooseCategoryBottomSheet(context, currentCategoryId),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              enableDrag: true,
              backgroundColor: Theme.of(context).colorScheme.onBackground,
            ),
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          tileColor: Theme.of(context).canvasColor,
          iconColor: Theme.of(context).popupMenuTheme.color,
          textColor: Theme.of(context).popupMenuTheme.color,
          leading: const Icon(Iconsax.image5),
          title: const Text('Add image'),
          onTap: () => {
            Navigator.pop(context),
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          tileColor: Theme.of(context).canvasColor,
          iconColor: Theme.of(context).popupMenuTheme.color,
          textColor: Theme.of(context).popupMenuTheme.color,
          leading: const Icon(Iconsax.clipboard_text),
          title: const Text('Clipboard'),
          onTap: () => {
            Navigator.pop(context),
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          tileColor: Theme.of(context).canvasColor,
          iconColor: Theme.of(context).popupMenuTheme.color,
          textColor: Theme.of(context).popupMenuTheme.color,
          leading: const Icon(Iconsax.textalign_left),
          title: const Text('Font alignment'),
          onTap: () => {
            Navigator.pop(context),
          },
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: ColorSlider(
                currentColorId: currentColorId, colorsList: NotesColors.colors),
          ),
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}
