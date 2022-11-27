import 'package:flutter/material.dart';

class ImageLoadingWidget extends StatelessWidget {
  const ImageLoadingWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: NetworkImage(url!),
      height: 240,
      width: 200,
      fit: BoxFit.fill,
    );
  }
}
