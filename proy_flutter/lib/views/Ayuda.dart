import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_Drawer.dart';

class AyudaApp extends StatelessWidget {
  const AyudaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
         title: const Text('Ayuda'),
        centerTitle: true,
        
      ),
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
           SizedBox(
            height: 10,
          ),
          Text('Preguntas mas frecuentes'),
          SizedBox(
            height: 20,
          ),
          Text('Comentarios'),

      ]
      ),
        drawer: customDrawerW(),
    );
  }
}