import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

Widget categoryCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 0,
      color: CategoriesColors.colors[doc['colorId']].withAlpha(75),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Iconsax.folder_25,
                  color: CategoriesColors.colors[doc['colorId']], size: 64),
              const SizedBox(height: 16),
              Text(doc['name']),
            ],
          ),
        ),
      ),
    ),
  );
}
