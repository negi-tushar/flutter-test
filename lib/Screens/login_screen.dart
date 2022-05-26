// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertest/Screens/homescreen.dart';
import 'package:fluttertest/helper/auth.dart';
import 'package:fluttertest/widgets/custom_text_field.dart';
import 'package:fluttertest/widgets/showsnackbar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static const id = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  controller: emailController,
                  hinttext: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  controller: passwordController,
                  hinttext: 'Password',
                  obsecure: true,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () async {
                      String res = await Authenticatelogin.authenticate(
                          emailController.text, passwordController.text);
                      print(res);
                      if (res == "Success") {
                        showSnackBar('Successfully Logged In', context);
                        Navigator.pushNamed(context, HomeScreen.id);
                      } else {
                        showSnackBar(
                            'Error Occured! Please Try again', context);
                      }
                    },
                    child: const Text('Login'))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
