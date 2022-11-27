import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CatImages extends StatefulWidget {
  const CatImages({super.key});

  @override
  State<CatImages> createState() => _CatImagesState();
}

class _CatImagesState extends State<CatImages> {
  int _lastItem = 0;

  List<int> images = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregarElements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle cat'),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.99,
          width: double.infinity,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: images.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detalle',
                        arguments: images[index]);
                  },
                  child: Hero(
                    tag: images[index],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        child: FadeInImage(
                          placeholder: AssetImage('assets/loading.gif'),
                          image: NetworkImage(
                              'https://picsum.photos/350/550?=${images[index]}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  void _agregarElements() {
    for (var i = 0; i < 50; i++) {
      _lastItem++;

      images.add(_lastItem);

      setState(() {});
    }
  }
}
