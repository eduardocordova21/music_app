import 'package:flutter/material.dart';
import 'package:music_app/core/app/music_app_colors.dart';

class MusicAppTextStyle {
  MusicAppTextStyle._();

  static TextStyle get normalStyle =>
      TextStyle(fontSize: 16, color: MusicAppColors.secondaryColor);

  static TextStyle get normalBoldStyle =>
      normalStyle.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get titleStyle => normalBoldStyle.copyWith(fontSize: 24);

  static TextStyle get smallStyle => normalStyle.copyWith(fontSize: 12);
}
