import 'package:flutter/material.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:proy_flutter/widgets/imagedetail_widget.dart';

class GridImageWidget extends StatelessWidget {
  final List<ImageModel> images;
  final Function? onTapImage;

  const GridImageWidget({super.key, required this.images, this.onTapImage});

  @override
  Widget build(BuildContext context) {
    int index = 0;

    return GridView.count(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 2,
      children: images
          .map((e) => ImageDetailWidget(
                favorites: e.favorites,
                url: e.path,
              ))
          .toList(),
    );
  }
}
