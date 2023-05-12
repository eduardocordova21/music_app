import 'package:flutter/material.dart';
import 'package:music_app/core/app/music_app_text_style.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const TextWidget(
      {super.key, required this.text, this.textStyle, this.textAlign});

  TextWidget.bold(this.text, {super.key, TextStyle? textStyle, this.textAlign})
      : textStyle = textStyle ?? MusicAppTextStyle.normalBoldStyle;

  TextWidget.title(this.text, {super.key, TextStyle? textStyle, this.textAlign})
      : textStyle = textStyle ?? MusicAppTextStyle.titleStyle;

  TextWidget.normal(this.text,
      {super.key, TextStyle? textStyle, this.textAlign})
      : textStyle = textStyle ?? MusicAppTextStyle.normalStyle;

  TextWidget.small(this.text, {super.key, TextStyle? textStyle, this.textAlign})
      : textStyle = textStyle ?? MusicAppTextStyle.smallStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
