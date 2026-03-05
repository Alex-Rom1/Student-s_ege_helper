import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_ege_helper/presentation/theme/extension.dart';
import 'package:students_ege_helper/presentation/typography/custom_styles.dart';

class CustomInput extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController controller;

  const CustomInput({
    super.key,
    this.label,
    this.hint,
    required this.controller,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return Column(
      spacing: 8.h,
      crossAxisAlignment: .start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: CustomStyles.nunitoMedium14.copyWith(
              color: theme.palette.text,
            ),
          ),
        TextField(
          controller: widget.controller,
          cursorWidth: 2.w,
          cursorHeight: 20.h,
          cursorColor: theme.palette.accent,
          style: CustomStyles.nunitoRegular12,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: theme.palette.bloc,
            contentPadding: .symmetric(horizontal: 12.w, vertical: 16.h),
            hintText: widget.hint,
            hintStyle: CustomStyles.nunitoRegular12.copyWith(
              color: theme.palette.hint,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: .circular(10.r),
              borderSide: BorderSide(width: 1.r, color: theme.palette.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: .circular(10.r),
              borderSide: BorderSide(width: 1.r, color: theme.palette.border),
            ),
          ),
        ),
      ],
    );
  }
}
