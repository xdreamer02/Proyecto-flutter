import 'package:flutter/material.dart';
import 'package:proy_flutter/widgets/custom_Drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: customDrawerW(),
      body: Text('Lsitados'),
    );
  }
}
