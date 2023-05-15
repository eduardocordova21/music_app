import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ImageWidget extends StatelessWidget {
  final String? img;
  final double width;
  final double height;

  const ImageWidget(
      {super.key, this.img, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return img != null
        ? FadeInImage(
            placeholder:
                const AssetImage("assets/images/music_placeholder.png"),
            image: AssetImage(img!),
            fit: BoxFit.cover,
            width: width,
            height: height,
          )
        : Image.asset(
            "assets/images/music_placeholder.png",
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
  }
}
