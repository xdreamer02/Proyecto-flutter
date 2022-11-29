import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/widgets/index.dart';

class GridImageFirestoreWidget extends StatelessWidget {
  const GridImageFirestoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('images')
            .where("email", isEqualTo: Preferences.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No tienes imagenes',
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          final data = snapshot.data!;

          return GridView.count(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              crossAxisCount: 2,
              children: List.generate(data.docs.length, (index) {
                final item = data.docs[index];

                return _ImageWidget(
                  date: item["date"],
                  favorites: item["favorites"],
                  url: item["path"],
                );
              }));
        });
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
