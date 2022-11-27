import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:proy_flutter/firebase_options.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/providers/index.dart';
import 'package:proy_flutter/routes/routes.dart';
import 'package:proy_flutter/services/index.dart';
import 'package:proy_flutter/views/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Preferences.theme)),
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
      ),
      ChangeNotifierProvider(create: (_) => AuthService()),
      ChangeNotifierProvider(create: (_) => ImageAppProvider()),
      ChangeNotifierProvider(create: (_) => GalleryService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Store',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      scaffoldMessengerKey: MsgAuth.msgKEY,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rLogin,
      routes: {
        'detalle': (BuildContext context) => DetalleImg(),
      },
      builder: EasyLoading.init(),
      //home: const HomePage(),
    );
  }
}
