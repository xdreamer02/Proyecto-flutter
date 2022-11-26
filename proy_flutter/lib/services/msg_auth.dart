import 'package:flutter/material.dart';

class MsgAuth {
  static GlobalKey<ScaffoldMessengerState> msgKEY =
      GlobalKey<ScaffoldMessengerState>();

  static verSnackbar(
    String msg,
  ) {
    final snakbar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          msg,
          style: TextStyle(color: Colors.white),
        ));

    msgKEY.currentState!.showSnackBar(snakbar);
  }

  static verSnackbarStateColor(
      {required String msg, Color? color = Colors.green}) {
    final snakbar = SnackBar(
        backgroundColor: color,
        content: Text(
          msg,
          style: const TextStyle(color: Colors.white),
        ));

    msgKEY.currentState!.showSnackBar(snakbar);
  }
}
