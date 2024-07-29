import 'package:flutter/material.dart';
import 'package:pokedex_app/const/colors.dart';
import 'package:pokedex_app/const/sizes.dart';

class PokedexTheme {
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        background: AppColors.backgroundColor,
          seedColor: AppColors.primaryColor), 
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(CustomSize.appBarborderRadiusSize),
            bottomRight: Radius.circular(CustomSize.appBarborderRadiusSize)
          )
        )
      ),
    );
  }
}

