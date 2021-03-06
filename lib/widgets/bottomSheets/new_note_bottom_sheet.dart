import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/utils.dart';
import 'package:flutter_notes_app/widgets/widgets.dart';
import 'package:iconsax/iconsax.dart';

Widget newNoteBottomSheet(
    BuildContext context, int currentColorId, String category) {
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
          leading: const Icon(Iconsax.category5),
          trailing: Text(category),
          title: const Text('Choose category'),
          onTap: () async {
            final changedCategory = await showModalBottomSheet(
              context: context,
              builder: (context) =>
                  chooseCategoryBottomSheet(context, category),
            );
            Map<String, dynamic> data;
            data = {'category': changedCategory};
            Navigator.pop(context, data);
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
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
