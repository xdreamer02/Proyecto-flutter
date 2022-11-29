import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proy_flutter/firebase_options.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/providers/index.dart';
import 'package:proy_flutter/routes/routes.dart';
import 'package:proy_flutter/services/index.dart';
import 'package:proy_flutter/services/profile_service.dart';
import 'package:proy_flutter/views/index.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ChangeNotifierProvider(create: (_) => ProfileService()),
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
      initialRoute: MyRoutes.rSplash,
      routes: {
        'detalle': (BuildContext context) => DetalleImg(),
      },
      builder: EasyLoading.init(),
      //home: const HomePage(),
    );
  }
}

//Splash scren flutter
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, MyRoutes.rLogin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red, Colors.purple, Colors.blueAccent]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icon/500.png'),
              width: 500,
              height: 200,
            ),
            Text(
              'StoreGallery',
              style: GoogleFonts.montserrat(fontSize: 50, color: Colors.white),
            ),
            SizedBox(
              height: 90,
            ),
            SpinKitFadingFour(
              color: Colors.white,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}
