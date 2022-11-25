import 'package:flutter/material.dart';
import 'package:proy_flutter/views/index.dart';

class MyRoutes {
  static const String rHome = '/home';
  static const String rAjuste = '/ajuste';
  static const String rPerfil = '/perfil';
  static const String rLogin = '/login';

  static const String rRegister = '/register';
  static const String rUpload = '/upload';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomePage());
      case ('/ajuste'):
        return MaterialPageRoute(builder: (_) => const ConfigPage());
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const loginScreen());
      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case ('/register'):
        return MaterialPageRoute(builder: (_) => const registerScreen());
      case ('/upload'):
        return MaterialPageRoute(builder: (_) => const UploadScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
