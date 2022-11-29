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
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
           SizedBox(
            height: 10,
          ),
          Text('Terminos y servicio'),
          SizedBox(
            height: 20,
          ),
          Text('Politica de privacidad'),
            SizedBox(
            height: 20,
          ),
          Text('DMCA'),
            SizedBox(
            height: 20,
          ),
          Text('Sobre la aplicación'),



      ]
      ),
        drawer: customDrawerW(),
    );
  }
}