import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

Widget addNoteArchiveBottomSheet(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        const SizedBox(height: 24),
        _searchInput(context),
        const SizedBox(height: 16),
        Text('Add note to archive',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        // List of notes
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
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
                    Text('No note found, add some...',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                );
              } else if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data!.docs
                      .map((note) => _noteListTile(context, note))
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

// Function to build the search input
Row _searchInput(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            maxLines: 1,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              hintText: 'Search note',
              hintStyle: Theme.of(context).textTheme.subtitle1,
              prefixIcon: const Icon(Iconsax.search_normal),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Iconsax.arrow_down_1),
      ),
    ],
  );
}

// Function for getting list of notes
Container _noteListTile(BuildContext context, doc) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: ListTile(
      leading: const Icon(Iconsax.note_1),
      title:
          Text('${doc['title']}', overflow: TextOverflow.ellipsis, maxLines: 1),
      trailing: Checkbox(
        activeColor: Theme.of(context)
            .colorScheme
            .primary, // Color of checkbox when checked primary color
        value: doc['isArchived'],
        onChanged: (value) {
          // Add note to archive
          FirebaseFirestore.instance.collection('Notes').doc(doc.id).update(
            {
              'isArchived': value,
            },
          );
        },
      ),
      onTap: () {
        bool value = doc['isArchived'];
        HapticFeedback.lightImpact();
        FirebaseFirestore.instance.collection('Notes').doc(doc.id).update(
          {'isArchived': !value},
        );
      },
    ),
  );
}
