import 'package:flutter/material.dart';

void showSnackBar(String title, context) {
  final snackbar = SnackBar(
      backgroundColor: Colors.blueGrey,
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15.0),
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
