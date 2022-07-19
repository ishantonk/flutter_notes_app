import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/pages/pages.dart';
import 'package:flutter_notes_app/widgets/cards/cards.dart';
import 'package:flutter_notes_app/widgets/header.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --Header--
        header(context, 1),
        // --Cards--
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("Categories").snapshots(),
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
                      'assets/images/folder.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      semanticLabel: 'No results found',
                    ),
                    const SizedBox(height: 8),
                    Text('No category found, add one...',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                );
              } else if (snapshot.hasData) {
                return GridView(
                  padding: const EdgeInsets.all(16.0),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                  ),
                  children: snapshot.data!.docs
                      .map(
                        (category) => categoryCard(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OpenCategory(doc: category),
                              ));
                        }, category),
                      )
                      .toList(),
                );
              }
              return Text('No Category Found',
                  style: Theme.of(context).textTheme.headline5);
            },
          ),
        ),
      ],
    );
  }
}
