import 'package:flutter/material.dart';
import 'package:flutter_notes_app/utils/themes.dart';

class ColorSlider extends StatefulWidget {
  const ColorSlider(
      {Key? key, required this.colorsList, required this.currentColorId})
      : super(key: key);
  final int currentColorId; // Current color index
  final List<Color> colorsList; // List<Color>
  @override
  State<ColorSlider> createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  int _currentColorId = 0; // Current color index
  final noteBorderColor = NotesColors.borderColor;
  final noteForegroundColor = NotesColors.foregroundColor;
  final _check = const Icon(Icons.check);

  @override
  void initState() {
    setState(() {
      _currentColorId = widget.currentColorId;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
          widget.colorsList.length, (index) => _buildColor(context, index)),
    );
  }

  _buildColor(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentColorId = index;
        });
        Navigator.pop(context, _currentColorId);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: noteBorderColor, width: 1),
          shape: BoxShape.circle,
          color: noteBorderColor,
        ),
        child: CircleAvatar(
          foregroundColor: noteForegroundColor,
          backgroundColor: widget.colorsList[index],
          child: _currentColorId == index ? _check : null,
        ),
      ),
    );
  }
}
