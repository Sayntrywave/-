import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  // Font of the app
  static const String _baseFontFamily = 'Roboto'; // TODO Set custom font

  static final TextStyle _baseStyle = TextStyle(
    fontFamily: _baseFontFamily,
  );

  static final TextStyle mainHeadline = _baseStyle.copyWith(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static final TextStyle subHeadline = _baseStyle.copyWith(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static final TextStyle mainText = _baseStyle.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );

  static final TextStyle subText = _baseStyle.copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.technical,
  );
}
