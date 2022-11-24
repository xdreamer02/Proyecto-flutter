import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:proy_flutter/providers/login_provider.dart';
import 'package:proy_flutter/routes/routes.dart';
import 'package:proy_flutter/services/auth_service.dart';

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.99,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.black, Colors.purple, Colors.red])),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    child: Lottie.network(
                        'https://assets3.lottiefiles.com/packages/lf20_jcikwtux.json'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ChangeNotifierProvider(
                      create: (context) => LoginProvider(),
                      child: const _form()),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, MyRoutes.rLogin);
                      },
                      child: const Text(
                        'Iniciar Sesion',
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration _buildDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.purple),
          borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.purple),
          borderRadius: BorderRadius.circular(15)),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.purple),
        borderRadius: BorderRadius.circular(15),
      ),
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: GoogleFonts.montserrat(color: Colors.grey),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.all(18));
}

class _form extends StatefulWidget {
  const _form({super.key});

  @override
  State<_form> createState() => __formState();
}

class __formState extends State<_form> {
  bool _isPassword = true;

  void _viewPassword() {
    setState(() {
      _isPassword = !_isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return SizedBox(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            style: GoogleFonts.montserrat(color: Colors.black),
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: _buildDecoration(
                hintText: 'User name',
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            style: GoogleFonts.montserrat(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: _buildDecoration(
                hintText: 'dev@flutter.com',
                prefixIcon:
                    const Icon(Icons.email_outlined, color: Colors.grey)),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            style: GoogleFonts.montserrat(color: Colors.black),
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: _buildDecoration(
                hintText: '******',
                prefixIcon: const Icon(
                  Icons.key,
                  color: Colors.grey,
                ),
                suffixIcon: InkWell(
                  child: Icon(
                      _isPassword ? Icons.visibility : Icons.visibility_off),
                  onTap: () {
                    _viewPassword();
                  },
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 60,
            width: 250,
            child: MaterialButton(
              color: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              disabledColor: Colors.purple,
              elevation: 1,
              onPressed: loginProvider.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();

                      final authService =
                          Provider.of<AuthService>(context, listen: false);

                      if (!loginProvider.isValidForm()) return;

                      loginProvider.isLoading = true;

                      final String? errorMessage = await authService.createUser(
                          loginProvider.email, loginProvider.password);

                      if (errorMessage == null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(context, MyRoutes.rHome);
                      } else {
                        loginProvider.isLoading = false;
                      }
                    },
              child: Text(
                'REGISTRAR',
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      )),
    );
  }
}
