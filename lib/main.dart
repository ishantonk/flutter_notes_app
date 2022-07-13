import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notes_app/pages/add_note_page.dart';
import 'package:flutter_notes_app/pages/home_page.dart';
import 'package:flutter_notes_app/utils/routes.dart';
import 'package:flutter_notes_app/widgets/themes.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set status bar color to the same color as the background(transparent).
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: true, // Show debug banner.
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home: (context) => const MyHomePage(),
        MyRoutes.addNote: (context) => const AddNote(),
      },
    );
  }
}
