import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proy_flutter/widgets/index.dart';

class AvatarSmartWidget extends StatelessWidget {
  final String image;
  final String text;
  final double radius;
  const AvatarSmartWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return image == ''
        ? AvatarDefaultWidget(initialCharacters: text, radius: radius)
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: radius * 2,
              height: radius * 2,
              placeholder: (context, url) => Image.asset('assets/loading.gif'),
              imageUrl: image,
            ),
          );
  }
}
