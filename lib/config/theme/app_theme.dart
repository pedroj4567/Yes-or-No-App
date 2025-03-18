import 'package:flutter/material.dart';

const Color _customColor = Color(0X0000ff55);
const List<Color> _colorThemes = [
  Color.fromARGB(0, 37, 169, 81),
  Colors.blueAccent,
  Colors.red,
  Colors.pink,
  Colors.orange,
  Colors.lightGreenAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(
          selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
          'Color must be between 0 and ${_colorThemes.length}',
        );
  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.light,
    );
  }
}
