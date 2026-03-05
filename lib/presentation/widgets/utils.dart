import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_ege_helper/presentation/theme/extension.dart';
import 'package:students_ege_helper/presentation/theme/palette.dart';

class MaterialAppWrapper extends StatelessWidget {
  final List<Widget> Function(BuildContext) buildWidgets;

  const MaterialAppWrapper({super.key, required this.buildWidgets});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: .new(376, 832),
    child: MaterialApp(
      theme: ThemeData.light().copyWith(
        extensions: [CustomTheme(palette: LightPalette())],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: [CustomTheme(palette: DarkPalette())],
      ),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) {
          final theme = CustomTheme.of(context);

          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: theme.palette.background,
            body: Padding(
              padding: MediaQuery.paddingOf(context),
              child: Column(
                crossAxisAlignment: .center,
                spacing: 20.h,
                children: buildWidgets(context),
              ),
            ),
          );
        },
      ),
    ),
  );
}
