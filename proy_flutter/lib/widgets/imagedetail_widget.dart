import 'package:flutter/material.dart';
import 'package:proy_flutter/widgets/index.dart';

class ImageDetailWidget extends StatelessWidget {
  final String? url;
  final String? favorites;
  final String? date;
  final Function? onTap;

  const ImageDetailWidget({
    Key? key,
    this.url = 'https://picsum.photos/200/300',
    this.favorites = '',
    this.date = '',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(children: [
        ImageLoadingWidget(url: url),
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
