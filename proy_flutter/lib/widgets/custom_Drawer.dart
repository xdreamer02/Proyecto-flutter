import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proy_flutter/routes/routes.dart';
import 'package:proy_flutter/views/config.dart';
import 'package:proy_flutter/views/home.dart';

class customDrawerW extends StatelessWidget {
  const customDrawerW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red, Colors.purple, Colors.black]),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 48, // Image radius
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_960_720.jpg'),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'User',
                          style: TextStyle(fontSize: 26, color: Colors.white),
                        ),
                        Text(
                          'E-mail',
                          style: TextStyle(fontSize: 26, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 0,
                  thickness: 0.8,
                  indent: 30,
                  endIndent: 30,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.image,
                    color: Colors.grey,
                    size: 30,
                  ),
                  title: Text(
                    'Fondos de Pantalla',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.upload_file_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Sube tus imagenes',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  height: 0,
                  thickness: 0.8,
                  indent: 30,
                  endIndent: 30,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    'All labels',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7)),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Mi Perfil',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, MyRoutes.rPerfil);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Favoritos',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.help,
                    size: 30,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Ayuda',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.info,
                    size: 30,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Informacion',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Ajustes',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConfigPage(),
                        ));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
