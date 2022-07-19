import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notes_app/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

// Function for choosing category for new note. (important: on choosing category for new note we have no doc(document) id so we can't modify category directly. We have to pass "category name" back to add_note_page.)
Container chooseCategoryBottomSheet(BuildContext context, currentCategory) {
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
        // List of notes
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("Categories").snapshots(),
            initialData: null,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.size == 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/void.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 8),
                    Text('No category found, add some...',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                );
              } else if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data!.docs
                      .map((category) => _chooseCategoryListTile(
                          context, category, currentCategory))
                      .toList(),
                );
              }
              return const Center(child: Text('No Notes Found'));
            },
          ),
        ),
      ],
    ),
  );
}

// Function for getting list of categories tiles.
Container _chooseCategoryListTile(BuildContext context, doc, currentCategory) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: ListTile(
      tileColor: doc['name'] == currentCategory
          ? CategoriesColors.colors[doc['colorId']].withOpacity(0.2)
          : Theme.of(context).listTileTheme.tileColor,
      leading: const Icon(Iconsax.note_1),
      title:
          Text('${doc['name']}', overflow: TextOverflow.ellipsis, maxLines: 1),
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.pop(context, doc['name']);
      },
    ),
  );
}

// Function for changeling category for old note. (important: directly modify category in note document in database.)
Container changeCategoryBottomSheet(
    BuildContext context, noteDocId, currentCategory) {
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
        Text('Change category', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        // List of notes
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("Categories").snapshots(),
            initialData: null,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.size == 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/void.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 8),
                    Text('No category found, add some...',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                );
              } else if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data!.docs
                      .map((category) => _changeCategoryListTile(
                          context, category, noteDocId, currentCategory))
                      .toList(),
                );
              }
              return const Center(child: Text('No Notes Found'));
            },
          ),
        ),
      ],
    ),
  );
}

// Function for getting list of categories tiles.
Container _changeCategoryListTile(
    BuildContext context, doc, noteDocId, currentCategory) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: ListTile(
      tileColor: doc['name'] == currentCategory
          ? CategoriesColors.colors[doc['colorId']].withOpacity(0.2)
          : Theme.of(context).listTileTheme.tileColor,
      leading: const Icon(Iconsax.note_1),
      title:
          Text('${doc['name']}', overflow: TextOverflow.ellipsis, maxLines: 1),
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.pop(context);
        FirebaseFirestore.instance.collection('Notes').doc(noteDocId).update({
          'category': doc['name'],
        });
      },
    ),
  );
}
