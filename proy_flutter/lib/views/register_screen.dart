import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.99,
          decoration: BoxDecoration(
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
                SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      style: GoogleFonts.montserrat(color: Colors.black),
                      autocorrect: false,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: _buildDecoration(
                          hintText: 'User name',
                          prefixIcon: Icon(
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
                          prefixIcon: const Icon(Icons.email_outlined,
                              color: Colors.grey)),
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
                            color: Colors.grey,
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
                        disabledColor: Colors.green,
                        elevation: 1,
                        onPressed: () {},
                        child: Text(
                          'REGISTRAR',
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
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
        contentPadding: EdgeInsets.all(18));
  }
}
