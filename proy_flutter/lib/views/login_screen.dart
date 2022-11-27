import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proy_flutter/providers/login_provider.dart';
import 'package:proy_flutter/routes/routes.dart';
import 'package:proy_flutter/services/index.dart';
import 'package:proy_flutter/views/index.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red, Colors.purple, Colors.black])),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    /*                     child: Lottie.network(
                        'https://assets3.lottiefiles.com/packages/lf20_L7YrbxFm46.json'), */
                    child: Lottie.asset('assets/login.json'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ChangeNotifierProvider(
                      create: (context) => LoginProvider(),
                      child: const _LoginForm()),
                  const SizedBox(
                    height: 50,
                  ),
                  Text.rich(TextSpan(
                      text: 'No tienes cuenta aún ',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                            text: ' Registrate!',
                            style: GoogleFonts.montserrat(
                                color: Colors.blue,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            registerScreen()));
                              }),
                      ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool _isPass = false;

  void _viewPassword() {
    setState(() {
      _isPass = !_isPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov_login = Provider.of<LoginProvider>(context);

    return SizedBox(
      child: Form(
          key: prov_login.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  style: GoogleFonts.montserrat(color: Colors.black),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _buildDecoration(
                    hintText: 'dev@flutter.com',
                    prefixIcon:
                        const Icon(Icons.email_outlined, color: Colors.grey),
                  ),
                  onChanged: (value) => prov_login.email = value,
                  validator: (value) {
                    String caracteres =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(caracteres);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'Correo invalido';
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: GoogleFonts.montserrat(color: Colors.black),
                  autocorrect: false,
                  obscureText: _isPass,
                  keyboardType: TextInputType.text,
                  decoration: _buildDecoration(
                      hintText: '******',
                      prefixIcon: const Icon(
                        Icons.key,
                        color: Colors.grey,
                      ),
                      suffixIcon: InkWell(
                        child: Icon(
                            _isPass ? Icons.visibility : Icons.visibility_off),
                        onTap: () {
                          _viewPassword();
                        },
                      )),
                  onChanged: (value) => prov_login.password = value,
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
                    onPressed: prov_login.isLoading
                        ? null
                        : () async {
                            FocusScope.of(context).unfocus();

                            final authService = Provider.of<AuthService>(
                                context,
                                listen: false);

                            if (!prov_login.isValidForm()) return;

                            prov_login.isLoading = true;

                            final String? errorMessage = await authService
                                .login(prov_login.email, prov_login.password);

                            if (errorMessage == null) {
                              MsgAuth.verSnackbar('Bienvenido');
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(
                                  context, MyRoutes.rHome);
                            } else {
                              MsgAuth.verSnackbar('Email y/o clave invalida');
                              prov_login.isLoading = false;
                            }
                          },
                    child: (prov_login.isLoading)
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'INGRESAR',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ],
            ),
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
          borderSide: BorderSide(width: 2, color: Colors.black),
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
