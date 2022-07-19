import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notes_app/pages/pages.dart';
import 'package:iconsax/iconsax.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _screenIndex = 0;
  final screens = [
    const HomePage(),
    const CategoryPage(),
    const ArchivePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          // child: screens[currentIndex],
          child: IndexedStack(
        index: _screenIndex,
        children: screens,
      )),
      // FloatingActionButton to add a new note
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddNotePage(),
          ),
        ),
        child: const Icon(Iconsax.pen_add5),
      ),

      // bottomNavigationBar

      bottomNavigationBar: SizedBox(
        height: 52,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home),
                label: 'Home',
                activeIcon: Icon(Iconsax.home, color: Colors.amberAccent),
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.category_2),
                label: 'Categories',
                activeIcon: Icon(Iconsax.category_2, color: Colors.blueAccent),
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.archive),
                label: 'Archive',
                activeIcon: Icon(Iconsax.archive, color: Colors.greenAccent),
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.setting_2),
                label: 'Settings',
                activeIcon: Icon(Iconsax.setting_2, color: Colors.redAccent),
              ),
            ],
            currentIndex: _screenIndex,
            onTap: (int index) {
              HapticFeedback.mediumImpact();
              setState(() {
                _screenIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
