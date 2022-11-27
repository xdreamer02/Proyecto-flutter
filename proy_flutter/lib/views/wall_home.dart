import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/widgets/index.dart';

class WallPage extends StatefulWidget {
  const WallPage({super.key});

  @override
  State<WallPage> createState() => _WallPageState();
}

class _WallPageState extends State<WallPage> {
  int _lastItem = 0;

  List<int> images = [];

  List<ImageModel> imageNews = Preferences.imageNews;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregarElements();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.black,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Nuevos',
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ListImageFirestore(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Colecciones Populares',
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 200,
                                child: FadeInImage(
                                  placeholder: AssetImage('assets/loading.gif'),
                                  image: NetworkImage(
                                      'https://picsum.photos/210/230?=${images[index]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ))),
                ),
                Text('Popular',
                    style: GoogleFonts.montserrat(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: double.infinity,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: images.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      child: FadeInImage(
                        placeholder: AssetImage('assets/loading.gif'),
                        image: NetworkImage(
                            'https://picsum.photos/200/300?=${images[index]}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  void _agregarElements() {
    for (var i = 0; i < 30; i++) {
      _lastItem++;

      images.add(_lastItem);

      setState(() {});
    }
  }
}
