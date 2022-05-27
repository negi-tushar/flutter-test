import 'package:flutter/material.dart';
import 'package:fluttertest/Screens/add_user_screen.dart';
import 'package:fluttertest/Screens/homescreen.dart';
import 'package:fluttertest/Screens/login_screen.dart';
import 'package:fluttertest/Screens/settings.dart';
import 'package:fluttertest/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'helper/dbhelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DBhelper.database();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => UserProvider()),
      child: MaterialApp(
        title: 'Flutter test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          MySetting.id: (context) => const MySetting(),
          AddUsers.id: (context) => const AddUsers(),
          LoginPage.id: (context) => LoginPage(),
        },
      ),
    );
  }
}
