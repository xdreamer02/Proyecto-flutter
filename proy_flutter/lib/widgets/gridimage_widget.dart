import 'package:flutter/material.dart';

class ImageApp {
  final String url;
  final String favorites;
  final String date;
  final String id;

  ImageApp(
    this.id,
    this.url,
    this.favorites,
    this.date,
  );
}

class GridImageWidget extends StatelessWidget {
  final List<ImageApp> images;
  final Function? onTapImage;

  const GridImageWidget({super.key, required this.images, this.onTapImage});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 2,
      children: images
          .map((e) => ImageWidget(
                date: e.date,
                favorites: e.favorites,
                url: e.url,
                onTap: () => onTapImage!(e.id),
              ))
          .toList(),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String? url;
  final String? favorites;
  final String? date;
  final Function? onTap;

  const ImageWidget({
    Key? key,
    this.url = 'https://picsum.photos/200/300',
    this.favorites = '1.12K',
    this.date = '12/12/2022',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Padding(
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
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Text(
              date!,
              textAlign: TextAlign.end,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      child: InkResponse(
        onTap: () => onTap!(),
        child: Image.network(
          url!,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
