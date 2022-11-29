import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/providers/login_provider.dart';
import 'package:proy_flutter/routes/routes.dart';
import 'package:proy_flutter/services/auth_service.dart';
import 'package:proy_flutter/services/index.dart';

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black, Colors.purple, Colors.red])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    child: Lottie.asset('assets/register.json'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ChangeNotifierProvider(
                      create: (context) => LoginProvider(),
                      child: const _form()),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      child: Text(' Iniciar Sesion',
                          style: GoogleFonts.montserrat(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, MyRoutes.rLogin);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
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
          key: loginProvider.formKey,
          child: Column(
            children: [
              TextFormField(
                style: GoogleFonts.montserrat(color: Colors.black),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: _buildDecoration(
                    hintText: 'dev@flutter.com',
                    prefixIcon:
                        const Icon(Icons.email_outlined, color: Colors.grey)),
                onChanged: (value) => loginProvider.email = value,
                validator: (value) {
                  String caracteres =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(caracteres);
                  return regExp.hasMatch(value ?? '') ? null : 'Coreo invalido';
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: GoogleFonts.montserrat(color: Colors.black),
                autocorrect: false,
                obscureText: _isPassword,
                keyboardType: TextInputType.text,
                decoration: _buildDecoration(
                    hintText: '******',
                    prefixIcon: const Icon(
                      Icons.key,
                      color: Colors.grey,
                    ),
                    suffixIcon: InkWell(
                      child: Icon(_isPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onTap: () {
                        _viewPassword();
                      },
                    )),
                onChanged: (value) => loginProvider.password = value,
                validator: ((value) {
                  return (value != null && value.length >= 8)
                      ? null
                      : 'Debe tener minimo 8 caracteres';
                }),
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

                          final String? errorMessage =
                              await authService.createUser(
                                  loginProvider.email, loginProvider.password);

                          if (errorMessage == null) {
                            Preferences.email = loginProvider.email;

                            final profileService =
                                // ignore: use_build_context_synchronously
                                Provider.of<ProfileService>(context,
                                    listen: false);

                            final data = await profileService.loadData(
                                email: loginProvider.email);

                            if (data != null) {
                              Preferences.name = data["name"];
                              Preferences.profession = data["profession"];
                              Preferences.image = data["image"];
                              Preferences.country = data["country"];
                            } else {
                              Preferences.logout();
                            }

                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(
                                context, MyRoutes.rHome);
                          } else {
                            debugPrint(errorMessage);
                            loginProvider.isLoading = false;
                          }
                        },
                  child: (loginProvider.isLoading)
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'REGISTRAR',
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ],
          )),
    );
  }
}

InputDecoration _buildDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
      errorStyle: const TextStyle(fontSize: 15, color: Colors.white60),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.purple),
          borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.purple),
          borderRadius: BorderRadius.circular(15)),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.purple),
        borderRadius: BorderRadius.circular(15),
      ),
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: GoogleFonts.montserrat(color: Colors.grey),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.all(18));
}
