import 'package:flutter/material.dart';
import 'package:fluttertest/Screens/login_screen.dart';
import 'package:fluttertest/widgets/setting_options.dart';

class MySetting extends StatefulWidget {
  const MySetting({Key? key}) : super(key: key);

  static const String id = "/setting";
  @override
  State<MySetting> createState() => _MySettingState();
}

bool allownotification = true;
bool darkTheme = true;

class _MySettingState extends State<MySetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Column(children: [
        SettingOptions(
          text: 'Allow Notifications',
          value: allownotification,
          onChanged: notificationMuted,
        ),
        SettingOptions(
          text: 'Dark Theme',
          value: darkTheme,
          onChanged: isdarktheme,
        ),
        //Spacer(),
        ListTile(
          tileColor: Colors.black12,
          leading: const Text(
            'Logout',
            style: TextStyle(fontSize: 18),
          ),
          trailing: const Icon(Icons.logout),
          onTap: () {
            Navigator.pushNamed(context, LoginPage.id);
          },
        )
      ]),
      // drawer: const CustomDrawer(),
    );
  }

  notificationMuted(bool val) {
    setState(() {
      allownotification = val;
    });
  }

  isdarktheme(bool val) {
    setState(() {
      darkTheme = val;
    });
  }
}
