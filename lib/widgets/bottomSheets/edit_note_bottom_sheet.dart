import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/themes.dart';
import 'package:flutter_notes_app/widgets/bottomSheets/bottom_sheets.dart';
import 'package:flutter_notes_app/widgets/color_slider.dart';
import 'package:iconsax/iconsax.dart';

Widget editNoteBottomSheet(BuildContext context, int currentColorId, doc) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      Divider(
        indent: 132,
        endIndent: 132,
        color: Theme.of(context).dividerColor,
        thickness: 4,
      ),
      const SizedBox(height: 8),
      ListTile(
        enableFeedback: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        iconColor: Theme.of(context).errorColor,
        textColor: Theme.of(context).errorColor,
        leading: const Icon(Iconsax.trash),
        title: const Text('Delete'),
        onTap: () => {
          Navigator.pop(context),
          showModalBottomSheet(
            context: context,
            // Confirm delete bottom sheet is called here and passing doc as a parameter
            builder: (context) =>
                confirmDeleteBottomSheet(context, doc, 'note'),
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
        leading: const Icon(Iconsax.copy),
        title: const Text('Duplicate note'),
        onTap: () => {},
      ),
      const SizedBox(height: 8),
      ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        leading: const Icon(Iconsax.share),
        title: const Text('Share'),
        onTap: () => {},
      ),
      const SizedBox(height: 8),
      ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        leading: const Icon(Iconsax.tag),
        title: const Text('Label'),
        onTap: () => {},
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
    ]),
  );
}
