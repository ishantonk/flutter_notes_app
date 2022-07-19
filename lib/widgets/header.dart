import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/bottomSheets/bottom_sheets.dart';
import 'package:iconsax/iconsax.dart';

Widget header(BuildContext context, int pageIndex) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: Column(
      children: [
        Row(
          // Icon, Page-heading-text and Search-icon-button row
          children: [
            // --Icon--
            Icon(
              getHeaderIcon(pageIndex),
              color: Colors.black,
              size: 40,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.24),
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            const SizedBox(width: 8),
            // --Page-heading-text--
            Text(
              getHeaderText(pageIndex),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            // --Search-icon-button--
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const SearchNoteBottomSheet(),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  enableDrag: true,
                  isScrollControlled: true,
                  backgroundColor:
                      Theme.of(context).bottomSheetTheme.backgroundColor,
                );
              },
              icon: const Icon(Iconsax.search_normal),
              alignment: Alignment.centerRight,
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Next row
        getHeaderNextRow(context, pageIndex),
        const SizedBox(height: 4),
      ],
    ),
  );
}

// Function for getting header icon based on page index
getHeaderIcon(int pageIndex) {
  if (pageIndex == 0) {
    return Iconsax.note;
  } else if (pageIndex == 1) {
    return Iconsax.category_2;
  } else if (pageIndex == 2) {
    return Iconsax.archive;
  } else if (pageIndex == 3) {
    return Iconsax.setting_2;
  }
}

// Function for getting header text based on page index
getHeaderText(int pageIndex) {
  if (pageIndex == 0) {
    return 'Notes';
  } else if (pageIndex == 1) {
    return 'Categories';
  } else if (pageIndex == 2) {
    return 'Archive';
  } else if (pageIndex == 3) {
    return 'Settings';
  }
}

// Function for getting header next row content based on page index
getHeaderNextRow(context, int pageIndex) {
  if (pageIndex == 0) {
    // Notes page next row
    return Row(
      // User name, Greeting-text and User-profile-image row
      children: [
        // --User-name and Greeting-text--
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --User-name--
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("User").snapshots(),
              initialData: null,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...');
                } else {
                  String name = snapshot.data.docs[0]['name'];
                  return Text('Hey  $name',
                      style: Theme.of(context).textTheme.headline6);
                }
              },
            ),
            // --Greeting-text--
            if (DateTime.now().hour < 12)
              Text('Good morning',
                  style: Theme.of(context).textTheme.headlineMedium),
            if (DateTime.now().hour >= 12 && DateTime.now().hour < 18)
              Text('Good afternoon',
                  style: Theme.of(context).textTheme.headlineMedium),
            if (DateTime.now().hour >= 18)
              Text('Good evening',
                  style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
        const Spacer(),
        // --User-profile-image--
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).buttonTheme.colorScheme!.background,
          ),
          child: const Icon(Iconsax.user),
        ),
      ],
    );
  } else if (pageIndex == 1) {
    // Category page next row
    return Row(
      // Add-category-text and Add-category-icon-button row
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // --Add-category-text--
        Text('Add category', style: Theme.of(context).textTheme.headline6),
        // --Add-category-icon-button--
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const NewCategoryBottomSheet(),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              enableDrag: true,
              isScrollControlled: true,
              backgroundColor:
                  Theme.of(context).bottomSheetTheme.backgroundColor,
            );
          },
          icon: const Icon(Iconsax.folder_add),
          alignment: Alignment.centerRight,
        ),
      ],
    );
  } else if (pageIndex == 2) {
    // Archive page next row
    return Row(
      // Add-Note-text and Add-Note-icon-button row
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // --Add-category-text--
        Text('Add notes', style: Theme.of(context).textTheme.headline6),
        // --Add-category-icon-button--
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => addNoteArchiveBottomSheet(context),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              enableDrag: true,
              isScrollControlled: true,
              backgroundColor:
                  Theme.of(context).bottomSheetTheme.backgroundColor,
            );
          },
          icon: const Icon(Iconsax.archive_add),
          alignment: Alignment.centerRight,
        ),
      ],
    );
  } else if (pageIndex == 3) {
    return const Text('Settings');
  }
}
