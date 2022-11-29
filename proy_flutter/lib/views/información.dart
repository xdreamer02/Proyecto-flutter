import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_Drawer.dart';

class InfoApp extends StatelessWidget {
  const InfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Terminos y servicio',
            style: _styleText(),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Politica de privacidad', style: _styleText()),
          SizedBox(
            height: 20,
          ),
          Text('DMCA', style: _styleText()),
          SizedBox(
            height: 20,
          ),
          Text('Sobre la aplicación', style: _styleText()),
        ]),
      ),
      drawer: customDrawerW(),
    );
  }

  TextStyle _styleText() => TextStyle(fontSize: 20);
}
