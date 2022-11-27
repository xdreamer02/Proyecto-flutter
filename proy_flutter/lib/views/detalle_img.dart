import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:proy_flutter/services/msg_auth.dart';
import 'package:proy_flutter/widgets/carrusel.dart';

class DetalleImg extends StatefulWidget {
  const DetalleImg({super.key});

  @override
  State<DetalleImg> createState() => _DetalleImgState();
}

class _DetalleImgState extends State<DetalleImg> {
  @override
  Widget build(BuildContext context) {
    final numero = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.black.withOpacity(0.8),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.99,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                    tag: numero as int,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 600,
                        child: FadeInImage(
                          placeholder: AssetImage('assets/loading.gif'),
                          image: NetworkImage(
                              //'https://picsum.photos/ancho/alto=$numero'
                              'https://picsum.photos/350/550?=$numero'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                child: Icon(Icons.save_alt),
                onPressed: () async {
                  try {
                    // Saved with this method.
                    var imageId = await ImageDownloader.downloadImage(
                        'https://picsum.photos/350/550?=$numero');
                    MsgAuth.verSnackbar('Descargado');

                    if (imageId == null) {
                      return;
                    }
                  } on PlatformException catch (error) {
                    print(error);
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: CarruselPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
