import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_ege_helper/presentation/theme/extension.dart';
import 'package:students_ege_helper/presentation/typography/custom_styles.dart';

enum CustomButtonType { standart, simple, icon }

class CustomButton extends StatelessWidget {
  final CustomButtonType type;
  final String? text;
  final Icon? icon;
  final Function()? onPressed;

  const CustomButton({
    super.key,
    required this.type,
    this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return switch (type) {
      .simple || .standart => FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          padding: .all(10.r),
          backgroundColor: type == .standart
              ? theme.palette.accent
              : theme.palette.bloc,
          disabledBackgroundColor: null,
          shape: RoundedRectangleBorder(
            borderRadius: .circular(10.r),
            side: BorderSide(color: theme.palette.border, width: 1.r),
          ),
        ),
        child: Text(
          text!,
          style: CustomStyles.nunitoMedium18.copyWith(
            color: theme.palette.text,
          ),
        ),
      ),
      .icon => FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          padding: .all(8.r),
          backgroundColor: theme.palette.bloc,
          shape: RoundedRectangleBorder(borderRadius: .circular(10.r)),
        ),
        child: icon,
      ),
    };
  }
}
