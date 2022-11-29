import 'package:flutter/material.dart';
import 'package:proy_flutter/main.dart';
import 'package:proy_flutter/views/index.dart';

class MyRoutes {
  static const String rHome = '/home';
  static const String rAjuste = '/ajuste';
  static const String rPerfil = '/perfil';
  static const String rLogin = '/login';
  static const String rRegister = '/register';
  static const String rUpload = '/upload';
  static const String rVerify = '/verify';
  static const String rDetalles = '/details';
  static const String rSplash = '/splash';
  static const String rEditProfile = '/edit-profile';

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
      case ('/verify'):
        return MaterialPageRoute(builder: (_) => const VerifyAuthScreen());

      case ('/splash'):
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case ('/edit-profile'):
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
