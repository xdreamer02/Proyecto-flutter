import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proy_flutter/models/image_model.dart';

class GridImageLocalWidget extends StatelessWidget {
  final List<ImageModel> images;
  final Function? onTapImage;

  const GridImageLocalWidget(
      {super.key, required this.images, this.onTapImage});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 2,
      children: images
          .map((e) => _ImageWidget(
                date: e.date,
                favorites: e.favorites,
                url: e.path,
              ))
          .toList(),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  final String? url;
  final String? favorites;
  final String? date;
  final Function? onTap;

  const _ImageWidget({
    Key? key,
    this.url = 'https://picsum.photos/200/300',
    this.favorites = '1.12K',
    this.date = '12/12/2022',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(children: [
        Image.file(
          File(url!),
          height: 240,
          width: 200,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.black45,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.purple,
                  ),
                  Expanded(
                    child: Text(
                      favorites!,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    date!,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
