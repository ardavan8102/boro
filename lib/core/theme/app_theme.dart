import 'package:boro/core/theme/button_styles.dart';
import 'package:boro/core/theme/typography.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(

    fontFamily: 'Boro',

    // texts
    textTheme: TextTheme(

      // headlines
      headlineLarge: AppTypography.bigHeadlineStyle,

      // bodies
      bodyMedium: AppTypography.mediumBodyStyle,


      // labels
      labelLarge: AppTypography.largeLabelStyle,
      labelMedium: AppTypography.mediumLabelStyle,

    ),

    // buttons
    elevatedButtonTheme: ButtonStyles.elevatedButtonTheme,

  );

}