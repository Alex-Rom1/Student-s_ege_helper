import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_ege_helper/presentation/pages/main_page.dart';
import 'package:students_ege_helper/presentation/pages/token_page.dart';
import 'package:students_ege_helper/presentation/theme/extension.dart';
import 'package:students_ege_helper/presentation/theme/palette.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: .new(376, 832),
    child: GetMaterialApp(
      theme: ThemeData.light().copyWith(
        extensions: [CustomTheme(palette: LightPalette())],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: [CustomTheme(palette: DarkPalette())],
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    ),
  );
}
