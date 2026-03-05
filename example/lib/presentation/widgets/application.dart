import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_ege_helper/presentation/theme/extension.dart';
import 'package:students_ege_helper/presentation/theme/palette.dart';
import 'package:students_ege_helper/presentation/typography/custom_styles.dart';
import 'package:students_ege_helper/presentation/widgets/utils.dart';
import 'package:students_ege_helper/presentation/widgets/custom_button.dart';
import 'package:students_ege_helper/presentation/widgets/custom_input.dart';

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

        Column(
          spacing: 10.h,
          children: [
            for (var text in CustomStyles.stylesMap.entries) ...[
              Text(
                text.key,
                style: text.value.copyWith(color: theme.palette.text),
              ),
            ],
          ],
        ),

        SizedBox.square(
          dimension: 40.r,
          child: CustomButton(
            type: .icon,
            onPressed: _testBtnFunc,
            icon: Icon(Icons.arrow_back, color: theme.palette.text, size: 24.r,),
          ),
        ),
        SizedBox(
          width: 336.w,
          child: CustomButton(
            type: .standart,
            onPressed: _testBtnFunc,
            text: 'Использовать токен',
          ),
        ),
        SizedBox(
          width: 336.w,
          child: CustomButton(
            type: .simple,
            onPressed: _testBtnFunc,
            text: 'Использовать токен',
          ),
        ),
        SizedBox(width: 336.w, child: CustomInput(controller: .new(), label: 'token',)),
        SizedBox(width: 336.w, child: CustomInput(controller: .new(text: 'text'), hint: 'token',)),
        SizedBox(width: 336.w, child: CustomInput(controller: .new(), label: 'token', hint: 'token',)),
      ];
    },
  );

  void _testBtnFunc() {
    debugPrint('button pressed');
  }
}
