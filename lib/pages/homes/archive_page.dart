import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/pages/pages.dart';
import 'package:flutter_notes_app/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --Header--
        header(context, 2), // 2 is the index of the archive page
        // --Staggered-grid-view--
        // --Cards--
        Expanded(
          // Use expand for the height of the screen
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Notes")
                .where("isArchived", isEqualTo: true)
                .snapshots(),
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
                      'assets/images/vault.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 8),
                    Text('No note found, add some...',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                );
              } else if (snapshot.hasData) {
                return MasonryGridView(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  children: snapshot.data!.docs
                      .map((note) => noteCard(context, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditNotePage(doc: note),
                                ));
                          }, note))
                      .toList(),
                );
              }
              return const Center(child: Text('No Notes Found'));
            },
          ),
        ),
      ],
    );
  }
}
