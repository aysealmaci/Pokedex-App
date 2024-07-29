import 'package:flutter/material.dart';
import 'package:pokedex_app/const/colors.dart';
import 'package:pokedex_app/const/sizes.dart';

class PokedexTheme {
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seedColor),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor, 
       titleTextStyle: TextStyle(
        color: AppColors.appBarTitle,
        fontSize: CustomSize.fontSizeextraLarge,
        fontWeight: FontWeight.w500 ,       
       )
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor, 
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.navBarUnselectedItemColor, 
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), 
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal), 
    ),
    );
  }
}
