import 'package:flutter/material.dart';

const _colorPrimary = Color(0xFFF9A826);
const _colorText = Color(0xFF343437);
const _colorTextLight = Color(0xFFACA4A4);

// Todo: Add theme to app
// -

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _colorPrimary,
        primary: _colorPrimary,
      ),
      // bottomAppBarColor: _colorSecondary,

      // IconButton
      iconTheme: const IconThemeData(
        size: 24,
        color: _colorText,
      ),

      // FloatingActionButton
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _colorPrimary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        focusColor: Theme.of(context).colorScheme.primary,
        hoverColor: Theme.of(context).colorScheme.primary,
        splashColor: Theme.of(context).colorScheme.primary,
        iconSize: 36,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enableFeedback: true,
        elevation: 0,
      ),

      // TextButton
      textButtonTheme: TextButtonThemeData(
        style: Theme.of(context).textButtonTheme.style,
      ),

      // ListTile
      listTileTheme: ListTileThemeData(
        enableFeedback: true,
        style: ListTileStyle.list,
        tileColor: Theme.of(context).cardColor,
        textColor: Theme.of(context).listTileTheme.textColor,
        selectedColor: Theme.of(context).listTileTheme.selectedColor,
        selectedTileColor: Theme.of(context).listTileTheme.selectedTileColor,
        iconColor: Theme.of(context).listTileTheme.iconColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),

      // Checkbox
      checkboxTheme: CheckboxThemeData(
        fillColor: Theme.of(context).checkboxTheme.fillColor,
        checkColor: Theme.of(context).checkboxTheme.checkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),

      // Bottom sheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
      ),

      // ButtonAppBar
      bottomAppBarTheme: BottomAppBarTheme(
        color: Theme.of(context).bottomAppBarTheme.color,
        elevation: 0,
      ),

      // BottomNavigationBar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        elevation: 0,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(
          fontSize: 0.0,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 0.0,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
          size: 20,
        ),
        selectedIconTheme: IconThemeData(
          size: 24,
          shadows: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              spreadRadius: 8,
            ),
          ],
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Theme.of(context).dialogBackgroundColor,
      brightness: Brightness.dark,
    );
  }
}

class NotesColors {
  static const colors = [
    Color(0xffffffff), // classic white
    Color(0xfff28b81), // light pink
    Color(0xfff7bd02), // yellow
    Color(0xfffbf476), // light yellow
    Color(0xffcdff90), // light green
    Color(0xffa7feeb), // turquoise
    Color(0xffcbf0f8), // light cyan
    Color(0xffafcbfa), // light blue
    Color(0xffd7aefc), // plum
    Color(0xfffbcfe9), // misty rose
    Color(0xffe6c9a9), // light brown
    Color(0xffe9eaee) // light gray
  ];

  static const Color borderColor = Color(0xffd3d3d3);
  static const Color foregroundColor = Color(0xff595959);
}

class CategoriesColors {
  static const colors = [
    Color(0xFFFA0F1B), // red pigment
    Color(0xFFFC6E22), // orange red
    Color(0xFFF49F01), // orange web
    Color(0xFF9CBE37), // android green
    Color(0xFF1BACC6), // pacific blue
    Color(0xFFE9DFA5) // medium champagne
  ];
}
