import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/routes.dart';
import 'package:flutter_notes_app/widgets/notes_card.dart';
import 'package:flutter_notes_app/widgets/themes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 24, bottom: 32, left: 16, right: 16),
              child: Row(
                children: [
                  const Icon(
                    Iconsax.note,
                    size: 32,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Notes',
                    style: MyTheme.headline1TextStyle,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    icon: const Icon(Iconsax.search_status, size: 24),
                  ),
                  IconButton(
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    icon: const Icon(Iconsax.direct_inbox, size: 24),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(8.0),
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: MyTheme.swatchColor1,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: MyTheme.swatchColor3,
                    ),
                    child: const Center(
                      child: Text(
                        'Notes',
                        style: MyTheme.headline4TextStyle,
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: MyTheme.swatchColor1,
                    ),
                    child: const Center(
                      child: Text(
                        'Highlights',
                        style: MyTheme.headline4TextStyle,
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: MyTheme.swatchColor1,
                    ),
                    child: const Center(
                      child: Text(
                        'Favorite',
                        style: MyTheme.headline4TextStyle,
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Row(children: [
                const Expanded(
                    child: Text(
                  'List Notes',
                  style: MyTheme.headline3TextStyle,
                )),
                const Text('All Notes', style: MyTheme.textStyle2),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: IconButton(
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    color: MyTheme.textColor2,
                    iconSize: 16,
                    icon: const Icon(
                      Iconsax.arrow_down5,
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: MasonryGridView(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                children: const [
                  MyNoteCard(
                    title: 'Note 1',
                    description:
                        'This is a note 1 description hello this is dummy note',
                    color: MyTheme.swatchColor1,
                    date: '12/12/2020',
                  ),
                  MyNoteCard(
                    title: 'Note 2',
                    description: 'This is a note',
                    color: MyTheme.swatchColor2,
                    date: '12/12/2020',
                  ),
                  MyNoteCard(
                    title: 'Note 3',
                    description: 'This is a note',
                    color: MyTheme.swatchColor3,
                    date: '12/12/2020',
                  ),
                  MyNoteCard(
                    title: 'Note 4',
                    description: 'This is a note',
                    color: MyTheme.swatchColor4,
                    date: '12/12/2020',
                  ),
                  MyNoteCard(
                    title: 'Note 5',
                    description: 'This is a note',
                    color: MyTheme.swatchColor5,
                    date: '12/12/2020',
                  ),
                  MyNoteCard(
                    title: 'Note 6',
                    description: 'This is a note',
                    color: MyTheme.swatchColor6,
                    date: '12/12/2020',
                  ),
                  MyNoteCard(
                    title: 'Note 7',
                    description: 'This is a note',
                    color: MyTheme.swatchColor1,
                    date: '12/12/2020',
                  ),
                  MyNoteCard(
                    title: 'Note 8',
                    description: 'This is a note',
                    color: MyTheme.swatchColor2,
                    date: '12/12/2020',
                  ),
                  MyNoteCard(
                    title: 'Note 9',
                    description: 'This is a note',
                    color: MyTheme.swatchColor3,
                    date: '12/12/2020',
                  ),
                  MyNoteCard(
                    title: 'Note 10',
                    description: 'This is a note',
                    color: MyTheme.swatchColor4,
                    date: '12/12/2020',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.addNote);
        },
        child: const Icon(Iconsax.add, size: 32),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
            backgroundColor: MyTheme.swatchColor3,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal),
            label: 'Search',
            backgroundColor: MyTheme.swatchColor3,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle),
            label: 'Add',
            backgroundColor: MyTheme.swatchColor3,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting_2),
            label: 'Settings',
            backgroundColor: MyTheme.swatchColor3,
          ),
        ],
        currentIndex: 0,
        selectedItemColor: MyTheme.swatchColor5,
        unselectedItemColor: MyTheme.swatchColor2,
        iconSize: 24,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          print(index);
        },
      ),
    );
  }
}
