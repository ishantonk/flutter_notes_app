import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notes_app/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

Widget confirmDeleteBottomSheet(BuildContext context, doc, String docType) {
  return Padding(
    padding: MediaQuery.of(context).viewInsets,
    child: Container(
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
          Text('Delete Category',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text('Are you sure you want to delete this $docType?',
              style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: 16),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                // Cancel button
                style: TextButton.styleFrom(
                  elevation: 0,
                  enableFeedback: true,
                  primary: Theme.of(context).colorScheme.primary,
                  textStyle: Theme.of(context).textTheme.button,
                  backgroundColor: Theme.of(context).canvasColor,
                  shadowColor: Theme.of(context).colorScheme.primary,
                  fixedSize: const Size(124, 42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () => {
                  HapticFeedback.mediumImpact(),
                  Navigator.pop(context),
                },
                icon: const Icon(Icons.cancel_outlined),
                label: const Text('Cancel'),
              ),
              TextButton.icon(
                // Cancel button
                style: TextButton.styleFrom(
                  elevation: 0,
                  enableFeedback: true,
                  primary: Theme.of(context).colorScheme.error,
                  textStyle: Theme.of(context).textTheme.button,
                  backgroundColor: Theme.of(context).canvasColor,
                  shadowColor: Theme.of(context).colorScheme.error,
                  fixedSize: const Size(124, 42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () => {
                  doc.reference.delete(),
                  HapticFeedback.mediumImpact(),
                  Navigator.popAndPushNamed(context, MyRoutes.landing),
                },
                icon: const Icon(Iconsax.trash),
                label: const Text('Delete'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
