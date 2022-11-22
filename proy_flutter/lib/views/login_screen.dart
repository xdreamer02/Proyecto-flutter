import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proy_flutter/providers/login_provider.dart';
import 'package:proy_flutter/routes/routes.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov_login = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Lottie.network(
                    'https://assets6.lottiefiles.com/packages/lf20_L7YrbxFm46.json'),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              prefixIcon: const Icon(Icons.email_outlined,
                                  color: Colors.green)),
                          onChanged: (value) => prov_login.email = value,
                          validator: (value) {
                            String caracteres =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = RegExp(caracteres);
                            return regExp.hasMatch(value ?? '')
                                ? null
                                : 'Coreo invalido';
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
                              prefixIcon: Icon(
                                Icons.key,
                                color: Colors.green,
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
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            disabledColor: Colors.green,
                            elevation: 1,
                            onPressed: prov_login.isLoading
                                ? null
                                : () async {
                                    FocusScope.of(context).unfocus();

                                    if (!prov_login.isValidForm()) return;

                                    prov_login.isLoading = true;
                                    await Future.delayed(
                                        const Duration(seconds: 3));

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
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildDecoration({
    final String? hintText,
    final Widget? prefixIcon,
  }) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.green),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.green),
            borderRadius: BorderRadius.circular(15)),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(color: Colors.grey),
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.all(18));
  }
}
