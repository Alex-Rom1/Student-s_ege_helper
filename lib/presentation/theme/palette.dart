import 'package:flutter/material.dart';

abstract class Palette {
  abstract Color accent;
  abstract Color background;
  abstract Color bloc;
  abstract Color border;
  abstract Color hint;
  abstract Color text;

  List<Color> get colorsList => [
    accent,
    background,
    bloc,
    border,
    hint,
    text,
  ];
}

class DarkPalette extends Palette{
  @override
  Color accent = Color(0xFF004FB4);

  @override
  Color background = Color(0xFF212121);

  @override
  Color bloc = Color(0xFF353535);

  @override
  Color border = Color(0xFF4C4C4C);

  @override
  Color hint = Color(0xFF3C3C3C);

  @override
  Color text = Color(0xFFEBEBEB);
}

class LightPalette extends Palette{
  @override
  Color accent = Color(0xFF006FC4);

  @override
  Color background = Color(0xFFFCFFDB);

  @override
  Color bloc = Color(0xFFCAB69F);

  @override
  Color border = Color(0xFF4A3C2B);

  @override
  Color hint = Color(0xFF725C43);

  @override
  Color text = Color(0xFF1F1913);
}