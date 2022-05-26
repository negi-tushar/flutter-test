import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hinttext,
    this.obsecure = false,
    this.textInputType = TextInputType.emailAddress,
  }) : super(key: key);
  final TextEditingController controller;
  final String hinttext;
  final bool? obsecure;
  final TextInputType? textInputType;
  // final String Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      obscureText: obsecure!,
    );
  }
}
