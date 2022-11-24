import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proy_flutter/widgets/custom_Drawer.dart';
import 'package:proy_flutter/views/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  TabController? _controlller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controlller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controlller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fondos de pantalla'),
        centerTitle: true,
      ),
      drawer: customDrawerW(),
      body: Column(
        children: [
          Material(
            child: TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.black,
              controller: _controlller,
              tabs: [
                Tab(
                  child: Container(
                    child: Text('Inicio'),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text('Categorias'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _controlller, children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  child: WallPage()),
              categoryScreen()
            ]),
          )
        ],
      ),
    );
  }
}
