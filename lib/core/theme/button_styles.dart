import 'package:boro/core/consts/colors.dart';
import 'package:boro/core/consts/dimens.dart';
import 'package:flutter/material.dart';

class ButtonStyles {

  ButtonStyles._();


  // elevated buttons
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: WidgetStateProperty.resolveWith((states) {

        if ( states.contains(WidgetState.pressed)) {
          return AppColors.buttonClicked;
        }

        return AppColors.primary; // --> default state

      }),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppDimens.medium),
        ),
      ),
      fixedSize: const WidgetStatePropertyAll(
        Size(
          double.infinity,
          70
        )
      ),
    ),
  );

}