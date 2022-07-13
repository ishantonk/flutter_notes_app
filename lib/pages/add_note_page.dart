import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/themes.dart';
import 'package:iconsax/iconsax.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 24, bottom: 16, left: 16, right: 16),
              child: Row(
                children: const [
                  Icon(
                    Iconsax.note_add,
                    size: 32,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Add Notes',
                    style: MyTheme.headline1TextStyle,
                  ),
                  Spacer(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Row(children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Iconsax.arrow_left, size: 28),
                ),
                const Text(
                  'Back',
                  style: MyTheme.headline4TextStyle,
                ),
                const Spacer(),
                const Text(
                  'Done',
                  style: MyTheme.headline4TextStyle,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Iconsax.tick_circle, size: 28),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: MyTheme.swatchColor1,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: MyTheme.headline3TextStyle,
                ),
                maxLines: 1,
                style: MyTheme.headline3TextStyle,
                enableSuggestions: false,
                textCapitalization: TextCapitalization.words,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: MyTheme.swatchColor1,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Content',
                    hintStyle: MyTheme.textStyle1,
                  ),
                  maxLines: 1,
                  style: MyTheme.textStyle1,
                  enableSuggestions: false,
                  textCapitalization: TextCapitalization.words,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.text_bold),
            label: 'Bold',
            backgroundColor: MyTheme.swatchColor3,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.text_italic),
            label: 'Italic',
            backgroundColor: MyTheme.swatchColor3,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.text_underline),
            label: 'Underline',
            backgroundColor: MyTheme.swatchColor3,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.textalign_justifycenter),
            label: 'Justify',
            backgroundColor: MyTheme.swatchColor3,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.link_214),
            label: 'Link',
            backgroundColor: MyTheme.swatchColor3,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.more),
            label: 'more',
            backgroundColor: MyTheme.swatchColor3,
          ),
        ],
        currentIndex: 0,
        selectedItemColor: MyTheme.swatchColor5,
        unselectedItemColor: MyTheme.swatchColor2,
        iconSize: 24,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
