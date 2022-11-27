import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration decorationField({String? hintText}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: GoogleFonts.montserrat(color: Colors.grey),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.black38),
        borderRadius: BorderRadius.circular(15)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.purple),
        borderRadius: BorderRadius.circular(15)),
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.purple),
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
