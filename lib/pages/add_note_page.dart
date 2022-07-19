import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/utils.dart';
import 'package:flutter_notes_app/widgets/widgets.dart';
import 'package:iconsax/iconsax.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  int _colorId = 0;
  String _category = 'General';
  final DateTime _dateCreated = DateTime.now();
  final DateTime _dateEdited = DateTime.now();
  final bool _isArchived = false;
  final bool _isPinned = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotesColors.colors[_colorId],
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // --Header--
              _addNoteHeader(context),
              // --Text-fields--
              _textFields(context),
              // --Bottom-app-bar--
              _noteBottomAppBar(context),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create the header of the page.
  Row _addNoteHeader(BuildContext context) {
    return Row(
      children: [
        // --Back-text-icon-button--
        TextButton.icon(
          style: TextButton.styleFrom(
            elevation: 0,
            backgroundColor: Theme.of(context).canvasColor,
            shadowColor: Theme.of(context).colorScheme.primary,
            fixedSize: const Size(124, 42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Iconsax.arrow_left_2),
          label: const Text('All notes'),
        ),
        const Spacer(),
        // --Save-text-icon-button--
        TextButton.icon(
          style: TextButton.styleFrom(
            elevation: 0,
            enableFeedback: true,
            backgroundColor: Theme.of(context).canvasColor,
            shadowColor: Theme.of(context).colorScheme.primary,
            fixedSize: const Size(124, 42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () async {
            if (_titleController.text.isNotEmpty) {
              await FirebaseFirestore.instance
                  .collection('Notes')
                  .add({
                    'title': _titleController.text,
                    'content': _contentController.text,
                    'category': _category,
                    'colorId': _colorId,
                    'dateCreated': _dateCreated,
                    'dateEdited': _dateEdited,
                    'isArchived': _isArchived,
                    'isPinned': _isPinned,
                  })
                  .then((value) => Navigator.pop(context))
                  .catchError((onError) => Navigator.pop(context));
            } else {
              // show error

              // todo: show error
            }
          },
          icon: const Icon(Icons.done),
          label: const Text('Save'),
        ),
      ],
    );
  }

  // Function to create the text-fields
  Expanded _textFields(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // --Title-text-field--
          TextField(
            controller: _titleController,
            autocorrect: false,
            enableInteractiveSelection: true,
            enableSuggestions: false,
            maxLines: 1,
            textCapitalization: TextCapitalization.sentences,
            style: Theme.of(context).textTheme.headlineLarge,
            decoration: InputDecoration(
              hintText: 'Title',
              hintStyle: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 4.0),
          // --Created-date-text--
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Created: ${_dateCreated.toIso8601String()}',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          const SizedBox(height: 8.0),
          // --Content-text-field--
          Expanded(
            child: TextField(
              scrollPhysics: const BouncingScrollPhysics(),
              controller: _contentController,
              autocorrect: false,
              enableInteractiveSelection: true,
              enableSuggestions: false,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Content',
                hintStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  // Function to get Bottom App Bar
  Container _noteBottomAppBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: BottomAppBar(
          color: Theme.of(context).canvasColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.text_bold, size: 20),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.text_italic, size: 20),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.text_underline, size: 20),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.textalign_justifycenter, size: 20),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.link_214, size: 20),
              ),
              IconButton(
                onPressed: () async {
                  final data = await showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        newNoteBottomSheet(context, _colorId, _category),
                    enableDrag: true,
                  );
                  setState(() {
                    if (data != null) {
                      if (data['colorId'] != null) {
                        _colorId = data['colorId'];
                      } else if (data['category'] != null) {
                        _category = data['category'];
                      }
                    }
                  });
                },
                icon: const Icon(Iconsax.more, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
