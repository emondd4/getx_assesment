import 'package:flutter/material.dart';

import 'AppColorUtil.dart';

class AppColors{
  static AppColors instance = AppColors();

  ///Common Color Palette
  static MaterialColor get appPrimarySwatch => ColorUtil.instance.generateMaterialColor(color: const Color(0xFF07A4B5));

  //StatusBar
  Color get statusBarColor => const Color(0xFFF3AF54);

  //StatusBar
  Color get appPrimary => const Color(0xFFC9EFF9);

  //AppBar
  Color get appBarColor => const Color(0xFFFED8A7);

  //Background
  Color get appGreyBackground => const Color(0xFFF9FCFD);

  //TextColor
  Color get textColor => const Color(0xFF191C24);
  Color get textFadeColor => const Color(0xFF2A2A2C);
  Color get textColorReverse => Colors.white;



  /// Colors By Name
  Color get yellow => const Color(0xFFFFB74D);
  Color get orange => const Color(0xFFFF5C3A);
  Color get green => const Color(0xFF4DB948);

}