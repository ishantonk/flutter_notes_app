import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchNoteBottomSheet extends StatefulWidget {
  const SearchNoteBottomSheet({Key? key}) : super(key: key);

  @override
  State<SearchNoteBottomSheet> createState() => _SearchNoteBottomSheetState();
}

class _SearchNoteBottomSheetState extends State<SearchNoteBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 24),
          _searchInput(context),
          const SizedBox(height: 16),
          Text('Search results', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Notes")
                  .snapshots()
                  .where((event) => event.docs.any((doc) => doc['title']
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()))),
              initialData: null,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      const SizedBox(height: 8),
                      Image.asset(
                        'assets/images/search.png',
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                    ],
                  );
                } else {
                  return ListView(
                    children: snapshot.data!.docs
                        .map((note) => _noteListTile(context, note))
                        .toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Row _searchInput(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: TextField(
              controller: _searchController,
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              maxLines: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                prefixIcon: const Icon(Iconsax.search_normal),
                hintText: 'Search',
                hintStyle: Theme.of(context).textTheme.bodyText1,
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
}

Widget _noteListTile(BuildContext context, doc) {
  return ListTile(
    enableFeedback: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    leading: const Icon(Iconsax.note_1),
    title:
        Text('${doc['title']}', overflow: TextOverflow.ellipsis, maxLines: 1),
    subtitle:
        Text('${doc['content']}', overflow: TextOverflow.ellipsis, maxLines: 2),
    onTap: () {
      FirebaseFirestore.instance.collection('Notes').doc(doc.id).get().then(
        (doc) {
          Navigator.pop(context, doc.data());
        },
      );
    },
  );
}
