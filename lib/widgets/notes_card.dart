import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/themes.dart';
import 'package:iconsax/iconsax.dart';

class MyNoteCard extends StatelessWidget {
  const MyNoteCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.color,
      required this.date})
      : super(key: key);
  final String title;
  final String description;
  final String date;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/note');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 1,
        margin: const EdgeInsets.all(4.0),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: MyTheme.headline2TextStyle,
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: MyTheme.textStyle1,
              ),
              SizedBox(height: 8),
              Text(
                date,
                style: MyTheme.textStyle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
