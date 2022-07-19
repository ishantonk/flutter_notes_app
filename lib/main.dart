import 'package:firebase_core/firebase_core.dart'; // For firebase initialization
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For status bar color
import 'package:flutter_notes_app/pages/pages.dart';
import 'package:flutter_notes_app/utils/utils.dart'; // For themes and router

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
      theme: AppTheme.lightTheme(context), // Set light theme.
      darkTheme: AppTheme.darkTheme(context),
      initialRoute: MyRoutes.landing,
      routes: {
        MyRoutes.landing: (context) => const MainPage(),
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.category: (context) => const CategoryPage(),
        MyRoutes.archive: (context) => const ArchivePage(),
        MyRoutes.settings: (context) => const SettingsPage(),
        MyRoutes.addNote: (context) => const AddNotePage(),
      },
    );
  }
}
