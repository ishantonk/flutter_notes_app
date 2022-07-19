import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --Header--
        header(context, 3), // 3 is the index of the settings page
      ],
    );
  }
}
