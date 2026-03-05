import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStyles {
  const CustomStyles._();

  static const String _nunitoFamily = 'Nunito';
  static const String _package = 'students_ege_helper';

  static TextStyle get nunitoBold32 => TextStyle(
    package: _package,
    fontFamily: _nunitoFamily,
    fontSize: 32.sp,
    fontWeight: .w700,
  );
  static TextStyle get nunitoMedium18 => TextStyle(
    package: _package,
    fontFamily: _nunitoFamily,
    fontSize: 18.sp,
    fontWeight: .w500,
  );
  static TextStyle get nunitoMedium14 => TextStyle(
    package: _package,
    fontFamily: _nunitoFamily,
    fontSize: 14.sp,
    fontWeight: .w500,
  );
  static TextStyle get nunitoRegular12 => TextStyle(
    package: _package,
    fontFamily: _nunitoFamily,
    fontSize: 12.sp,
    fontWeight: .w400,
  );

  static Map<String, TextStyle> get stylesMap => {
    'Nunito Bold 32' : nunitoBold32,
    'Nunito Medium 18' : nunitoMedium18,
    'Nunito Medium 14' : nunitoMedium14,
    'Nunito Regular 12' : nunitoRegular12,
  };
}