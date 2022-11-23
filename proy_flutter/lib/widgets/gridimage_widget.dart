import 'package:flutter/material.dart';

class GridImageWidget extends StatelessWidget {
  const GridImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 2,
      children: const [
        ImageWidget(),
        ImageWidget(),
        ImageWidget(),
        ImageWidget(),
        ImageWidget(),
        ImageWidget(),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '12-12-2022',
          textAlign: TextAlign.end,
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: Image.asset(
        'assets/wallpaper.jpeg',
        fit: BoxFit.cover,
      ),
    );
  }
}
