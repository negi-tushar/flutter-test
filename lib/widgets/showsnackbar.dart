import 'package:flutter/material.dart';

void showSnackBar(String title, context) {
  final snackbar = SnackBar(
    duration: const Duration(seconds: 1),
    backgroundColor: Colors.blueGrey,
    content: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15.0),
    ),
    dismissDirection: DismissDirection.endToStart,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
