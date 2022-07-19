import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/utils.dart';
import 'package:flutter_notes_app/widgets/widgets.dart';
import 'package:iconsax/iconsax.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({Key? key, required this.doc}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  String _title = '';
  String _content = '';
  String _category = '';
  int _colorId = 0;
  bool _isArchived = false;
  bool _isPinned = false;
  final DateTime _dateEdited = DateTime.now();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _title = widget.doc['title'];
    _content = widget.doc['content'];
    _category = widget.doc['category'];
    _colorId = widget.doc['colorId'];
    _isArchived = widget.doc['isArchived'];
    _isPinned = widget.doc['isPinned'];
    _titleController.text = _title;
    _contentController.text = _content;
  }

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
              _editNoteHeader(context),
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

  Row _editNoteHeader(BuildContext context) {
    return Row(
      children: [
        // --Back-text-icon-button--
        TextButton.icon(
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
            if (_titleController.text.isNotEmpty) {
              await FirebaseFirestore.instance
                  .collection('Notes')
                  .doc(widget.doc.id)
                  .update({
                    'title': _titleController.text,
                    'content': _contentController.text,
                    'category': _category,
                    'colorId': _colorId,
                    'isArchived': _isArchived,
                    'isPinned': _isPinned,
                    'dateEdited': _dateEdited,
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
              'Created: ${widget.doc['dateCreated'].toDate().weekday.toString()} ${widget.doc['dateCreated'].toDate().day} ${widget.doc['dateCreated'].toDate().month} ${widget.doc['dateCreated'].toDate().year}',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          const SizedBox(height: 4.0),
          // --Edited-date-text--
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Edited: ${_dateEdited.weekday} ${_dateEdited.day} ${_dateEdited.month} ${_dateEdited.year}',
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
  BottomAppBar _noteBottomAppBar(BuildContext context) {
    return BottomAppBar(
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
              final changedColor = await showModalBottomSheet(
                context: context,
                builder: (context) =>
                    editNoteBottomSheet(context, _colorId, widget.doc),
                enableDrag: true,
              );
              setState(() {
                if (changedColor != null) _colorId = changedColor;
              });
            },
            icon: const Icon(Iconsax.more, size: 20),
          ),
        ],
      ),
    );
  }
}
