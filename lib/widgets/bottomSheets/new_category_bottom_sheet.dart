import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notes_app/utils/themes.dart';
import 'package:flutter_notes_app/widgets/color_slider.dart';

class NewCategoryBottomSheet extends StatefulWidget {
  const NewCategoryBottomSheet({Key? key}) : super(key: key);

  @override
  State<NewCategoryBottomSheet> createState() => _NewCategoryBottomSheetState();
}

class _NewCategoryBottomSheetState extends State<NewCategoryBottomSheet> {
  final TextEditingController _categoryController = TextEditingController();
  int _currentColorId = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
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
            Text('Add New Category',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextField(
              controller: _categoryController,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).canvasColor,
                hintText: 'Category name',
                hintStyle: Theme.of(context).textTheme.subtitle1,
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              enableFeedback: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              tileColor: Theme.of(context).canvasColor,
              iconColor: Theme.of(context).popupMenuTheme.color,
              textColor: Theme.of(context).popupMenuTheme.color,
              leading: const Icon(Icons.color_lens_rounded),
              trailing: CircleAvatar(
                backgroundColor: CategoriesColors.colors[_currentColorId],
              ),
              title: const Text('Choose color'),
              onTap: () async {
                final changedColor = await showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        chooseCategoryColorBottomSheet(context),
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                    enableDrag: true,
                    isScrollControlled: true,
                    backgroundColor:
                        Theme.of(context).colorScheme.onBackground);
                setState(() {
                  if (changedColor != null) _currentColorId = changedColor;
                });
              },
            ),
            const SizedBox(height: 16),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  // Cancel button
                  style: TextButton.styleFrom(
                    elevation: 0,
                    enableFeedback: true,
                    primary: Theme.of(context).colorScheme.error,
                    textStyle: Theme.of(context).textTheme.button,
                    backgroundColor: Theme.of(context).canvasColor,
                    shadowColor: Theme.of(context).colorScheme.error,
                    fixedSize: const Size(124, 42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => {
                    HapticFeedback.heavyImpact(),
                    Navigator.pop(context),
                  },
                  icon: const Icon(Icons.cancel_outlined),
                  label: const Text('Cancel'),
                ),
                TextButton.icon(
                  // Add button
                  style: TextButton.styleFrom(
                    elevation: 0,
                    enableFeedback: true,
                    primary: Theme.of(context).colorScheme.primary,
                    textStyle: Theme.of(context).textTheme.button,
                    backgroundColor: Theme.of(context).canvasColor,
                    shadowColor: Theme.of(context).colorScheme.primary,
                    fixedSize: const Size(124, 42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () async {
                    if (_categoryController.text.isNotEmpty) {
                      await FirebaseFirestore.instance
                          .collection('Categories')
                          .add(
                            {
                              'name': _categoryController.text,
                              'colorId': _currentColorId,
                            },
                          )
                          .then((value) => Navigator.pop(context))
                          .catchError(
                            (onError) => {
                              HapticFeedback.heavyImpact(),
                              print('Something went wrong: $onError'),
                            },
                          );
                      _categoryController.clear();
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Widget chooseCategoryColorBottomSheet(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Divider(
            indent: 132,
            endIndent: 132,
            color: Theme.of(context).dividerColor,
            thickness: 4,
          ),
          const SizedBox(height: 8),
          Text('Choose color', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width,
              child: ColorSlider(
                  currentColorId: _currentColorId,
                  colorsList: CategoriesColors.colors),
            ),
          ),
        ]));
  }
}
