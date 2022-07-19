import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/themes.dart';

Widget noteCard(context, Function()? onTap, QueryDocumentSnapshot doc) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      borderOnForeground: true,
      color: NotesColors.colors[doc['colorId']],
      shadowColor: NotesColors.colors[doc['colorId']].withOpacity(0.2),
      surfaceTintColor: NotesColors.colors[doc['colorId']].withOpacity(0.2),
      elevation: 0,
      key: ValueKey(doc.id),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc['title'],
              style: Theme.of(context).textTheme.headline5,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            if (doc['content'] != null)
              Text(
                doc['content'],
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '${doc['dateCreated'].toDate().weekday}:${doc['dateCreated'].toDate().month}',
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
