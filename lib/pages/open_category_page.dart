import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OpenCategory extends StatelessWidget {
  const OpenCategory({Key? key, required this.doc}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doc['name']),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Categories')
            .where('category', isEqualTo: doc.id)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot category = snapshot.data!.docs[index];
              return ListTile(
                title: Text(category['title']),
                subtitle: Text(category['content']),
              );
            },
          );
        },
      ),
    );
  }
}
