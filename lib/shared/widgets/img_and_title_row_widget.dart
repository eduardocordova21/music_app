import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:music_app/core/app/music_app_colors.dart';
import 'package:music_app/core/app/music_app_text_style.dart';
import 'package:music_app/shared/widgets/text_widget.dart';

import 'image_widget.dart';

class ImgAndTitleRowWidget extends StatelessWidget {
  final String? heroTag;
  final String? img;
  final String title;
  final Color? titleColor;

  const ImgAndTitleRowWidget(
      {super.key,
      this.heroTag,
      this.img,
      required this.title,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: heroTag ?? "",
          child: ImageWidget(
            img: img,
            width: 80,
            height: 80,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextWidget.normal(
            title,
            textStyle: MusicAppTextStyle.normalStyle
                .copyWith(color: titleColor ?? MusicAppColors.secondaryColor),
          ),
        ),
      ],
    );
  }
}
