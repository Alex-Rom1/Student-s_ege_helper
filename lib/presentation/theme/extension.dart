import 'package:flutter/material.dart';
import 'package:students_ege_helper/presentation/theme/palette.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final Palette palette;

  CustomTheme({required this.palette});

  @override
  ThemeExtension<CustomTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<CustomTheme> lerp(
    covariant ThemeExtension<CustomTheme>? other,
    double t,
  ) {
    return this;
  }

  static CustomTheme of(BuildContext context) =>
      Theme.of(context).extension<CustomTheme>()!;
}
