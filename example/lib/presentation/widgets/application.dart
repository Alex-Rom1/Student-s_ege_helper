import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_ege_helper/presentation/theme/extension.dart';
import 'package:students_ege_helper/presentation/theme/palette.dart';
import 'package:students_ege_helper/presentation/widgets/utils.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final _darkPalette = DarkPalette();
  final _lightPalette = LightPalette();

  @override
  Widget build(BuildContext context) => MaterialAppWrapper(
    buildWidgets: (context) {
      final theme = CustomTheme.of(context);

      return [
        Row(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Column(
              children: [
                Text(_darkPalette.toString()),

                for (var color in _darkPalette.colorsList) ...[
                  Container(width: 100.w, height: 100.h, color: color),
                ],
              ],
            ),
            Column(
              children: [
                Text(_lightPalette.toString()),

                for (var color in _lightPalette.colorsList) ...[
                  Container(width: 100.w, height: 100.h, color: color),
                ],
              ],
            ),
          ],
        ),
      ];
    },
  );
}
