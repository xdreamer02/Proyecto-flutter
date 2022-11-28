import 'package:flutter/material.dart';
import 'package:proy_flutter/preferences/preferences.dart';

InputDecoration decorationField({String? hintText}) {
  return InputDecoration(
    filled: true,
    fillColor: Preferences.theme ? Colors.black26 : Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: Preferences.theme ? 0 : 2,
            color: Preferences.theme ? Colors.black26 : Colors.black38),
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
