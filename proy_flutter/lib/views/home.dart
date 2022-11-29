import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/routes/routes.dart';
import 'package:proy_flutter/services/auth_service.dart';
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
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fondos de pantalla'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                authService.logout();
                Preferences.logout();
                Navigator.pushReplacementNamed(context, MyRoutes.rLogin);
              },
              icon: Icon(
                Icons.logout,
                color: Preferences.theme ? Colors.white : Colors.red,
              ))
        ],
      ),
      drawer: const customDrawerW(),
      body: Column(
        children: [
          Material(
            child: TabBar(
              indicatorColor: Colors.green,
              labelColor: Preferences.theme ? Colors.white : Colors.black,
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
                  color: Colors.black,
                  child: const WallPage()),
              const categoryScreen()
            ]),
          )
        ],
      ),
    );
  }
}
