import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/routes/routes.dart';
import 'package:proy_flutter/views/config.dart';
import 'package:proy_flutter/views/home.dart';
import 'package:proy_flutter/widgets/index.dart';

class customDrawerW extends StatelessWidget {
  const customDrawerW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    AvatarSmartWidget(
                        image: Preferences.image,
                        text: Preferences.initialCharacters,
                        radius: 48),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Preferences.name,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.white),
                        ),
                        Text(
                          Preferences.emailShort,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.white),
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
                    style: styleListTile(),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, MyRoutes.rHome);
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
                    style: styleListTile(),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, MyRoutes.rUpload, (route) => false);
                  },
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
                    'Opciones',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Preferences.theme
                            ? Colors.white
                            : Colors.black.withOpacity(0.7)),
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
                    style: styleListTile(),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, MyRoutes.rPerfil);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.help,
                    size: 30,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Ayuda',
                    style: styleListTile(),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, MyRoutes.rAyuda);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.info,
                    size: 30,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Informacion',
                    style: styleListTile(),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, MyRoutes.rInfo);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Ajustes',
                    style: styleListTile(),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, MyRoutes.rAjuste);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextStyle styleListTile() {
    return GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color:
            Preferences.theme ? Colors.white70 : Colors.black.withOpacity(0.5));
  }
}
