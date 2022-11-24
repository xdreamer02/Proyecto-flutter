import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proy_flutter/providers/login_provider.dart';
import 'package:proy_flutter/routes/routes.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.99,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red, Colors.purple, Colors.black])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: Lottie.network(
                        'https://assets3.lottiefiles.com/packages/lf20_L7YrbxFm46.json'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _LoginForm(),
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
                  return regExp.hasMatch(value ?? '') ? null : 'Coreo invalido';
                },
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

                          if (!prov_login.isValidForm()) return;

                          prov_login.isLoading = true;
                          await Future.delayed(const Duration(seconds: 3));

                          prov_login.isLoading = false;

                          Navigator.pushReplacementNamed(
                              context, MyRoutes.rHome);
                        },
                  child: (prov_login.isLoading)
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'INGRESAR',
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
              SizedBox(
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
                                    builder: (context) => registerScreen()));
                          }),
                  ]))
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
