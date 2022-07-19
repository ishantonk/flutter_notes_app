import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/widgets.dart';
import 'package:iconsax/iconsax.dart';

Container noteCardLongPressBottomSheet(BuildContext context, doc) {
  final currentNote =
      FirebaseFirestore.instance.collection('Notes').doc(doc.id);
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
          leading: const Icon(Iconsax.category),
          title: const Text('Category'),
          trailing: Text('${doc['category']}'),
          onTap: () => {
            Navigator.pop(context),
            showModalBottomSheet(
              context: context,
              builder: (context) =>
                  changeCategoryBottomSheet(context, doc.id, doc['category']),
            ),
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          leading: const Icon(Iconsax.paperclip_2),
          title: const Text('Pin'),
          trailing: Text(doc['isPinned'] ? 'Pinned' : 'Unpinned'),
          onTap: () => {
            Navigator.pop(context),
            currentNote.update({'isPinned': !doc['isPinned']}),
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          leading: const Icon(Iconsax.archive),
          title: Text(doc['isArchived'] ? 'Archive' : 'Unarchive'),
          onTap: () => {
            currentNote.update({'isArchived': !doc['isArchived']}),
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          iconColor: Theme.of(context).errorColor,
          textColor: Theme.of(context).errorColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          leading: const Icon(Iconsax.trash),
          title: const Text('Delete note'),
          onTap: () => {
            currentNote.delete(),
          },
        ),
      ],
    ),
  );
}
